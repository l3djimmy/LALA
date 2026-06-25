.class public Lcom/itextpdf/io/font/FontEncoding;
.super Ljava/lang/Object;
.source "FontEncoding.java"


# static fields
.field public static final FONT_SPECIFIC:Ljava/lang/String; = "FontSpecific"

.field public static final NOTDEF:Ljava/lang/String; = ".notdef"

.field private static final emptyBytes:[B


# instance fields
.field protected baseEncoding:Ljava/lang/String;

.field protected codeToUnicode:[I

.field protected differences:[Ljava/lang/String;

.field protected fontSpecific:Z

.field protected unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

.field protected unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/itextpdf/io/font/FontEncoding;->emptyBytes:[B

    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    .line 71
    new-array v0, v1, [I

    const/4 v2, -0x1

    invoke-static {v0, v2}, Lcom/itextpdf/io/util/ArrayUtil;->fillWithValue([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    .line 72
    new-instance v0, Lcom/itextpdf/io/util/IntHashtable;

    invoke-direct {v0, v1}, Lcom/itextpdf/io/util/IntHashtable;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/FontEncoding;->fontSpecific:Z

    .line 74
    return-void
.end method

.method public static createEmptyFontEncoding()Lcom/itextpdf/io/font/FontEncoding;
    .locals 4

    .line 88
    new-instance v0, Lcom/itextpdf/io/font/FontEncoding;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontEncoding;-><init>()V

    .line 89
    .local v0, "encoding":Lcom/itextpdf/io/font/FontEncoding;
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    .line 90
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/itextpdf/io/font/FontEncoding;->fontSpecific:Z

    .line 91
    const/16 v1, 0x100

    new-array v2, v1, [Ljava/lang/String;

    iput-object v2, v0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    .line 92
    const/4 v2, 0x0

    .local v2, "ch":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 93
    iget-object v3, v0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v3, v2, v2}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 92
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 95
    .end local v2    # "ch":I
    :cond_0
    return-object v0
.end method

.method public static createFontEncoding(Ljava/lang/String;)Lcom/itextpdf/io/font/FontEncoding;
    .locals 3
    .param p0, "baseEncoding"    # Ljava/lang/String;

    .line 77
    new-instance v0, Lcom/itextpdf/io/font/FontEncoding;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontEncoding;-><init>()V

    .line 78
    .local v0, "encoding":Lcom/itextpdf/io/font/FontEncoding;
    invoke-static {p0}, Lcom/itextpdf/io/font/FontEncoding;->normalizeEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    .line 79
    iget-object v1, v0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    const-string v2, "#"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 80
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontEncoding;->fillCustomEncoding()V

    goto :goto_0

    .line 82
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/io/font/FontEncoding;->fillNamedEncoding()V

    .line 84
    :goto_0
    return-object v0
.end method

.method public static createFontSpecificEncoding()Lcom/itextpdf/io/font/FontEncoding;
    .locals 2

    .line 104
    new-instance v0, Lcom/itextpdf/io/font/FontEncoding;

    invoke-direct {v0}, Lcom/itextpdf/io/font/FontEncoding;-><init>()V

    .line 105
    .local v0, "encoding":Lcom/itextpdf/io/font/FontEncoding;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/itextpdf/io/font/FontEncoding;->fontSpecific:Z

    .line 106
    invoke-static {v0}, Lcom/itextpdf/io/font/FontEncoding;->fillFontEncoding(Lcom/itextpdf/io/font/FontEncoding;)V

    .line 108
    return-object v0
.end method

.method public static fillFontEncoding(Lcom/itextpdf/io/font/FontEncoding;)V
    .locals 2
    .param p0, "encoding"    # Lcom/itextpdf/io/font/FontEncoding;

    .line 117
    const/4 v0, 0x0

    .local v0, "ch":I
    :goto_0
    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    .line 118
    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v1, v0, v0}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 119
    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput v0, v1, v0

    .line 120
    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v1, v0, v0}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    .end local v0    # "ch":I
    :cond_0
    return-void
.end method

.method protected static normalizeEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "enc"    # Ljava/lang/String;

    .line 350
    const-string v0, ""

    if-nez p0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "tmp":Ljava/lang/String;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_1
    goto :goto_1

    :sswitch_0
    const-string/jumbo v0, "zapfdingbatsencoding"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x5

    goto :goto_2

    :sswitch_1
    const-string/jumbo v0, "winansi"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_2

    :sswitch_2
    const-string v0, "macromanencoding"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto :goto_2

    :sswitch_3
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_2

    :sswitch_4
    const-string v0, "macroman"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    goto :goto_2

    :sswitch_5
    const-string/jumbo v0, "winansiencoding"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_2

    :goto_1
    const/4 v0, -0x1

    :goto_2
    packed-switch v0, :pswitch_data_0

    .line 362
    return-object p0

    .line 360
    :pswitch_0
    const-string v0, "ZapfDingbats"

    return-object v0

    .line 358
    :pswitch_1
    const-string v0, "MacRoman"

    return-object v0

    .line 355
    :pswitch_2
    const-string v0, "Cp1252"

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x431a208e -> :sswitch_5
        -0xa7919f2 -> :sswitch_4
        0x0 -> :sswitch_3
        0xcfe2561 -> :sswitch_2
        0x506e411f -> :sswitch_1
        0x7edb6bac -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public addSymbol(II)Z
    .locals 2
    .param p1, "code"    # I
    .param p2, "unicode"    # I

    .line 133
    const/4 v0, 0x0

    if-ltz p1, :cond_2

    const/16 v1, 0xff

    if-le p1, v1, :cond_0

    goto :goto_0

    .line 136
    :cond_0
    invoke-static {p2}, Lcom/itextpdf/io/font/AdobeGlyphList;->unicodeToName(I)Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "glyphName":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 138
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p2, p1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 139
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput p2, v0, p1

    .line 140
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object v1, v0, p1

    .line 141
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p2, p2}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 142
    const/4 v0, 0x1

    return v0

    .line 144
    :cond_1
    return v0

    .line 134
    .end local v1    # "glyphName":Ljava/lang/String;
    :cond_2
    :goto_0
    return v0
.end method

.method public canDecode(I)Z
    .locals 2
    .param p1, "code"    # I

    .line 234
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aget v0, v0, p1

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public canEncode(I)Z
    .locals 1
    .param p1, "unicode"    # I

    .line 223
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/itextpdf/io/util/TextUtil;->isNonPrintable(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/itextpdf/io/util/TextUtil;->isNewLine(I)Z

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

.method public convertToByte(I)I
    .locals 1
    .param p1, "unicode"    # I

    .line 212
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    return v0
.end method

.method public convertToBytes(Ljava/lang/String;)[B
    .locals 5
    .param p1, "text"    # Ljava/lang/String;

    .line 191
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 194
    :cond_0
    const/4 v0, 0x0

    .line 195
    .local v0, "ptr":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    new-array v1, v1, [B

    .line 196
    .local v1, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 197
    iget-object v3, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/util/IntHashtable;->containsKey(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 198
    add-int/lit8 v3, v0, 0x1

    .end local v0    # "ptr":I
    .local v3, "ptr":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p0, v4}, Lcom/itextpdf/io/font/FontEncoding;->convertToByte(I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v1, v0

    move v0, v3

    .line 196
    .end local v3    # "ptr":I
    .restart local v0    # "ptr":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 201
    .end local v2    # "i":I
    :cond_2
    invoke-static {v1, v0}, Lcom/itextpdf/io/util/ArrayUtil;->shortenArray([BI)[B

    move-result-object v2

    return-object v2

    .line 192
    .end local v0    # "ptr":I
    .end local v1    # "bytes":[B
    :cond_3
    :goto_1
    sget-object v0, Lcom/itextpdf/io/font/FontEncoding;->emptyBytes:[B

    return-object v0
.end method

.method protected fillCustomEncoding()V
    .locals 10

    .line 248
    const/16 v0, 0x100

    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    .line 249
    new-instance v1, Ljava/util/StringTokenizer;

    iget-object v2, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v4, " ,\t\n\r\u000c"

    invoke-direct {v1, v2, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .local v1, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    const-string v4, "full"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/16 v4, 0x10

    if-eqz v2, :cond_1

    .line 251
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 252
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "order":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v6

    int-to-char v6, v6

    .line 255
    .local v6, "uni":C
    invoke-static {v5}, Lcom/itextpdf/io/font/AdobeGlyphList;->nameToUnicode(Ljava/lang/String;)I

    move-result v7

    .line 257
    .local v7, "uniName":I
    const-string v8, "\'"

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 258
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .local v8, "orderK":I
    goto :goto_1

    .line 260
    .end local v8    # "orderK":I
    :cond_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 262
    .restart local v8    # "orderK":I
    :goto_1
    rem-int/2addr v8, v0

    .line 263
    iget-object v9, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v9, v6, v8}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 264
    iget-object v9, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput v6, v9, v8

    .line 265
    iget-object v9, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object v5, v9, v8

    .line 266
    iget-object v9, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v9, v6, v7}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 267
    .end local v2    # "order":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "uni":C
    .end local v7    # "uniName":I
    .end local v8    # "orderK":I
    goto :goto_0

    .line 269
    :cond_1
    const/4 v2, 0x0

    .line 270
    .local v2, "k":I
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 271
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 273
    :cond_2
    :goto_2
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_4

    if-ge v2, v0, :cond_4

    .line 274
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 275
    .local v3, "hex":Ljava/lang/String;
    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    const/high16 v6, 0x10000

    rem-int/2addr v5, v6

    .line 276
    .local v5, "uni":I
    invoke-static {v5}, Lcom/itextpdf/io/font/AdobeGlyphList;->unicodeToName(I)Ljava/lang/String;

    move-result-object v6

    .line 277
    .local v6, "name":Ljava/lang/String;
    if-nez v6, :cond_3

    .line 278
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "uni"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 280
    :cond_3
    iget-object v7, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v7, v5, v2}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 281
    iget-object v7, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput v5, v7, v2

    .line 282
    iget-object v7, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object v6, v7, v2

    .line 283
    iget-object v7, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v7, v5, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 284
    nop

    .end local v3    # "hex":Ljava/lang/String;
    .end local v5    # "uni":I
    .end local v6    # "name":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    .line 285
    goto :goto_2

    .line 287
    .end local v2    # "k":I
    :cond_4
    const/4 v2, 0x0

    .restart local v2    # "k":I
    :goto_3
    if-ge v2, v0, :cond_6

    .line 288
    iget-object v3, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aget-object v3, v3, v2

    if-nez v3, :cond_5

    .line 289
    iget-object v3, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    const-string v4, ".notdef"

    aput-object v4, v3, v2

    .line 287
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 292
    .end local v2    # "k":I
    :cond_6
    return-void
.end method

.method protected fillNamedEncoding()V
    .locals 9

    .line 296
    const-string v0, " "

    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/itextpdf/io/font/PdfEncodings;->convertToBytes(Ljava/lang/String;Ljava/lang/String;)[B

    .line 297
    const-string v0, "Cp1252"

    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MacRoman"

    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 298
    .local v0, "stdEncoding":Z
    :goto_1
    const/16 v1, 0x100

    if-nez v0, :cond_2

    iget-object v2, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-nez v2, :cond_2

    .line 299
    new-array v2, v1, [Ljava/lang/String;

    iput-object v2, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    .line 302
    :cond_2
    new-array v2, v1, [B

    .line 303
    .local v2, "b":[B
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_2
    if-ge v3, v1, :cond_3

    .line 304
    int-to-byte v4, v3

    aput-byte v4, v2, v3

    .line 303
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 306
    .end local v3    # "k":I
    :cond_3
    iget-object v3, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/itextpdf/io/font/PdfEncodings;->convertToString([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 307
    .local v3, "str":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 308
    .local v4, "encoded":[C
    const/4 v5, 0x0

    .local v5, "ch":I
    :goto_3
    if-ge v5, v1, :cond_6

    .line 309
    aget-char v6, v4, v5

    .line 310
    .local v6, "uni":C
    invoke-static {v6}, Lcom/itextpdf/io/font/AdobeGlyphList;->unicodeToName(I)Ljava/lang/String;

    move-result-object v7

    .line 311
    .local v7, "name":Ljava/lang/String;
    if-nez v7, :cond_4

    .line 312
    const-string v7, ".notdef"

    goto :goto_4

    .line 314
    :cond_4
    iget-object v8, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v8, v6, v5}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 315
    iget-object v8, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput v6, v8, v5

    .line 316
    iget-object v8, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v8, v6, v6}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 318
    :goto_4
    iget-object v8, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-eqz v8, :cond_5

    .line 319
    iget-object v8, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object v7, v8, v5

    .line 308
    .end local v6    # "uni":C
    .end local v7    # "name":Ljava/lang/String;
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 322
    .end local v5    # "ch":I
    :cond_6
    return-void
.end method

.method protected fillStandardEncoding()V
    .locals 5

    .line 325
    sget-object v0, Lcom/itextpdf/io/font/PdfEncodings;->standardEncoding:[I

    .line 326
    .local v0, "encoded":[I
    const/4 v1, 0x0

    .local v1, "ch":I
    :goto_0
    const/16 v2, 0x100

    if-ge v1, v2, :cond_2

    .line 327
    aget v2, v0, v1

    .line 328
    .local v2, "uni":I
    invoke-static {v2}, Lcom/itextpdf/io/font/AdobeGlyphList;->unicodeToName(I)Ljava/lang/String;

    move-result-object v3

    .line 329
    .local v3, "name":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 330
    const-string v3, ".notdef"

    goto :goto_1

    .line 332
    :cond_0
    iget-object v4, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeToCode:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v4, v2, v1}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 333
    iget-object v4, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aput v2, v4, v1

    .line 334
    iget-object v4, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v4, v2, v2}, Lcom/itextpdf/io/util/IntHashtable;->put(II)I

    .line 336
    :goto_1
    iget-object v4, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 337
    iget-object v4, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object v3, v4, v1

    .line 326
    .end local v2    # "uni":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 340
    .end local v1    # "ch":I
    :cond_2
    return-void
.end method

.method public getBaseEncoding()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getDifference(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I

    .line 167
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getUnicode(I)I
    .locals 1
    .param p1, "index"    # I

    .line 155
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->codeToUnicode:[I

    aget v0, v0, p1

    return v0
.end method

.method public getUnicodeDifference(I)I
    .locals 1
    .param p1, "index"    # I

    .line 159
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->unicodeDifferences:Lcom/itextpdf/io/util/IntHashtable;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/util/IntHashtable;->get(I)I

    move-result v0

    return v0
.end method

.method public hasDifferences()Z
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBuiltWith(Ljava/lang/String;)Z
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;

    .line 244
    invoke-static {p1}, Lcom/itextpdf/io/font/FontEncoding;->normalizeEncoding(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/itextpdf/io/font/FontEncoding;->baseEncoding:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isFontSpecific()Z
    .locals 1

    .line 129
    iget-boolean v0, p0, Lcom/itextpdf/io/font/FontEncoding;->fontSpecific:Z

    return v0
.end method

.method public setDifference(ILjava/lang/String;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "difference"    # Ljava/lang/String;

    .line 178
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 179
    iget-object v0, p0, Lcom/itextpdf/io/font/FontEncoding;->differences:[Ljava/lang/String;

    aput-object p2, v0, p1

    .line 181
    :cond_0
    return-void
.end method
