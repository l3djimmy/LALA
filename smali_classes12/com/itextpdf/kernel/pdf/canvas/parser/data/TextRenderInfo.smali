.class public Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
.super Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;
.source "TextRenderInfo.java"


# instance fields
.field private final canvasTagHierarchy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;"
        }
    .end annotation
.end field

.field private final string:Lcom/itextpdf/kernel/pdf/PdfString;

.field private text:Ljava/lang/String;

.field private final textMatrix:Lcom/itextpdf/kernel/geom/Matrix;

.field private final textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

.field private unscaledWidth:F


# direct methods
.method public constructor <init>(Lcom/itextpdf/kernel/pdf/PdfString;Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;Lcom/itextpdf/kernel/geom/Matrix;Ljava/util/Stack;)V
    .locals 1
    .param p1, "str"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "gs"    # Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;
    .param p3, "textMatrix"    # Lcom/itextpdf/kernel/geom/Matrix;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/itextpdf/kernel/pdf/PdfString;",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;",
            "Lcom/itextpdf/kernel/geom/Matrix;",
            "Ljava/util/Stack<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;)V"
        }
    .end annotation

    .line 76
    .local p4, "canvasTagHierarchy":Ljava/util/Stack;, "Ljava/util/Stack<Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;>;"
    invoke-direct {p0, p2}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    .line 60
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->unscaledWidth:F

    .line 77
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 78
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCtm()Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/itextpdf/kernel/geom/Matrix;->multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    .line 79
    iput-object p3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    .line 81
    return-void
.end method

.method private constructor <init>(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/pdf/PdfString;F)V
    .locals 2
    .param p1, "parent"    # Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    .param p2, "str"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p3, "horizontalOffset"    # F

    .line 91
    iget-object v0, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/AbstractRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;)V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    .line 60
    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->unscaledWidth:F

    .line 92
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 93
    new-instance v0, Lcom/itextpdf/kernel/geom/Matrix;

    const/4 v1, 0x0

    invoke-direct {v0, p3, v1}, Lcom/itextpdf/kernel/geom/Matrix;-><init>(FF)V

    .line 94
    .local v0, "offsetMatrix":Lcom/itextpdf/kernel/geom/Matrix;
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Matrix;->multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    .line 95
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/Matrix;->multiply(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/Matrix;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    .line 96
    iget-object v1, p1, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    .line 97
    return-void
.end method

.method private convertHeightFromTextSpaceToUserSpace(F)F
    .locals 5
    .param p1, "height"    # F

    .line 430
    new-instance v0, Lcom/itextpdf/kernel/geom/LineSegment;

    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v4, v2, p1, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    .line 431
    .local v0, "textSpace":Lcom/itextpdf/kernel/geom/LineSegment;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v1

    .line 432
    .local v1, "userSpace":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getLength()F

    move-result v2

    return v2
.end method

.method private convertWidthFromTextSpaceToUserSpace(F)F
    .locals 5
    .param p1, "width"    # F

    .line 420
    new-instance v0, Lcom/itextpdf/kernel/geom/LineSegment;

    new-instance v1, Lcom/itextpdf/kernel/geom/Vector;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v4, p1, v2, v3}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    invoke-direct {v0, v1, v4}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    .line 421
    .local v0, "textSpace":Lcom/itextpdf/kernel/geom/LineSegment;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v1

    .line 422
    .local v1, "userSpace":Lcom/itextpdf/kernel/geom/LineSegment;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/geom/LineSegment;->getLength()F

    move-result v2

    return v2
.end method

