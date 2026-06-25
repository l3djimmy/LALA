.class public Lcom/itextpdf/io/font/otf/Glyph;
.super Ljava/lang/Object;
.source "Glyph.java"


# static fields
.field private static final REPLACEMENT_CHARACTER:C = '\ufffd'

.field private static final REPLACEMENT_CHARACTERS:[C

.field private static final REPLACEMENT_CHARACTER_STRING:Ljava/lang/String;


# instance fields
.field anchorDelta:S

.field private bbox:[I

.field private chars:[C

.field private final code:I

.field private final isMark:Z

.field private unicode:I

.field private final width:I

.field xAdvance:S

.field xPlacement:S

.field yAdvance:S

.field yPlacement:S


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 32
    const/4 v0, 0x1

    new-array v0, v0, [C

    const/4 v1, 0x0

    const v2, 0xfffd

    aput-char v2, v0, v1

    sput-object v0, Lcom/itextpdf/io/font/otf/Glyph;->REPLACEMENT_CHARACTERS:[C

    .line 33
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/io/font/otf/Glyph;->REPLACEMENT_CHARACTER_STRING:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 6
    .param p1, "width"    # I
    .param p2, "unicode"    # I

    .line 100
    invoke-static {p2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars(I)[C

    move-result-object v4

    const/4 v5, 0x0

    const/4 v1, -0x1

    move-object v0, p0

    move v2, p1

    move v3, p2

    .end local p1    # "width":I
    .end local p2    # "unicode":I
    .local v2, "width":I
    .local v3, "unicode":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 101
    return-void
.end method

.method public constructor <init>(III)V
    .locals 6
    .param p1, "code"    # I
    .param p2, "width"    # I
    .param p3, "unicode"    # I

    .line 66
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p1    # "code":I
    .end local p2    # "width":I
    .end local p3    # "unicode":I
    .local v1, "code":I
    .local v2, "width":I
    .local v3, "unicode":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 67
    return-void
.end method

.method public constructor <init>(III[CZ)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "width"    # I
    .param p3, "unicode"    # I
    .param p4, "chars"    # [C
    .param p5, "IsMark"    # Z

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    .line 49
    const/4 v0, 0x0

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    .line 50
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    .line 52
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    .line 53
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    .line 56
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    .line 114
    iput p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    .line 115
    iput p2, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    .line 116
    iput p3, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    .line 117
    iput-boolean p5, p0, Lcom/itextpdf/io/font/otf/Glyph;->isMark:Z

    .line 118
    if-eqz p4, :cond_0

    move-object v0, p4

    goto :goto_0

    :cond_0
    invoke-static {p3}, Lcom/itextpdf/io/font/otf/Glyph;->getChars(I)[C

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    .line 119
    return-void
.end method

.method public constructor <init>(III[I)V
    .locals 6
    .param p1, "code"    # I
    .param p2, "width"    # I
    .param p3, "unicode"    # I
    .param p4, "bbox"    # [I

    .line 89
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    .end local p1    # "code":I
    .end local p2    # "width":I
    .end local p3    # "unicode":I
    .local v1, "code":I
    .local v2, "width":I
    .local v3, "unicode":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 90
    iput-object p4, p0, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    .line 91
    return-void
.end method

.method public constructor <init>(II[C)V
    .locals 6
    .param p1, "code"    # I
    .param p2, "width"    # I
    .param p3, "chars"    # [C

    .line 77
    invoke-static {p3}, Lcom/itextpdf/io/font/otf/Glyph;->codePoint([C)I

    move-result v3

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    .end local p1    # "code":I
    .end local p2    # "width":I
    .end local p3    # "chars":[C
    .local v1, "code":I
    .local v2, "width":I
    .local v4, "chars":[C
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/Glyph;)V
    .locals 1
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    .line 49
    const/4 v0, 0x0

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    .line 50
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    .line 52
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    .line 53
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    .line 56
    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    .line 127
    iget v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    .line 128
    iget v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    .line 129
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    .line 130
    iget v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    iput v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    .line 131
    iget-boolean v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->isMark:Z

    iput-boolean v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->isMark:Z

    .line 132
    iget-object v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    .line 134
    iget-short v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    .line 135
    iget-short v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    .line 136
    iget-short v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    .line 137
    iget-short v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    .line 138
    iget-short v0, p1, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    .line 139
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/Glyph;I)V
    .locals 6
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "unicode"    # I

    .line 167
    iget v1, p1, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    iget v2, p1, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    invoke-static {p2}, Lcom/itextpdf/io/font/otf/Glyph;->getChars(I)[C

    move-result-object v4

    invoke-virtual {p1}, Lcom/itextpdf/io/font/otf/Glyph;->isMark()Z

    move-result v5

    move-object v0, p0

    move v3, p2

    .end local p2    # "unicode":I
    .local v3, "unicode":I
    invoke-direct/range {v0 .. v5}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(III[CZ)V

    .line 168
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/io/font/otf/Glyph;IIIII)V
    .locals 1
    .param p1, "glyph"    # Lcom/itextpdf/io/font/otf/Glyph;
    .param p2, "xPlacement"    # I
    .param p3, "yPlacement"    # I
    .param p4, "xAdvance"    # I
    .param p5, "yAdvance"    # I
    .param p6, "anchorDelta"    # I

    .line 152
    invoke-direct {p0, p1}, Lcom/itextpdf/io/font/otf/Glyph;-><init>(Lcom/itextpdf/io/font/otf/Glyph;)V

    .line 153
    int-to-short v0, p2

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    .line 154
    int-to-short v0, p3

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    .line 155
    int-to-short v0, p4

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    .line 156
    int-to-short v0, p5

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    .line 157
    int-to-short v0, p6

    iput-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    .line 158
    return-void
.end method

.method private static codePoint([C)I
    .locals 4
    .param p0, "a"    # [C

    .line 325
    if-eqz p0, :cond_1

    .line 326
    array-length v0, p0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    aget-char v0, p0, v2

    invoke-static {v0}, Ljava/lang/Character;->isValidCodePoint(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 327
    aget-char v0, p0, v2

    return v0

    .line 328
    :cond_0
    array-length v0, p0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    aget-char v0, p0, v2

    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v0

    if-eqz v0, :cond_1

    aget-char v0, p0, v1

    invoke-static {v0}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 329
    aget-char v0, p0, v2

    aget-char v1, p0, v1

    invoke-static {v0, v1}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result v0

    return v0

    .line 332
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private static getChars(I)[C
    .locals 1
    .param p0, "unicode"    # I

    .line 336
    const/4 v0, -0x1

    if-le p0, v0, :cond_0

    invoke-static {p0}, Lcom/itextpdf/io/util/TextUtil;->convertFromUtf32(I)[C

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static toHex(I)Ljava/lang/String;
    .locals 3
    .param p0, "ch"    # I

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x4

    sub-int/2addr v1, v2

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 276
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 277
    return v0

    .line 279
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 282
    :cond_1
    move-object v2, p1

    check-cast v2, Lcom/itextpdf/io/font/otf/Glyph;

    .line 283
    .local v2, "other":Lcom/itextpdf/io/font/otf/Glyph;
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    iget-object v4, v2, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([C[C)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    iget v4, v2, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    if-ne v3, v4, :cond_2

    iget v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    iget v4, v2, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    .line 280
    .end local v2    # "other":Lcom/itextpdf/io/font/otf/Glyph;
    :cond_3
    :goto_1
    return v1
.end method

.method public getAnchorDelta()S
    .locals 1

    .line 240
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    return v0
.end method

.method public getBbox()[I
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->bbox:[I

    return-object v0
.end method

.method public getChars()[C
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    return-object v0
.end method

.method public getCode()I
    .locals 1

    .line 171
    iget v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    return v0
.end method

.method public getUnicode()I
    .locals 1

    .line 187
    iget v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    return v0
.end method

.method public getUnicodeChars()[C
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    array-length v0, v0

    if-lez v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    return-object v0

    .line 310
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/otf/Glyph;->REPLACEMENT_CHARACTERS:[C

    return-object v0
.end method

.method public getUnicodeString()Ljava/lang/String;
    .locals 1

    .line 293
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    invoke-static {v0}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 296
    :cond_0
    sget-object v0, Lcom/itextpdf/io/font/otf/Glyph;->REPLACEMENT_CHARACTER_STRING:Ljava/lang/String;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 175
    iget v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    return v0
.end method

.method public getXAdvance()S
    .locals 1

    .line 224
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    return v0
.end method

.method public getXPlacement()S
    .locals 1

    .line 208
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    return v0
.end method

.method public getYAdvance()S
    .locals 1

    .line 232
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    return v0
.end method

.method public getYPlacement()S
    .locals 1

    .line 216
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    return v0
.end method

.method public hasAdvance()Z
    .locals 1

    .line 257
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    if-nez v0, :cond_1

    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hasOffsets()Z
    .locals 1

    .line 248
    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->hasAdvance()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/itextpdf/io/font/otf/Glyph;->hasPlacement()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hasPlacement()Z
    .locals 1

    .line 253
    iget-short v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasValidUnicode()Z
    .locals 2

    .line 183
    iget v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 261
    const/16 v0, 0x1f

    .line 262
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 263
    .local v1, "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    if-nez v3, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([C)I

    move-result v3

    :goto_0
    add-int/2addr v2, v3

    .line 264
    .end local v1    # "result":I
    .local v2, "result":I
    mul-int/lit8 v1, v2, 0x1f

    iget v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    add-int/2addr v1, v3

    .line 265
    .end local v2    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    add-int/2addr v2, v3

    .line 266
    .end local v1    # "result":I
    .restart local v2    # "result":I
    return v2
.end method

.method public isMark()Z
    .locals 1

    .line 204
    iget-boolean v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->isMark:Z

    return v0
.end method

.method public setAnchorDelta(S)V
    .locals 0
    .param p1, "anchorDelta"    # S

    .line 244
    iput-short p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->anchorDelta:S

    .line 245
    return-void
.end method

.method public setChars([C)V
    .locals 0
    .param p1, "chars"    # [C

    .line 200
    iput-object p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    .line 201
    return-void
.end method

.method public setUnicode(I)V
    .locals 1
    .param p1, "unicode"    # I

    .line 191
    iput p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    .line 192
    invoke-static {p1}, Lcom/itextpdf/io/font/otf/Glyph;->getChars(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    .line 193
    return-void
.end method

.method public setXAdvance(S)V
    .locals 0
    .param p1, "xAdvance"    # S

    .line 228
    iput-short p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->xAdvance:S

    .line 229
    return-void
.end method

.method public setXPlacement(S)V
    .locals 0
    .param p1, "xPlacement"    # S

    .line 212
    iput-short p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->xPlacement:S

    .line 213
    return-void
.end method

.method public setYAdvance(S)V
    .locals 0
    .param p1, "yAdvance"    # S

    .line 236
    iput-short p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->yAdvance:S

    .line 237
    return-void
.end method

.method public setYPlacement(S)V
    .locals 0
    .param p1, "yPlacement"    # S

    .line 220
    iput-short p1, p0, Lcom/itextpdf/io/font/otf/Glyph;->yPlacement:S

    .line 221
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 315
    iget v0, p0, Lcom/itextpdf/io/font/otf/Glyph;->code:I

    .line 316
    invoke-static {v0}, Lcom/itextpdf/io/font/otf/Glyph;->toHex(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/itextpdf/io/font/otf/Glyph;->chars:[C

    invoke-static {v1}, Ljava/util/Arrays;->toString([C)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string/jumbo v1, "null"

    :goto_0
    iget v2, p0, Lcom/itextpdf/io/font/otf/Glyph;->unicode:I

    invoke-static {v2}, Lcom/itextpdf/io/font/otf/Glyph;->toHex(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/itextpdf/io/font/otf/Glyph;->width:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v0

    .line 315
    const-string v1, "[id={0}, chars={1}, uni={2}, width={3}]"

    invoke-static {v1, v0}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
