.class public Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;
.super Ljava/lang/Object;
.source "LZWDecoder.java"


# instance fields
.field andTable:[I

.field bitPointer:I

.field bitsToGet:I

.field bytePointer:I

.field data:[B

.field nextBits:I

.field nextData:I

.field stringTable:[[B

.field tableIndex:I

.field uncompData:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->data:[B

    .line 39
    const/16 v0, 0x9

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    .line 42
    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    .line 44
    const/16 v0, 0x7ff

    const/16 v1, 0xfff

    const/16 v2, 0x1ff

    const/16 v3, 0x3ff

    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->andTable:[I

    .line 56
    return-void
.end method


# virtual methods
.method public addStringToTable([B)V
    .locals 3
    .param p1, "string"    # [B

    .line 183
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    iget v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    aput-object p1, v0, v1

    .line 185
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v1, 0x1ff

    if-ne v0, v1, :cond_0

    .line 186
    const/16 v0, 0xa

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 187
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v1, 0x3ff

    if-ne v0, v1, :cond_1

    .line 188
    const/16 v0, 0xb

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 189
    :cond_1
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v1, 0x7ff

    if-ne v0, v1, :cond_2

    .line 190
    const/16 v0, 0xc

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    .line 192
    :cond_2
    :goto_0
    return-void
.end method

.method public addStringToTable([BB)V
    .locals 5
    .param p1, "oldString"    # [B
    .param p2, "newString"    # B

    .line 158
    array-length v0, p1

    .line 159
    .local v0, "length":I
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [B

    .line 160
    .local v1, "string":[B
    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 161
    aput-byte p2, v1, v0

    .line 164
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    iget v3, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    aput-object v1, v2, v3

    .line 166
    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v3, 0x1ff

    if-ne v2, v3, :cond_0

    .line 167
    const/16 v2, 0xa

    iput v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 168
    :cond_0
    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v3, 0x3ff

    if-ne v2, v3, :cond_1

    .line 169
    const/16 v2, 0xb

    iput v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    goto :goto_0

    .line 170
    :cond_1
    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    const/16 v3, 0x7ff

    if-ne v2, v3, :cond_2

    .line 171
    const/16 v2, 0xc

    iput v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    .line 173
    :cond_2
    :goto_0
    return-void
.end method

.method public composeString([BB)[B
    .locals 3
    .param p1, "oldString"    # [B
    .param p2, "newString"    # B

    .line 202
    array-length v0, p1

    .line 203
    .local v0, "length":I
    add-int/lit8 v1, v0, 0x1

    new-array v1, v1, [B

    .line 204
    .local v1, "string":[B
    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    aput-byte p2, v1, v0

    .line 207
    return-object v1
.end method

.method public decode([BLjava/io/OutputStream;)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "uncompData"    # Ljava/io/OutputStream;

    .line 66
    const/4 v0, 0x0

    aget-byte v1, p1, v0

    if-nez v1, :cond_1

    const/4 v1, 0x1

    aget-byte v2, p1, v1

    if-eq v2, v1, :cond_0

    goto :goto_0

    .line 67
    :cond_0
    new-instance v0, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v1, "LZW flavour not supported."

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->initializeStringTable()V

    .line 72
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->data:[B

    .line 73
    iput-object p2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->uncompData:Ljava/io/OutputStream;

    .line 76
    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bytePointer:I

    .line 77
    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitPointer:I

    .line 79
    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    .line 80
    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    .line 82
    const/4 v1, 0x0

    .line 85
    .local v1, "oldCode":I
    :goto_1
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->getNextCode()I

    move-result v2

    move v3, v2

    .local v3, "code":I
    const/16 v4, 0x101

    if-eq v2, v4, :cond_5

    .line 87
    const/16 v2, 0x100

    if-ne v3, v2, :cond_3

    .line 89
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->initializeStringTable()V

    .line 90
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->getNextCode()I

    move-result v3

    .line 92
    if-ne v3, v4, :cond_2

    .line 93
    goto :goto_2

    .line 96
    :cond_2
    iget-object v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    aget-object v2, v2, v3

    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->writeString([B)V

    .line 97
    move v1, v3

    goto :goto_1

    .line 101
    :cond_3
    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    .line 111
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    .line 101
    if-ge v3, v2, :cond_4

    .line 103
    aget-object v2, v4, v3

    .line 105
    .local v2, "string":[B
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->writeString([B)V

    .line 106
    iget-object v4, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    aget-object v4, v4, v1

    aget-byte v5, v2, v0

    invoke-virtual {p0, v4, v5}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->addStringToTable([BB)V

    .line 107
    move v1, v3

    goto :goto_1

    .line 111
    .end local v2    # "string":[B
    :cond_4
    aget-object v2, v4, v1

    .line 112
    .restart local v2    # "string":[B
    aget-byte v4, v2, v0

    invoke-virtual {p0, v2, v4}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->composeString([BB)[B

    move-result-object v2

    .line 113
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->writeString([B)V

    .line 114
    invoke-virtual {p0, v2}, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->addStringToTable([B)V

    .line 115
    move v1, v3

    goto :goto_1

    .line 119
    .end local v2    # "string":[B
    :cond_5
    :goto_2
    return-void
.end method

.method public getNextCode()I
    .locals 4

    .line 223
    :try_start_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->data:[B

    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bytePointer:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bytePointer:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    .line 224
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    .line 226
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    if-ge v0, v1, :cond_0

    .line 227
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->data:[B

    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bytePointer:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bytePointer:I

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    .line 228
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    .line 231
    :cond_0
    iget v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextData:I

    iget v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    sub-int/2addr v1, v2

    shr-int/2addr v0, v1

    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->andTable:[I

    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    add-int/lit8 v2, v2, -0x9

    aget v1, v1, v2

    and-int/2addr v0, v1

    .line 233
    .local v0, "code":I
    iget v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I

    iget v2, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->nextBits:I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    return v0

    .line 236
    .end local v0    # "code":I
    :catch_0
    move-exception v0

    .line 238
    .local v0, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    const/16 v1, 0x101

    return v1
.end method

.method public initializeStringTable()V
    .locals 4

    .line 127
    const/16 v0, 0x2000

    new-array v0, v0, [[B

    iput-object v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    .line 129
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x100

    if-ge v0, v1, :cond_0

    .line 130
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    const/4 v2, 0x1

    new-array v2, v2, [B

    aput-object v2, v1, v0

    .line 131
    iget-object v1, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->stringTable:[[B

    aget-object v1, v1, v0

    const/4 v2, 0x0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 129
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 134
    .end local v0    # "i":I
    :cond_0
    const/16 v0, 0x102

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->tableIndex:I

    .line 135
    const/16 v0, 0x9

    iput v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->bitsToGet:I

    .line 136
    return-void
.end method

.method public writeString([B)V
    .locals 3
    .param p1, "string"    # [B

    .line 145
    :try_start_0
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/filters/LZWDecoder;->uncompData:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    nop

    .line 149
    return-void

    .line 146
    :catch_0
    move-exception v0

    .line 147
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/itextpdf/kernel/exceptions/PdfException;

    const-string v2, "LZW decoder exception."

    invoke-direct {v1, v2, v0}, Lcom/itextpdf/kernel/exceptions/PdfException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
