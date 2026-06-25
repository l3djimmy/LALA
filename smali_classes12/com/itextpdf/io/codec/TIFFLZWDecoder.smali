.class public Lcom/itextpdf/io/codec/TIFFLZWDecoder;
.super Ljava/lang/Object;
.source "TIFFLZWDecoder.java"


# instance fields
.field andTable:[I

.field bitPointer:I

.field bitsToGet:I

.field bytePointer:I

.field data:[B

.field dstIndex:I

.field h:I

.field nextBits:I

.field nextData:I

.field predictor:I

.field samplesPerPixel:I

.field stringTable:[[B

.field tableIndex:I

.field uncompData:[B

.field w:I


# direct methods
.method public constructor <init>(III)V
    .locals 4
    .param p1, "w"    # I
    .param p2, "predictor"    # I
    .param p3, "samplesPerPixel"    # I

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->data:[B

    .line 60
    const/16 v0, 0x9

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    .line 68
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    .line 69
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    .line 71
    const/16 v0, 0x7ff

    const/16 v1, 0xfff

    const/16 v2, 0x1ff

    const/16 v3, 0x3ff

    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->andTable:[I

    .line 79
    iput p1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->w:I

    .line 80
    iput p2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->predictor:I

    .line 81
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->samplesPerPixel:I

    .line 82
    return-void
.end method


# virtual methods
.method public addStringToTable([B)V
    .locals 3
    .param p1, "str"    # [B

    .line 222
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    aput-object p1, v0, v1

    .line 224
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v1, 0x1ff

    if-ne v0, v1, :cond_0

    .line 225
    const/16 v0, 0xa

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 226
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v1, 0x3ff

    if-ne v0, v1, :cond_1

    .line 227
    const/16 v0, 0xb

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 228
    :cond_1
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v1, 0x7ff

    if-ne v0, v1, :cond_2

    .line 229
    const/16 v0, 0xc

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    .line 231
    :cond_2
    :goto_0
    return-void
.end method

.method public addStringToTable([BB)V
    .locals 5
    .param p1, "oldString"    # [B
    .param p2, "newString"    # B

    .line 197
    array-length v0, p1

    .line 198
    .local v0, "length":I
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [B

    .line 199
    .local v1, "str":[B
    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    aput-byte p2, v1, v0

    .line 203
    iget-object v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    iget v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    aput-object v1, v2, v3

    .line 205
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v3, 0x1ff

    if-ne v2, v3, :cond_0

    .line 206
    const/16 v2, 0xa

    iput v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 207
    :cond_0
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v3, 0x3ff

    if-ne v2, v3, :cond_1

    .line 208
    const/16 v2, 0xb

    iput v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 209
    :cond_1
    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    const/16 v3, 0x7ff

    if-ne v2, v3, :cond_2

    .line 210
    const/16 v2, 0xc

    iput v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    .line 212
    :cond_2
    :goto_0
    return-void
.end method

.method public composeString([BB)[B
    .locals 3
    .param p1, "oldString"    # [B
    .param p2, "newString"    # B

    .line 241
    array-length v0, p1

    .line 242
    .local v0, "length":I
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [B

    .line 243
    .local v1, "str":[B
    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 244
    aput-byte p2, v1, v0

    .line 246
    return-object v1
.end method

.method public decode([B[BI)[B
    .locals 8
    .param p1, "data"    # [B
    .param p2, "uncompData"    # [B
    .param p3, "h"    # I

    .line 94
    const/4 v0, 0x0

    aget-byte v1, p1, v0

    const/4 v2, 0x1

    if-nez v1, :cond_1

    aget-byte v1, p1, v2

    if-eq v1, v2, :cond_0

    goto :goto_0

    .line 95
    :cond_0
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string v1, "TIFF 5.0-style LZW codes are not supported."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->initializeStringTable()V

    .line 100
    iput-object p1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->data:[B

    .line 101
    iput p3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->h:I

    .line 102
    iput-object p2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->uncompData:[B

    .line 105
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bytePointer:I

    .line 106
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitPointer:I

    .line 107
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    .line 109
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    .line 110
    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    .line 112
    const/4 v1, 0x0

    .line 115
    .local v1, "oldCode":I
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->getNextCode()I

    move-result v3

    move v4, v3

    .local v4, "code":I
    const/16 v5, 0x101

    if-eq v3, v5, :cond_5

    iget v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    array-length v6, p2

    if-ge v3, v6, :cond_5

    .line 118
    const/16 v3, 0x100

    if-ne v4, v3, :cond_3

    .line 119
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->initializeStringTable()V

    .line 120
    invoke-virtual {p0}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->getNextCode()I

    move-result v4

    .line 121
    if-ne v4, v5, :cond_2

    .line 122
    goto :goto_2

    .line 124
    :cond_2
    iget-object v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    aget-object v3, v3, v4

    invoke-virtual {p0, v3}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->writeString([B)V

    .line 125
    move v1, v4

    goto :goto_1

    .line 128
    :cond_3
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    .line 134
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    .line 128
    if-ge v4, v3, :cond_4

    .line 129
    aget-object v3, v5, v4

    .line 130
    .local v3, "str":[B
    invoke-virtual {p0, v3}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->writeString([B)V

    .line 131
    iget-object v5, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    aget-object v5, v5, v1

    aget-byte v6, v3, v0

    invoke-virtual {p0, v5, v6}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->addStringToTable([BB)V

    .line 132
    move v1, v4

    goto :goto_1

    .line 134
    .end local v3    # "str":[B
    :cond_4
    aget-object v3, v5, v1

    .line 135
    .restart local v3    # "str":[B
    aget-byte v5, v3, v0

    invoke-virtual {p0, v3, v5}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->composeString([BB)[B

    move-result-object v3

    .line 136
    invoke-virtual {p0, v3}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->writeString([B)V

    .line 137
    invoke-virtual {p0, v3}, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->addStringToTable([B)V

    .line 138
    move v1, v4

    goto :goto_1

    .line 144
    .end local v3    # "str":[B
    :cond_5
    :goto_2
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->predictor:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7

    .line 146
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_3
    if-ge v0, p3, :cond_7

    .line 147
    iget v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->samplesPerPixel:I

    iget v5, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->w:I

    mul-int/2addr v5, v0

    add-int/2addr v5, v2

    mul-int/2addr v3, v5

    .line 148
    .local v3, "count":I
    iget v5, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->samplesPerPixel:I

    .local v5, "i":I
    :goto_4
    iget v6, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->w:I

    iget v7, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->samplesPerPixel:I

    mul-int/2addr v6, v7

    if-ge v5, v6, :cond_6

    .line 150
    aget-byte v6, p2, v3

    iget v7, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->samplesPerPixel:I

    sub-int v7, v3, v7

    aget-byte v7, p2, v7

    add-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, p2, v3

    .line 151
    add-int/lit8 v3, v3, 0x1

    .line 148
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 146
    .end local v5    # "i":I
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 156
    .end local v0    # "j":I
    .end local v3    # "count":I
    :cond_7
    return-object p2
.end method

.method public getNextCode()I
    .locals 4

    .line 256
    :try_start_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->data:[B

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bytePointer:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bytePointer:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    .line 257
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    .line 259
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    if-ge v0, v1, :cond_0

    .line 260
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->data:[B

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bytePointer:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bytePointer:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    .line 261
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    .line 264
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextData:I

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    sub-int/2addr v1, v2

    shr-int/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->andTable:[I

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    add-int/lit8 v2, v2, -0x9

    aget v1, v1, v2

    and-int/2addr v0, v1

    .line 266
    .local v0, "code":I
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->nextBits:I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    return v0

    .line 269
    .end local v0    # "code":I
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    const/16 v1, 0x101

    return v1
.end method

.method public initializeStringTable()V
    .locals 4

    .line 164
    const/16 v0, 0x1000

    new-array v0, v0, [[B

    iput-object v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    .line 166
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    .line 167
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    const/4 v2, 0x1

    new-array v2, v2, [B

    aput-object v2, v1, v0

    .line 168
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->stringTable:[[B

    aget-object v1, v1, v0

    const/4 v2, 0x0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 171
    .end local v0    # "i":I
    :cond_0
    const/16 v0, 0x102

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->tableIndex:I

    .line 172
    const/16 v0, 0x9

    iput v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->bitsToGet:I

    .line 173
    return-void
.end method

.method public writeString([B)V
    .locals 4
    .param p1, "str"    # [B

    .line 182
    iget-object v0, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->uncompData:[B

    array-length v0, v0

    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    sub-int/2addr v0, v1

    .line 183
    .local v0, "max":I
    array-length v1, p1

    if-ge v1, v0, :cond_0

    .line 184
    array-length v0, p1

    .line 185
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->uncompData:[B

    iget v2, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    const/4 v3, 0x0

    invoke-static {p1, v3, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 186
    iget v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/itextpdf/io/codec/TIFFLZWDecoder;->dstIndex:I

    .line 187
    return-void
.end method
