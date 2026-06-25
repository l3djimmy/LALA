.class public Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;
.super Ljava/lang/Object;
.source "ByteBuffer.java"


# instance fields
.field private buffer:[B

.field private encoding:Ljava/lang/String;

.field private length:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 58
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 97
    const/16 v0, 0x4000

    .line 98
    .local v0, "chunk":I
    const/4 v1, 0x0

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 99
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 102
    :goto_0
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    iget v2, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    invoke-virtual {p1, v1, v2, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    move v2, v1

    .local v2, "read":I
    if-lez v1, :cond_0

    .line 104
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 105
    if-ne v2, v0, :cond_0

    .line 107
    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->ensureCapacity(I)V

    goto :goto_0

    .line 114
    :cond_0
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "buffer"    # [B

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 68
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 69
    array-length v0, p1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 70
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "length"    # I

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 79
    array-length v0, p1

    if-gt p2, v0, :cond_0

    .line 83
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 84
    iput p2, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 85
    return-void

    .line 81
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "Valid length exceeds the buffer length."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>([BII)V
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 124
    array-length v0, p1

    sub-int/2addr v0, p2

    if-gt p3, v0, :cond_0

    .line 128
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 129
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    iput p3, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 131
    return-void

    .line 126
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "Valid length exceeds the buffer length."

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private ensureCapacity(I)V
    .locals 4
    .param p1, "requestedLength"    # I

    .line 339
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    array-length v0, v0

    if-le p1, v0, :cond_0

    .line 341
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 342
    .local v0, "oldBuf":[B
    array-length v1, v0

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 343
    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 345
    .end local v0    # "oldBuf":[B
    :cond_0
    return-void
.end method


# virtual methods
.method public append(B)V
    .locals 3
    .param p1, "b"    # B

    .line 203
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->ensureCapacity(I)V

    .line 204
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    aput-byte p1, v0, v1

    .line 205
    return-void
.end method

.method public append(Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;)V
    .locals 3
    .param p1, "anotherBuffer"    # Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;

    .line 240
    iget-object v0, p1, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    const/4 v1, 0x0

    iget v2, p1, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([BII)V

    .line 241
    return-void
.end method

.method public append([B)V
    .locals 2
    .param p1, "bytes"    # [B

    .line 230
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->append([BII)V

    .line 231
    return-void
.end method

.method public append([BII)V
    .locals 2
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .line 218
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v0, p3

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->ensureCapacity(I)V

    .line 219
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    iget v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 220
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    .line 221
    return-void
.end method

.method public byteAt(I)B
    .locals 2
    .param p1, "index"    # I

    .line 169
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    if-ge p1, v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, p1

    return v0

    .line 175
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "The index exceeds the valid buffer area"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public charAt(I)I
    .locals 2
    .param p1, "index"    # I

    .line 186
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    if-ge p1, v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, p1

    and-int/lit16 v0, v0, 0xff

    return v0

    .line 192
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "The index exceeds the valid buffer area"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getByteStream()Ljava/io/InputStream;
    .locals 4

    .line 139
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    const/4 v2, 0x0

    iget v3, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    invoke-direct {v0, v1, v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 11

    .line 253
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    if-nez v0, :cond_d

    .line 256
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    const-string v1, "UTF-8"

    const/4 v2, 0x2

    if-ge v0, v2, :cond_0

    .line 259
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto/16 :goto_3

    .line 261
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    const/4 v3, 0x0

    aget-byte v0, v0, v3

    const-string v4, "UTF-32"

    const/16 v5, 0xfe

    const/4 v6, 0x1

    const/4 v7, 0x4

    const/16 v8, 0xff

    if-nez v0, :cond_4

    .line 268
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    if-lt v0, v7, :cond_3

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v6

    if-eqz v0, :cond_1

    goto :goto_0

    .line 272
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v2

    and-int/2addr v0, v8

    if-ne v0, v5, :cond_2

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    const/4 v1, 0x3

    aget-byte v0, v0, v1

    and-int/2addr v0, v8

    if-ne v0, v8, :cond_2

    .line 274
    const-string v0, "UTF-32BE"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 278
    :cond_2
    iput-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 270
    :cond_3
    :goto_0
    const-string v0, "UTF-16BE"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 281
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v3

    and-int/2addr v0, v8

    .line 308
    iget-object v9, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    .line 281
    const/16 v10, 0x80

    if-ge v0, v10, :cond_8

    .line 287
    aget-byte v0, v9, v6

    if-eqz v0, :cond_5

    .line 289
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 291
    :cond_5
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    if-lt v0, v7, :cond_7

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v2

    if-eqz v0, :cond_6

    goto :goto_1

    .line 297
    :cond_6
    const-string v0, "UTF-32LE"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 293
    :cond_7
    :goto_1
    const-string v0, "UTF-16LE"

    iput-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 308
    :cond_8
    aget-byte v0, v9, v3

    and-int/2addr v0, v8

    const/16 v6, 0xef

    if-ne v0, v6, :cond_9

    .line 310
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 312
    :cond_9
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v3

    and-int/2addr v0, v8

    const-string v1, "UTF-16"

    if-ne v0, v5, :cond_a

    .line 314
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 316
    :cond_a
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    if-lt v0, v7, :cond_c

    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->buffer:[B

    aget-byte v0, v0, v2

    if-eqz v0, :cond_b

    goto :goto_2

    .line 322
    :cond_b
    iput-object v4, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    goto :goto_3

    .line 318
    :cond_c
    :goto_2
    iput-object v1, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    .line 327
    :cond_d
    :goto_3
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public length()I
    .locals 1

    .line 149
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/ByteBuffer;->length:I

    return v0
.end method