.method private getAscentDescent()[F
    .locals 5

    .line 539
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 540
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v0

    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontMetrics;->getTypoAscender()I

    move-result v0

    int-to-float v0, v0

    .line 541
    .local v0, "ascent":F
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontProgram;->getFontMetrics()Lcom/itextpdf/io/font/FontMetrics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/itextpdf/io/font/FontMetrics;->getTypoDescender()I

    move-result v1

    int-to-float v1, v1

    .line 544
    .local v1, "descent":F
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    .line 545
    neg-float v1, v1

    .line 548
    :cond_0
    sub-float v2, v0, v1

    const/high16 v3, 0x442f0000    # 700.0f

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    sub-float v2, v0, v1

    goto :goto_0

    :cond_1
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 549
    .local v2, "scale":F
    :goto_0
    div-float v3, v1, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v4

    mul-float/2addr v3, v4

    .line 550
    .end local v1    # "descent":F
    .local v3, "descent":F
    div-float v1, v0, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v4

    mul-float/2addr v1, v4

    .line 551
    .end local v0    # "ascent":F
    .local v1, "ascent":F
    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v4, 0x0

    aput v1, v0, v4

    const/4 v4, 0x1

    aput v3, v0, v4

    return-object v0
.end method

.method private getCharCode(Ljava/lang/String;)I
    .locals 4
    .param p1, "string"    # Ljava/lang/String;

    .line 496
    :try_start_0
    const-string v0, "UTF-16BE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 497
    .local v0, "b":[B
    const/4 v1, 0x0

    .line 498
    .local v1, "value":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_0

    .line 499
    aget-byte v3, v0, v2

    and-int/lit16 v3, v3, 0xff

    add-int/2addr v1, v3

    .line 500
    shl-int/lit8 v1, v1, 0x8

    .line 498
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 502
    .end local v2    # "i":I
    :cond_0
    array-length v2, v0

    if-lez v2, :cond_1

    .line 503
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, v0, v2
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 v2, v2, 0xff

    add-int/2addr v1, v2

    .line 505
    :cond_1
    return v1

    .line 506
    .end local v0    # "b":[B
    .end local v1    # "value":I
    :catch_0
    move-exception v0

    .line 508
    const/4 v0, 0x0

    return v0
.end method

.method private getPdfStringWidth(Lcom/itextpdf/kernel/pdf/PdfString;Z)F
    .locals 7
    .param p1, "string"    # Lcom/itextpdf/kernel/pdf/PdfString;
    .param p2, "singleCharString"    # Z

    .line 459
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 460
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_0

    .line 461
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getWidthAndWordSpacing(Lcom/itextpdf/kernel/pdf/PdfString;)[F

    move-result-object v2

    .line 462
    .local v2, "widthAndWordSpacing":[F
    aget v0, v2, v0

    float-to-double v3, v0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v0

    float-to-double v5, v0

    mul-double/2addr v3, v5

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v0

    float-to-double v5, v0

    add-double/2addr v3, v5

    aget v0, v2, v1

    float-to-double v0, v0

    add-double/2addr v3, v0

    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 463
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v0

    float-to-double v0, v0

    mul-double/2addr v3, v0

    const-wide/high16 v0, 0x4059000000000000L    # 100.0

    div-double/2addr v3, v0

    double-to-float v0, v3

    .line 462
    return v0

    .line 465
    .end local v2    # "widthAndWordSpacing":[F
    :cond_0
    const/4 v2, 0x0

    .line 466
    .local v2, "totalWidth":F
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->splitString(Lcom/itextpdf/kernel/pdf/PdfString;)[Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v3

    array-length v4, v3

    :goto_0
    if-ge v0, v4, :cond_1

    aget-object v5, v3, v0

    .line 467
    .local v5, "str":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-direct {p0, v5, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getPdfStringWidth(Lcom/itextpdf/kernel/pdf/PdfString;Z)F

    move-result v6

    add-float/2addr v2, v6

    .line 466
    .end local v5    # "str":Lcom/itextpdf/kernel/pdf/PdfString;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 469
    :cond_1
    return v2
.end method

.method private getUnscaledBaselineWithOffset(F)Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 6
    .param p1, "yOffset"    # F

    .line 404
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 407
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v0

    .line 409
    .local v0, "unicodeStr":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledWidth()F

    move-result v1

    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v2

    .line 410
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    if-lez v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v5, 0x20

    if-ne v3, v5, :cond_0

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getWordSpacing()F

    move-result v3

    goto :goto_0

    :cond_0
    move v3, v4

    :goto_0
    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v3

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v3, v5

    mul-float/2addr v2, v3

    sub-float/2addr v1, v2

    .line 412
    .local v1, "correctedUnscaledWidth":F
    new-instance v2, Lcom/itextpdf/kernel/geom/LineSegment;

    new-instance v3, Lcom/itextpdf/kernel/geom/Vector;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, p1, v5}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    new-instance v4, Lcom/itextpdf/kernel/geom/Vector;

    invoke-direct {v4, v1, p1, v5}, Lcom/itextpdf/kernel/geom/Vector;-><init>(FFF)V

    invoke-direct {v2, v3, v4}, Lcom/itextpdf/kernel/geom/LineSegment;-><init>(Lcom/itextpdf/kernel/geom/Vector;Lcom/itextpdf/kernel/geom/Vector;)V

    return-object v2
.end method

.method private getUnscaledFontSpaceWidth()F
    .locals 5

    .line 441
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 442
    const/16 v0, 0x20

    .line 443
    .local v0, "spaceChar":C
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/itextpdf/kernel/font/PdfFont;->getWidth(I)I

    move-result v1

    .line 444
    .local v1, "charWidth":I
    if-nez v1, :cond_0

    .line 445
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/kernel/font/PdfFont;->getFontProgram()Lcom/itextpdf/io/font/FontProgram;

    move-result-object v2

    invoke-virtual {v2}, Lcom/itextpdf/io/font/FontProgram;->getAvgWidth()I

    move-result v1

    .line 447
    :cond_0
    int-to-float v2, v1

    invoke-static {v2}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v2

    .line 448
    .local v2, "charWidthInGlyphSpace":F
    iget-object v3, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v3

    mul-float/2addr v3, v2

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v4

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getWordSpacing()F

    move-result v4

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 449
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v4

    mul-float/2addr v3, v4

    const/high16 v4, 0x42c80000    # 100.0f

    div-float/2addr v3, v4

    .line 448
    return v3
.end method

.method private getWidthAndWordSpacing(Lcom/itextpdf/kernel/pdf/PdfString;)[F
    .locals 4
    .param p1, "string"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 481
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 482
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    .line 483
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/font/PdfFont;->getContentWidth(Lcom/itextpdf/kernel/pdf/PdfString;)F

    move-result v0

    invoke-static {v0}, Lcom/itextpdf/io/font/FontProgram;->convertTextSpaceToGlyphSpace(F)F

    move-result v0

    .line 484
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getWordSpacing()F

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v0, v2, v3

    const/4 v0, 0x1

    aput v1, v2, v0

    .line 482
    return-object v2
.end method

.method private splitString(Lcom/itextpdf/kernel/pdf/PdfString;)[Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 7
    .param p1, "string"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 518
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 519
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    .line 520
    .local v0, "font":Lcom/itextpdf/kernel/font/PdfFont;
    instance-of v1, v0, Lcom/itextpdf/kernel/font/PdfType0Font;

    if-eqz v1, :cond_1

    .line 522
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 523
    .local v1, "strings":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfString;>;"
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/itextpdf/kernel/font/PdfFont;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v2

    .line 524
    .local v2, "glyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    iget v3, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    .local v3, "i":I
    :goto_0
    iget v4, v2, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    if-ge v3, v4, :cond_0

    .line 525
    new-instance v4, Lcom/itextpdf/kernel/pdf/PdfString;

    iget-object v5, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v5}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v5

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/itextpdf/kernel/font/PdfFont;->convertToBytes(Lcom/itextpdf/io/font/otf/Glyph;)[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>([B)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 527
    .end local v3    # "i":I
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/itextpdf/kernel/pdf/PdfString;

    return-object v3

    .line 530
    .end local v1    # "strings":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/PdfString;>;"
    .end local v2    # "glyphLine":Lcom/itextpdf/io/font/otf/GlyphLine;
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    new-array v1, v1, [Lcom/itextpdf/kernel/pdf/PdfString;

    .line 531
    .local v1, "strings":[Lcom/itextpdf/kernel/pdf/PdfString;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 532
    new-instance v3, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfString;->getEncoding()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v3, v1, v2

    .line 531
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 534
    .end local v2    # "i":I
    :cond_2
    return-object v1
.end method


# virtual methods
.method public getActualText()Ljava/lang/String;
    .locals 3

    .line 342
    const/4 v0, 0x0

    .line 343
    .local v0, "lastActualText":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 344
    .local v2, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getActualText()Ljava/lang/String;

    move-result-object v0

    .line 345
    if-eqz v0, :cond_0

    .line 346
    goto :goto_1

    .line 348
    .end local v2    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 349
    :cond_1
    :goto_1
    return-object v0
.end method

.method public getAscentLine()Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 2

    .line 209
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 210
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentDescent()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v1

    add-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledBaselineWithOffset(F)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    return-object v0
.end method

.method public getBaseline()Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 2

    .line 193
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 194
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v0

    const/4 v1, 0x0

    add-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledBaselineWithOffset(F)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    return-object v0
.end method

.method public getCanvasTagHierarchy()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;",
            ">;"
        }
    .end annotation

    .line 391
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    return-object v0
.end method

.method public getCharSpacing()F
    .locals 1

    .line 322
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 323
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v0

    return v0
.end method

.method public getCharacterRenderInfos()Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;",
            ">;"
        }
    .end annotation

    .line 254
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 255
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfString;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 256
    .local v0, "rslt":Ljava/util/List;, "Ljava/util/List<Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;>;"
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->splitString(Lcom/itextpdf/kernel/pdf/PdfString;)[Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v1

    .line 257
    .local v1, "strings":[Lcom/itextpdf/kernel/pdf/PdfString;
    const/4 v2, 0x0

    .line 258
    .local v2, "totalWidth":F
    array-length v3, v1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_0

    aget-object v6, v1, v5

    .line 259
    .local v6, "str":Lcom/itextpdf/kernel/pdf/PdfString;
    invoke-direct {p0, v6}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getWidthAndWordSpacing(Lcom/itextpdf/kernel/pdf/PdfString;)[F

    move-result-object v7

    .line 260
    .local v7, "widthAndWordSpacing":[F
    new-instance v8, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    invoke-direct {v8, p0, v6, v2}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;-><init>(Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;Lcom/itextpdf/kernel/pdf/PdfString;F)V

    .line 261
    .local v8, "subInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    aget v9, v7, v4

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v10

    mul-float/2addr v9, v10

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getCharSpacing()F

    move-result v10

    add-float/2addr v9, v10

    const/4 v10, 0x1

    aget v10, v7, v10

    add-float/2addr v9, v10

    iget-object v10, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v10}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v10

    const/high16 v11, 0x42c80000    # 100.0f

    div-float/2addr v10, v11

    mul-float/2addr v9, v10

    add-float/2addr v2, v9

    .line 258
    .end local v6    # "str":Lcom/itextpdf/kernel/pdf/PdfString;
    .end local v7    # "widthAndWordSpacing":[F
    .end local v8    # "subInfo":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 264
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;

    .line 265
    .local v4, "tri":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledWidth()F

    goto :goto_1

    .line 266
    .end local v4    # "tri":Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;
    :cond_1
    return-object v0
.end method

.method public getDescentLine()Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 2

    .line 220
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 221
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getAscentDescent()[F

    move-result-object v0

    const/4 v1, 0x1

    aget v0, v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v1

    add-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledBaselineWithOffset(F)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textToUserSpaceTransformMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/geom/LineSegment;->transformBy(Lcom/itextpdf/kernel/geom/Matrix;)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    return-object v0
.end method

.method public getExpansionText()Ljava/lang/String;
    .locals 3

    .line 358
    const/4 v0, 0x0

    .line 359
    .local v0, "expansionText":Ljava/lang/String;
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 360
    .local v2, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v2}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getExpansionText()Ljava/lang/String;

    move-result-object v0

    .line 361
    if-eqz v0, :cond_0

    .line 362
    goto :goto_1

    .line 364
    .end local v2    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 365
    :cond_1
    :goto_1
    return-object v0
.end method

.method public getFillColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 299
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 300
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFillColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getFont()Lcom/itextpdf/kernel/font/PdfFont;
    .locals 1

    .line 230
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 231
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    return-object v0
.end method

.method public getFontSize()F
    .locals 1

    .line 312
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 313
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFontSize()F

    move-result v0

    return v0
.end method

.method public getHorizontalScaling()F
    .locals 1

    .line 317
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 318
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getHorizontalScaling()F

    move-result v0

    return v0
.end method

.method public getLeading()F
    .locals 1

    .line 332
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 333
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getLeading()F

    move-result v0

    return v0
.end method

.method public getMcid()I
    .locals 3

    .line 178
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 179
    .local v1, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->hasMcid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 180
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getMcid()I

    move-result v0

    return v0

    .line 182
    .end local v1    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 183
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getPdfString()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    return-object v0
.end method

.method public getRise()F
    .locals 2

    .line 241
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 243
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return v1

    .line 245
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->convertHeightFromTextSpaceToUserSpace(F)F

    move-result v0

    return v0
.end method

.method public getSingleSpaceWidth()F
    .locals 1

    .line 273
    invoke-direct {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledFontSpaceWidth()F

    move-result v0

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->convertWidthFromTextSpaceToUserSpace(F)F

    move-result v0

    return v0
.end method

.method public getStrokeColor()Lcom/itextpdf/kernel/colors/Color;
    .locals 1

    .line 307
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 308
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getStrokeColor()Lcom/itextpdf/kernel/colors/Color;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 4

    .line 105
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 106
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 107
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getFont()Lcom/itextpdf/kernel/font/PdfFont;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/font/PdfFont;->decodeIntoGlyphLine(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/io/font/otf/GlyphLine;

    move-result-object v0

    .line 108
    .local v0, "gl":Lcom/itextpdf/io/font/otf/GlyphLine;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->isReversedChars()Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    iget v1, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    iget v2, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->toUnicodeString(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    goto :goto_1

    .line 111
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    iget v3, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    sub-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 112
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget v2, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->end:I

    add-int/lit8 v2, v2, -0x1

    .local v2, "i":I
    :goto_0
    iget v3, v0, Lcom/itextpdf/io/font/otf/GlyphLine;->start:I

    if-lt v2, v3, :cond_1

    .line 113
    invoke-virtual {v0, v2}, Lcom/itextpdf/io/font/otf/GlyphLine;->get(I)Lcom/itextpdf/io/font/otf/Glyph;

    move-result-object v3

    invoke-virtual {v3}, Lcom/itextpdf/io/font/otf/Glyph;->getUnicodeChars()[C

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 112
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 115
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    .line 118
    .end local v0    # "gl":Lcom/itextpdf/io/font/otf/GlyphLine;
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTextMatrix()Lcom/itextpdf/kernel/geom/Matrix;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->textMatrix:Lcom/itextpdf/kernel/geom/Matrix;

    return-object v0
.end method

.method public getTextRenderMode()I
    .locals 1

    .line 291
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 292
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRenderingMode()I

    move-result v0

    return v0
.end method

.method public getUnscaledBaseline()Lcom/itextpdf/kernel/geom/LineSegment;
    .locals 2

    .line 198
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 199
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getTextRise()F

    move-result v0

    const/4 v1, 0x0

    add-float/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getUnscaledBaselineWithOffset(F)Lcom/itextpdf/kernel/geom/LineSegment;

    move-result-object v0

    return-object v0
.end method

.method public getUnscaledWidth()F
    .locals 2

    .line 398
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->unscaledWidth:F

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->string:Lcom/itextpdf/kernel/pdf/PdfString;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getPdfStringWidth(Lcom/itextpdf/kernel/pdf/PdfString;Z)F

    move-result v0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->unscaledWidth:F

    .line 400
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->unscaledWidth:F

    return v0
.end method

.method public getWordSpacing()F
    .locals 1

    .line 327
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->checkGraphicsState()V

    .line 328
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->gs:Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/canvas/CanvasGraphicsState;->getWordSpacing()F

    move-result v0

    return v0
.end method

.method public hasMcid(I)Z
    .locals 1
    .param p1, "mcid"    # I

    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->hasMcid(IZ)Z

    move-result v0

    return v0
.end method

.method public hasMcid(IZ)Z
    .locals 5
    .param p1, "mcid"    # I
    .param p2, "checkTheTopmostLevelOnly"    # Z

    .line 157
    nop

    .line 163
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    .line 157
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1

    .line 158
    if-eqz v0, :cond_3

    .line 159
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->getMcid()I

    move-result v0

    .line 160
    .local v0, "infoMcid":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1

    .line 163
    .end local v0    # "infoMcid":I
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 164
    .local v3, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->hasMcid()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 165
    invoke-virtual {v3}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getMcid()I

    move-result v4

    if-ne v4, p1, :cond_2

    .line 166
    return v1

    .line 167
    .end local v3    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_2
    goto :goto_1

    .line 169
    :cond_3
    return v2
.end method

.method public isReversedChars()Z
    .locals 4

    .line 375
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/canvas/parser/data/TextRenderInfo;->canvasTagHierarchy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;

    .line 376
    .local v1, "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    if-eqz v1, :cond_0

    .line 377
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->ReversedChars:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;->getRole()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 378
    const/4 v0, 0x1

    return v0

    .line 381
    .end local v1    # "tag":Lcom/itextpdf/kernel/pdf/canvas/CanvasTag;
    :cond_0
    goto :goto_0

    .line 382
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
