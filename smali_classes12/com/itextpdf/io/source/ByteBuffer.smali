.class public Lcom/itextpdf/io/source/ByteBuffer;
.super Ljava/lang/Object;
.source "ByteBuffer.java"


# static fields
.field private static final bytes:[B


# instance fields
.field private buffer:[B

.field protected count:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 29
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/itextpdf/io/source/ByteBuffer;->bytes:[B

    return-void

    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 36
    const/16 v0, 0x80

    invoke-direct {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;-><init>(I)V

    .line 37
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    .line 41
    const/16 p1, 0x80

    .line 42
    :cond_0
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    .line 43
    return-void
.end method

.method public static getHex(I)I
    .locals 1
    .param p0, "v"    # I

    .line 46
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 47
    add-int/lit8 v0, p0, -0x30

    return v0

    .line 48
    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    .line 49
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 50
    :cond_1
    const/16 v0, 0x61

    if-lt p0, v0, :cond_2

    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    .line 51
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    return v0

    .line 52
    :cond_2
    const/4 v0, -0x1

    return v0
.end method


# virtual methods
.method public append(B)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 5
    .param p1, "b"    # B

    .line 56
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    add-int/lit8 v0, v0, 0x1

    .line 57
    .local v0, "newCount":I
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 58
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v1, v1, [B

    .line 59
    .local v1, "newBuffer":[B
    iget-object v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget v3, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    const/4 v4, 0x0

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    iput-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    .line 62
    .end local v1    # "newBuffer":[B
    :cond_0
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    aput-byte p1, v1, v2

    .line 63
    iput v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    .line 64
    return-object p0
.end method

.method public append(I)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 1
    .param p1, "b"    # I

    .line 87
    int-to-byte v0, p1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/String;)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .line 91
    invoke-static {p1}, Lcom/itextpdf/io/source/ByteUtils;->getIsoBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append([B)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public append([B)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 2
    .param p1, "b"    # [B

    .line 83
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->append([BII)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public append([BII)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 68
    if-ltz p2, :cond_2

    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    add-int v0, p2, p3

    array-length v1, p1

    if-gt v0, v1, :cond_2

    add-int v0, p2, p3

    if-ltz v0, :cond_2

    if-nez p3, :cond_0

    goto :goto_0

    .line 71
    :cond_0
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    add-int/2addr v0, p3

    .line 72
    .local v0, "newCount":I
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    if-le v0, v1, :cond_1

    .line 73
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    shl-int/lit8 v1, v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v1

    new-array v1, v1, [B

    .line 74
    .local v1, "newBuffer":[B
    iget-object v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget v3, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    const/4 v4, 0x0

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    iput-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    .line 77
    .end local v1    # "newBuffer":[B
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 78
    iput v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    .line 79
    return-object p0

    .line 70
    .end local v0    # "newCount":I
    :cond_2
    :goto_0
    return-object p0
.end method

.method public appendHex(B)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 2
    .param p1, "b"    # B

    .line 95
    sget-object v0, Lcom/itextpdf/io/source/ByteBuffer;->bytes:[B

    shr-int/lit8 v1, p1, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    .line 96
    sget-object v0, Lcom/itextpdf/io/source/ByteBuffer;->bytes:[B

    and-int/lit8 v1, p1, 0xf

    aget-byte v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/ByteBuffer;->append(B)Lcom/itextpdf/io/source/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public capacity()I
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v0, v0

    return v0
.end method

.method public get(I)B
    .locals 3
    .param p1, "index"    # I

    .line 100
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    if-ge p1, v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    aget-byte v0, v0, p1

    return v0

    .line 101
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Index: {0}, Size: {1}"

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getInternalBuffer()[B
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 115
    invoke-virtual {p0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method prepend(B)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 3
    .param p1, "b"    # B

    .line 154
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    iget v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    aput-byte p1, v0, v1

    .line 155
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    .line 156
    return-object p0
.end method

.method prepend([B)Lcom/itextpdf/io/source/ByteBuffer;
    .locals 4
    .param p1, "b"    # [B

    .line 166
    iget-object v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    array-length v1, v1

    iget v2, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    sub-int/2addr v1, v2

    array-length v2, p1

    sub-int/2addr v1, v2

    array-length v2, p1

    const/4 v3, 0x0

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    .line 168
    return-object p0
.end method

.method public reset()Lcom/itextpdf/io/source/ByteBuffer;
    .locals 1

    .line 123
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    .line 124
    return-object p0
.end method

.method public size()I
    .locals 1

    .line 111
    iget v0, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    return v0
.end method

.method public startsWith([B)Z
    .locals 4
    .param p1, "b"    # [B

    .line 138
    invoke-virtual {p0}, Lcom/itextpdf/io/source/ByteBuffer;->size()I

    move-result v0

    array-length v1, p1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 139
    return v2

    .line 140
    :cond_0
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_2

    .line 141
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    aget-byte v1, v1, v0

    aget-byte v3, p1, v0

    if-eq v1, v3, :cond_1

    .line 142
    return v2

    .line 140
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 144
    .end local v0    # "k":I
    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public toByteArray()[B
    .locals 2

    .line 134
    const/4 v0, 0x0

    iget v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->count:I

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/io/source/ByteBuffer;->toByteArray(II)[B

    move-result-object v0

    return-object v0
.end method

.method public toByteArray(II)[B
    .locals 3
    .param p1, "off"    # I
    .param p2, "len"    # I

    .line 128
    new-array v0, p2, [B

    .line 129
    .local v0, "newBuf":[B
    iget-object v1, p0, Lcom/itextpdf/io/source/ByteBuffer;->buffer:[B

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    return-object v0
.end method
