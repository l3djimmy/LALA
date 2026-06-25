.class final Lcom/itextpdf/io/codec/brotli/dec/BitReader;
.super Ljava/lang/Object;
.source "BitReader.java"


# static fields
.field private static final BYTE_BUFFER_SIZE:I = 0x1040

.field private static final BYTE_READ_SIZE:I = 0x1000

.field private static final CAPACITY:I = 0x400

.field private static final INT_BUFFER_SIZE:I = 0x410

.field private static final SLACK:I = 0x10


# instance fields
.field accumulator:J

.field bitOffset:I

.field private final byteBuffer:[B

.field private endOfStreamReached:Z

.field private input:Ljava/io/InputStream;

.field private final intBuffer:[I

.field private intOffset:I

.field private final intReader:Lcom/itextpdf/io/codec/brotli/dec/IntReader;

.field private tailBytes:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const/16 v0, 0x1040

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    .line 28
    const/16 v0, 0x410

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intBuffer:[I

    .line 29
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;

    invoke-direct {v0}, Lcom/itextpdf/io/codec/brotli/dec/IntReader;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intReader:Lcom/itextpdf/io/codec/brotli/dec/IntReader;

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->tailBytes:I

    return-void
.end method

.method static checkHealth(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Z)V
    .locals 3
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .param p1, "endOfStream"    # Z

    .line 98
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->endOfStreamReached:Z

    if-nez v0, :cond_0

    .line 99
    return-void

    .line 101
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    shl-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    add-int/lit8 v1, v1, 0x7

    shr-int/lit8 v1, v1, 0x3

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x8

    .line 102
    .local v0, "byteOffset":I
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->tailBytes:I

    if-gt v0, v1, :cond_3

    .line 105
    if-eqz p1, :cond_2

    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->tailBytes:I

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 106
    :cond_1
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v2, "Unused bytes after end"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 108
    :cond_2
    :goto_0
    return-void

    .line 103
    :cond_3
    new-instance v1, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v2, "Read after end"

    invoke-direct {v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static close(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 2
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 166
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    .line 167
    .local v0, "is":Ljava/io/InputStream;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    .line 168
    if-eqz v0, :cond_0

    .line 169
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 171
    :cond_0
    return-void
.end method

.method static copyBytes(Lcom/itextpdf/io/codec/brotli/dec/BitReader;[BII)V
    .locals 5
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 192
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    and-int/lit8 v0, v0, 0x7

    if-nez v0, :cond_8

    .line 197
    :goto_0
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    const/16 v1, 0x40

    if-eq v0, v1, :cond_0

    if-eqz p3, :cond_0

    .line 198
    add-int/lit8 v0, p2, 0x1

    .end local p2    # "offset":I
    .local v0, "offset":I
    iget-wide v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v1, v3

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p1, p2

    .line 199
    iget p2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    add-int/lit8 p2, p2, 0x8

    iput p2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 200
    add-int/lit8 p3, p3, -0x1

    move p2, v0

    goto :goto_0

    .line 202
    .end local v0    # "offset":I
    .restart local p2    # "offset":I
    :cond_0
    if-nez p3, :cond_1

    .line 203
    return-void

    .line 207
    :cond_1
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intAvailable(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v0

    shr-int/lit8 v1, p3, 0x2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 208
    .local v0, "copyInts":I
    if-lez v0, :cond_2

    .line 209
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    shl-int/lit8 v1, v1, 0x2

    .line 210
    .local v1, "readOffset":I
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    shl-int/lit8 v3, v0, 0x2

    invoke-static {v2, v1, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    shl-int/lit8 v2, v0, 0x2

    add-int/2addr p2, v2

    .line 212
    shl-int/lit8 v2, v0, 0x2

    sub-int/2addr p3, v2

    .line 213
    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    .line 215
    .end local v1    # "readOffset":I
    :cond_2
    if-nez p3, :cond_3

    .line 216
    return-void

    .line 220
    :cond_3
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intAvailable(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v1

    if-lez v1, :cond_5

    .line 222
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 223
    :goto_1
    if-eqz p3, :cond_4

    .line 224
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "offset":I
    .local v1, "offset":I
    iget-wide v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v4, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p1, p2

    .line 225
    iget p2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    add-int/lit8 p2, p2, 0x8

    iput p2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 226
    add-int/lit8 p3, p3, -0x1

    move p2, v1

    goto :goto_1

    .line 228
    .end local v1    # "offset":I
    .restart local p2    # "offset":I
    :cond_4
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->checkHealth(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Z)V

    .line 229
    return-void

    .line 234
    :cond_5
    :goto_2
    if-lez p3, :cond_7

    .line 235
    :try_start_0
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 236
    .local v1, "len":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_6

    .line 239
    add-int/2addr p2, v1

    .line 240
    sub-int/2addr p3, v1

    .line 241
    .end local v1    # "len":I
    goto :goto_2

    .line 237
    .restart local v1    # "len":I
    :cond_6
    new-instance v2, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v3, "Unexpected end of input"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "copyInts":I
    .end local p0    # "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .end local p1    # "data":[B
    .end local p2    # "offset":I
    .end local p3    # "length":I
    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .end local v1    # "len":I
    .restart local v0    # "copyInts":I
    .restart local p0    # "br":Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .restart local p1    # "data":[B
    .restart local p2    # "offset":I
    .restart local p3    # "length":I
    :catch_0
    move-exception v1

    .line 243
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v3, "Failed to read input"

    invoke-direct {v2, v3, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 244
    .end local v1    # "e":Ljava/io/IOException;
    :cond_7
    nop

    .line 245
    return-void

    .line 193
    .end local v0    # "copyInts":I
    :cond_8
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v1, "Unaligned copyBytes"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 6
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 114
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    const/16 v1, 0x20

    if-lt v0, v1, :cond_0

    .line 115
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intBuffer:[I

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    aget v0, v0, v2

    int-to-long v2, v0

    shl-long/2addr v2, v1

    iget-wide v4, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    ushr-long/2addr v4, v1

    or-long/2addr v2, v4

    iput-wide v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    .line 116
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 118
    :cond_0
    return-void
.end method

.method static init(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Ljava/io/InputStream;)V
    .locals 3
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .param p1, "input"    # Ljava/io/InputStream;

    .line 140
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intReader:Lcom/itextpdf/io/codec/brotli/dec/IntReader;

    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intBuffer:[I

    invoke-static {v0, v1, v2}, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->init(Lcom/itextpdf/io/codec/brotli/dec/IntReader;[B[I)V

    .line 144
    iput-object p1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    .line 145
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    .line 146
    const/16 v0, 0x40

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 147
    const/16 v0, 0x400

    iput v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->endOfStreamReached:Z

    .line 149
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->prepare(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 150
    return-void

    .line 141
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bit reader already has associated input stream"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static intAvailable(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I
    .locals 2
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 184
    const/16 v0, 0x400

    .line 185
    .local v0, "limit":I
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->endOfStreamReached:Z

    if-eqz v1, :cond_0

    .line 186
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->tailBytes:I

    add-int/lit8 v1, v1, 0x3

    shr-int/lit8 v0, v1, 0x2

    .line 188
    :cond_0
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    sub-int v1, v0, v1

    return v1
.end method

.method static jumpToByteBoundary(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 4
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 174
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    rsub-int/lit8 v0, v0, 0x40

    and-int/lit8 v0, v0, 0x7

    .line 175
    .local v0, "padding":I
    if-eqz v0, :cond_1

    .line 176
    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I

    move-result v1

    .line 177
    .local v1, "paddingBits":I
    if-nez v1, :cond_0

    goto :goto_0

    .line 178
    :cond_0
    new-instance v2, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v3, "Corrupted padding bits"

    invoke-direct {v2, v3}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 181
    .end local v1    # "paddingBits":I
    :cond_1
    :goto_0
    return-void
.end method

.method private static prepare(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 1
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 153
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 154
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->checkHealth(Lcom/itextpdf/io/codec/brotli/dec/BitReader;Z)V

    .line 155
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 156
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 157
    return-void
.end method

.method static readBits(Lcom/itextpdf/io/codec/brotli/dec/BitReader;I)I
    .locals 3
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;
    .param p1, "n"    # I

    .line 124
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->fillBitWindow(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 125
    iget-wide v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->accumulator:J

    iget v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    const/4 v1, 0x1

    shl-int v2, v1, p1

    sub-int/2addr v2, v1

    and-int/2addr v0, v2

    .line 126
    .local v0, "val":I
    iget v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    .line 127
    return v0
.end method

.method static readMoreInput(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 5
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 66
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    const/16 v1, 0x3f7

    if-gt v0, v1, :cond_0

    .line 67
    return-void

    .line 69
    :cond_0
    iget-boolean v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->endOfStreamReached:Z

    if-eqz v0, :cond_2

    .line 70
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intAvailable(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)I

    move-result v0

    const/4 v1, -0x2

    if-lt v0, v1, :cond_1

    .line 71
    return-void

    .line 73
    :cond_1
    new-instance v0, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v1, "No more input"

    invoke-direct {v0, v1}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_2
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    shl-int/lit8 v0, v0, 0x2

    .line 76
    .local v0, "readOffset":I
    rsub-int v1, v0, 0x1000

    .line 77
    .local v1, "bytesRead":I
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    const/4 v4, 0x0

    invoke-static {v2, v0, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iput v4, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intOffset:I

    .line 80
    :goto_0
    const/16 v2, 0x1000

    if-ge v1, v2, :cond_4

    .line 81
    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->input:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->byteBuffer:[B

    rsub-int v4, v1, 0x1000

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 83
    .local v2, "len":I
    if-gtz v2, :cond_3

    .line 84
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->endOfStreamReached:Z

    .line 85
    iput v1, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->tailBytes:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    add-int/lit8 v1, v1, 0x3

    .line 87
    goto :goto_1

    .line 89
    :cond_3
    add-int/2addr v1, v2

    .line 90
    .end local v2    # "len":I
    goto :goto_0

    .line 91
    :catch_0
    move-exception v2

    .line 92
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;

    const-string v4, "Failed to read input"

    invoke-direct {v3, v4, v2}, Lcom/itextpdf/io/codec/brotli/dec/BrotliRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 93
    .end local v2    # "e":Ljava/io/IOException;
    :cond_4
    :goto_1
    nop

    .line 94
    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->intReader:Lcom/itextpdf/io/codec/brotli/dec/IntReader;

    shr-int/lit8 v3, v1, 0x2

    invoke-static {v2, v3}, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->convert(Lcom/itextpdf/io/codec/brotli/dec/IntReader;I)V

    .line 95
    return-void
.end method

.method static reload(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V
    .locals 2
    .param p0, "br"    # Lcom/itextpdf/io/codec/brotli/dec/BitReader;

    .line 160
    iget v0, p0, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->bitOffset:I

    const/16 v1, 0x40

    if-ne v0, v1, :cond_0

    .line 161
    invoke-static {p0}, Lcom/itextpdf/io/codec/brotli/dec/BitReader;->prepare(Lcom/itextpdf/io/codec/brotli/dec/BitReader;)V

    .line 163
    :cond_0
    return-void
.end method
