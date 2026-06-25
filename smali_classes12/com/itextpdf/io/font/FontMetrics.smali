.class public Lcom/itextpdf/io/font/FontMetrics;
.super Ljava/lang/Object;
.source "FontMetrics.java"


# instance fields
.field private advanceWidthMax:I

.field private ascender:I

.field private bbox:[I

.field private capHeight:I

.field private descender:I

.field private glyphWidths:[I

.field private isFixedPitch:Z

.field private italicAngle:F

.field private lineGap:I

.field protected normalizationCoef:F

.field private numOfGlyphs:I

.field private stemH:I

.field private stemV:I

.field private strikeoutPosition:I

.field private strikeoutSize:I

.field private subscriptOffset:I

.field private subscriptSize:I

.field private superscriptOffset:I

.field private superscriptSize:I

.field private typoAscender:I

.field private typoDescender:I

.field private underlinePosition:I

.field private underlineThickness:I

.field private unitsPerEm:I

.field private winAscender:I

.field private winDescender:I

.field private xHeight:I


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    .line 32
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->unitsPerEm:I

    .line 38
    const/16 v1, 0x320

    iput v1, p0, Lcom/itextpdf/io/font/FontMetrics;->typoAscender:I

    .line 40
    const/16 v1, -0xc8

    iput v1, p0, Lcom/itextpdf/io/font/FontMetrics;->typoDescender:I

    .line 42
    const/16 v2, 0x2bc

    iput v2, p0, Lcom/itextpdf/io/font/FontMetrics;->capHeight:I

    .line 44
    const/4 v2, 0x0

    iput v2, p0, Lcom/itextpdf/io/font/FontMetrics;->xHeight:I

    .line 46
    const/4 v3, 0x0

    iput v3, p0, Lcom/itextpdf/io/font/FontMetrics;->italicAngle:F

    .line 49
    const/16 v3, -0x32

    const/16 v4, 0x384

    filled-new-array {v3, v1, v0, v4}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    .line 63
    const/16 v0, -0x64

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->underlinePosition:I

    .line 65
    const/16 v0, 0x32

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->underlineThickness:I

    .line 79
    const/16 v0, 0x50

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->stemV:I

    .line 81
    iput v2, p0, Lcom/itextpdf/io/font/FontMetrics;->stemH:I

    return-void
.end method


# virtual methods
.method public getAdvanceWidthMax()I
    .locals 1

    .line 175
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->advanceWidthMax:I

    return v0
.end method

.method public getAscender()I
    .locals 1

    .line 155
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->ascender:I

    return v0
.end method

.method public getBbox()[I
    .locals 1

    .line 144
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    return-object v0
.end method

.method public getCapHeight()I
    .locals 1

    .line 132
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->capHeight:I

    return v0
.end method

.method public getDescender()I
    .locals 1

    .line 159
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->descender:I

    return v0
.end method

.method public getGlyphWidths()[I
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->glyphWidths:[I

    return-object v0
.end method

.method public getItalicAngle()F
    .locals 1

    .line 140
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->italicAngle:F

    return v0
.end method

.method public getLineGap()I
    .locals 1

    .line 163
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->lineGap:I

    return v0
.end method

.method public getNumberOfGlyphs()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->numOfGlyphs:I

    return v0
.end method

.method public getStemH()I
    .locals 1

    .line 215
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->stemH:I

    return v0
.end method

.method public getStemV()I
    .locals 1

    .line 211
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->stemV:I

    return v0
.end method

.method public getStrikeoutPosition()I
    .locals 1

    .line 187
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->strikeoutPosition:I

    return v0
.end method

.method public getStrikeoutSize()I
    .locals 1

    .line 191
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->strikeoutSize:I

    return v0
.end method

.method public getSubscriptOffset()I
    .locals 1

    .line 199
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->subscriptOffset:I

    return v0
.end method

.method public getSubscriptSize()I
    .locals 1

    .line 195
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->subscriptSize:I

    return v0
.end method

.method public getSuperscriptOffset()I
    .locals 1

    .line 207
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->superscriptOffset:I

    return v0
.end method

.method public getSuperscriptSize()I
    .locals 1

    .line 203
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->superscriptSize:I

    return v0
.end method

.method public getTypoAscender()I
    .locals 1

    .line 107
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->typoAscender:I

    return v0
.end method

.method public getTypoDescender()I
    .locals 1

    .line 119
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->typoDescender:I

    return v0
.end method

.method public getUnderlinePosition()I
    .locals 2

    .line 179
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->underlinePosition:I

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->underlineThickness:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    return v0
.end method

.method public getUnderlineThickness()I
    .locals 1

    .line 183
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->underlineThickness:I

    return v0
.end method

.method public getUnitsPerEm()I
    .locals 1

    .line 87
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->unitsPerEm:I

    return v0
.end method

.method public getWinAscender()I
    .locals 1

    .line 167
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->winAscender:I

    return v0
.end method

.method public getWinDescender()I
    .locals 1

    .line 171
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->winDescender:I

    return v0
.end method

.method public getXHeight()I
    .locals 1

    .line 136
    iget v0, p0, Lcom/itextpdf/io/font/FontMetrics;->xHeight:I

    return v0
.end method

.method public isFixedPitch()Z
    .locals 1

    .line 219
    iget-boolean v0, p0, Lcom/itextpdf/io/font/FontMetrics;->isFixedPitch:Z

    return v0
.end method

.method protected setAdvanceWidthMax(I)V
    .locals 2
    .param p1, "advanceWidthMax"    # I

    .line 308
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->advanceWidthMax:I

    .line 309
    return-void
.end method

.method protected setAscender(I)V
    .locals 2
    .param p1, "ascender"    # I

    .line 288
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->ascender:I

    .line 289
    return-void
.end method

.method public setBbox(IIII)V
    .locals 2
    .param p1, "llx"    # I
    .param p2, "lly"    # I
    .param p3, "urx"    # I
    .param p4, "ury"    # I

    .line 148
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 149
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 150
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 151
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    const/4 v1, 0x3

    aput p4, v0, v1

    .line 152
    return-void
.end method

.method protected setCapHeight(I)V
    .locals 2
    .param p1, "capHeight"    # I

    .line 276
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->capHeight:I

    .line 277
    return-void
.end method

.method protected setDescender(I)V
    .locals 2
    .param p1, "descender"    # I

    .line 292
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->descender:I

    .line 293
    return-void
.end method

.method protected setGlyphWidths([I)V
    .locals 0
    .param p1, "glyphWidths"    # [I

    .line 239
    iput-object p1, p0, Lcom/itextpdf/io/font/FontMetrics;->glyphWidths:[I

    .line 240
    return-void
.end method

.method protected setIsFixedPitch(Z)V
    .locals 0
    .param p1, "isFixedPitch"    # Z

    .line 352
    iput-boolean p1, p0, Lcom/itextpdf/io/font/FontMetrics;->isFixedPitch:Z

    .line 353
    return-void
.end method

.method protected setItalicAngle(F)V
    .locals 0
    .param p1, "italicAngle"    # F

    .line 284
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->italicAngle:F

    .line 285
    return-void
.end method

.method protected setLineGap(I)V
    .locals 2
    .param p1, "lineGap"    # I

    .line 296
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->lineGap:I

    .line 297
    return-void
.end method

.method protected setNumberOfGlyphs(I)V
    .locals 0
    .param p1, "numOfGlyphs"    # I

    .line 235
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->numOfGlyphs:I

    .line 236
    return-void
.end method

.method protected setStemH(I)V
    .locals 0
    .param p1, "stemH"    # I

    .line 348
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->stemH:I

    .line 349
    return-void
.end method

.method public setStemV(I)V
    .locals 0
    .param p1, "stemV"    # I

    .line 344
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->stemV:I

    .line 345
    return-void
.end method

.method protected setStrikeoutPosition(I)V
    .locals 2
    .param p1, "strikeoutPosition"    # I

    .line 320
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->strikeoutPosition:I

    .line 321
    return-void
.end method

.method protected setStrikeoutSize(I)V
    .locals 2
    .param p1, "strikeoutSize"    # I

    .line 324
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->strikeoutSize:I

    .line 325
    return-void
.end method

.method protected setSubscriptOffset(I)V
    .locals 2
    .param p1, "subscriptOffset"    # I

    .line 332
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->subscriptOffset:I

    .line 333
    return-void
.end method

.method protected setSubscriptSize(I)V
    .locals 2
    .param p1, "subscriptSize"    # I

    .line 328
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->subscriptSize:I

    .line 329
    return-void
.end method

.method protected setSuperscriptOffset(I)V
    .locals 2
    .param p1, "superscriptOffset"    # I

    .line 340
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->superscriptOffset:I

    .line 341
    return-void
.end method

.method protected setSuperscriptSize(I)V
    .locals 0
    .param p1, "superscriptSize"    # I

    .line 336
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->superscriptSize:I

    .line 337
    return-void
.end method

.method protected setTypoAscender(I)V
    .locals 2
    .param p1, "typoAscender"    # I

    .line 251
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->typoAscender:I

    .line 252
    return-void
.end method

.method protected setTypoDescender(I)V
    .locals 2
    .param p1, "typoDescender"    # I

    .line 263
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->typoDescender:I

    .line 264
    return-void
.end method

.method protected setUnderlinePosition(I)V
    .locals 2
    .param p1, "underlinePosition"    # I

    .line 312
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->underlinePosition:I

    .line 313
    return-void
.end method

.method protected setUnderlineThickness(I)V
    .locals 0
    .param p1, "underineThickness"    # I

    .line 316
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->underlineThickness:I

    .line 317
    return-void
.end method

.method protected setUnitsPerEm(I)V
    .locals 2
    .param p1, "unitsPerEm"    # I

    .line 223
    iput p1, p0, Lcom/itextpdf/io/font/FontMetrics;->unitsPerEm:I

    .line 224
    const/high16 v0, 0x447a0000    # 1000.0f

    int-to-float v1, p1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    .line 225
    return-void
.end method

.method protected setWinAscender(I)V
    .locals 2
    .param p1, "winAscender"    # I

    .line 300
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->winAscender:I

    .line 301
    return-void
.end method

.method protected setWinDescender(I)V
    .locals 2
    .param p1, "winDescender"    # I

    .line 304
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->winDescender:I

    .line 305
    return-void
.end method

.method protected setXHeight(I)V
    .locals 2
    .param p1, "xHeight"    # I

    .line 280
    int-to-float v0, p1

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/itextpdf/io/font/FontMetrics;->xHeight:I

    .line 281
    return-void
.end method

.method protected updateBbox(FFFF)V
    .locals 3
    .param p1, "llx"    # F
    .param p2, "lly"    # F
    .param p3, "urx"    # F
    .param p4, "ury"    # F

    .line 228
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v1, p1

    float-to-int v1, v1

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 229
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v1, p2

    float-to-int v1, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 230
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v1, p3

    float-to-int v1, v1

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 231
    iget-object v0, p0, Lcom/itextpdf/io/font/FontMetrics;->bbox:[I

    iget v1, p0, Lcom/itextpdf/io/font/FontMetrics;->normalizationCoef:F

    mul-float/2addr v1, p4

    float-to-int v1, v1

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 232
    return-void
.end method
