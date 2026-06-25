.class public Lcom/itextpdf/io/codec/LZWStringTable;
.super Ljava/lang/Object;
.source "LZWStringTable.java"


# static fields
.field private static final HASHSIZE:S = 0x26f5s

.field private static final HASHSTEP:S = 0x7f7s

.field private static final HASH_FREE:S = -0x1s

.field private static final MAXBITS:I = 0xc

.field private static final MAXSTR:I = 0x1000

.field private static final NEXT_FIRST:S = -0x1s

.field private static final RES_CODES:I = 0x2


# instance fields
.field numStrings_:S

.field strChr_:[B

.field strHsh_:[S

.field strLen_:[I

.field strNxt_:[S


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const/16 v0, 0x1000

    new-array v1, v0, [B

    iput-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strChr_:[B

    .line 76
    new-array v1, v0, [S

    iput-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strNxt_:[S

    .line 77
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    .line 78
    const/16 v0, 0x26f5

    new-array v0, v0, [S

    iput-object v0, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strHsh_:[S

    .line 79
    return-void
.end method

.method public static Hash(SB)I
    .locals 2
    .param p0, "index"    # S
    .param p1, "lastbyte"    # B

    .line 162
    shl-int/lit8 v0, p1, 0x8

    int-to-short v0, v0

    xor-int/2addr v0, p0

    const v1, 0xffff

    and-int/2addr v0, v1

    rem-int/lit16 v0, v0, 0x26f5

    return v0
.end method


# virtual methods
.method public AddCharString(SB)I
    .locals 5
    .param p1, "index"    # S
    .param p2, "b"    # B

    .line 92
    iget-short v0, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    const/16 v1, 0x1000

    if-lt v0, v1, :cond_0

    .line 94
    const v0, 0xffff

    return v0

    .line 97
    :cond_0
    invoke-static {p1, p2}, Lcom/itextpdf/io/codec/LZWStringTable;->Hash(SB)I

    move-result v0

    .line 98
    .local v0, "hshidx":I
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strHsh_:[S

    aget-short v1, v1, v0

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 99
    add-int/lit16 v1, v0, 0x7f7

    rem-int/lit16 v0, v1, 0x26f5

    goto :goto_0

    .line 101
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strHsh_:[S

    iget-short v3, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    aput-short v3, v1, v0

    .line 102
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strChr_:[B

    iget-short v3, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    aput-byte p2, v1, v3

    .line 103
    nop

    .line 107
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strNxt_:[S

    .line 103
    const/4 v3, 0x1

    if-ne p1, v2, :cond_2

    .line 104
    iget-short v4, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    aput-short v2, v1, v4

    .line 105
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    iget-short v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    aput v3, v1, v2

    goto :goto_1

    .line 107
    :cond_2
    iget-short v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    aput-short p1, v1, v2

    .line 108
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    iget-short v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    iget-object v4, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    aget v4, v4, p1

    add-int/2addr v4, v3

    aput v4, v1, v2

    .line 112
    :goto_1
    iget-short v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    add-int/lit8 v2, v1, 0x1

    int-to-short v2, v2

    iput-short v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    return v1
.end method

.method public ClearTable(I)V
    .locals 4
    .param p1, "codesize"    # I

    .line 148
    const/4 v0, 0x0

    iput-short v0, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    .line 150
    const/4 v0, 0x0

    .local v0, "q":I
    :goto_0
    const/16 v1, 0x26f5

    const/4 v2, -0x1

    if-ge v0, v1, :cond_0

    .line 151
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strHsh_:[S

    aput-short v2, v1, v0

    .line 150
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 153
    .end local v0    # "q":I
    :cond_0
    const/4 v0, 0x1

    shl-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x2

    .line 154
    .local v0, "w":I
    const/4 v1, 0x0

    .local v1, "q":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 157
    int-to-byte v3, v1

    invoke-virtual {p0, v2, v3}, Lcom/itextpdf/io/codec/LZWStringTable;->AddCharString(SB)I

    .line 154
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 159
    .end local v1    # "q":I
    :cond_1
    return-void
.end method

.method public FindCharString(SB)S
    .locals 4
    .param p1, "index"    # S
    .param p2, "b"    # B

    .line 124
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 127
    and-int/lit16 v0, p2, 0xff

    int-to-short v0, v0

    return v0

    .line 129
    :cond_0
    invoke-static {p1, p2}, Lcom/itextpdf/io/codec/LZWStringTable;->Hash(SB)I

    move-result v1

    .line 132
    .local v1, "hshidx":I
    :goto_0
    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strHsh_:[S

    aget-short v2, v2, v1

    move v3, v2

    .local v3, "nxtidx":I
    if-eq v2, v0, :cond_2

    .line 134
    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strNxt_:[S

    aget-short v2, v2, v3

    if-ne v2, p1, :cond_1

    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strChr_:[B

    aget-byte v2, v2, v3

    if-ne v2, p2, :cond_1

    .line 135
    int-to-short v0, v3

    return v0

    .line 136
    :cond_1
    add-int/lit16 v2, v1, 0x7f7

    rem-int/lit16 v1, v2, 0x26f5

    goto :goto_0

    .line 140
    :cond_2
    return v0
.end method

.method public dump(Ljava/io/PrintStream;)V
    .locals 3
    .param p1, "output"    # Ljava/io/PrintStream;

    .line 247
    const/16 v0, 0x102

    .local v0, "i":I
    :goto_0
    iget-short v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->numStrings_:S

    if-ge v0, v1, :cond_0

    .line 248
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " strNxt_["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strNxt_:[S

    aget-short v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " strChr_ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strChr_:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    .line 249
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " strLen_ "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    aget v2, v2, v0

    .line 250
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 248
    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 247
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 251
    :cond_0
    return-void
.end method

.method public expandCode([BISI)I
    .locals 7
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "code"    # S
    .param p4, "skipHead"    # I

    .line 186
    const/4 v0, -0x2

    if-ne p2, v0, :cond_0

    .line 187
    const/4 v0, 0x1

    if-ne p4, v0, :cond_0

    const/4 p4, 0x0

    .line 192
    :cond_0
    const/4 v0, -0x1

    if-eq p3, v0, :cond_6

    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    aget v1, v1, p3

    if-ne p4, v1, :cond_1

    goto :goto_2

    .line 202
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strLen_:[I

    aget v1, v1, p3

    sub-int/2addr v1, p4

    .line 205
    .local v1, "codeLen":I
    array-length v2, p1

    sub-int/2addr v2, p2

    .line 206
    .local v2, "bufSpace":I
    if-le v2, v1, :cond_2

    .line 209
    move v3, v1

    .local v3, "expandLen":I
    goto :goto_0

    .line 211
    .end local v3    # "expandLen":I
    :cond_2
    move v3, v2

    .line 215
    .restart local v3    # "expandLen":I
    :goto_0
    sub-int v4, v1, v3

    .line 218
    .local v4, "skipTail":I
    add-int v5, p2, v3

    .line 222
    .local v5, "idx":I
    :goto_1
    if-le v5, p2, :cond_4

    if-eq p3, v0, :cond_4

    .line 225
    add-int/lit8 v4, v4, -0x1

    if-gez v4, :cond_3

    .line 227
    add-int/lit8 v5, v5, -0x1

    iget-object v6, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strChr_:[B

    aget-byte v6, v6, p3

    aput-byte v6, p1, v5

    .line 231
    :cond_3
    iget-object v6, p0, Lcom/itextpdf/io/codec/LZWStringTable;->strNxt_:[S

    aget-short p3, v6, p3

    goto :goto_1

    .line 234
    :cond_4
    if-le v1, v3, :cond_5

    .line 237
    neg-int v0, v3

    return v0

    .line 241
    :cond_5
    return v3

    .line 196
    .end local v1    # "codeLen":I
    .end local v2    # "bufSpace":I
    .end local v3    # "expandLen":I
    .end local v4    # "skipTail":I
    .end local v5    # "idx":I
    :cond_6
    :goto_2
    const/4 v0, 0x0

    return v0
.end method
