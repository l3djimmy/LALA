.class Lcom/itextpdf/io/codec/BitFile;
.super Ljava/lang/Object;
.source "BitFile.java"


# instance fields
.field bitsLeft:I

.field blocks:Z

.field buffer:[B

.field index:I

.field output:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Z)V
    .locals 2
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "blocks"    # Z

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/codec/BitFile;->blocks:Z

    .line 54
    iput-object p1, p0, Lcom/itextpdf/io/codec/BitFile;->output:Ljava/io/OutputStream;

    .line 55
    iput-boolean p2, p0, Lcom/itextpdf/io/codec/BitFile;->blocks:Z

    .line 56
    const/16 v1, 0x100

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    .line 57
    iput v0, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    .line 58
    const/16 v0, 0x8

    iput v0, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 59
    return-void
.end method


# virtual methods
.method public flush()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    iget v0, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    iget v1, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-ne v1, v3, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    add-int/2addr v0, v1

    .line 63
    .local v0, "numBytes":I
    if-lez v0, :cond_2

    .line 64
    iget-boolean v1, p0, Lcom/itextpdf/io/codec/BitFile;->blocks:Z

    if-eqz v1, :cond_1

    .line 65
    iget-object v1, p0, Lcom/itextpdf/io/codec/BitFile;->output:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 66
    :cond_1
    iget-object v1, p0, Lcom/itextpdf/io/codec/BitFile;->output:Ljava/io/OutputStream;

    iget-object v4, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    invoke-virtual {v1, v4, v2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 67
    iget-object v1, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    aput-byte v2, v1, v2

    .line 68
    iput v2, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    .line 69
    iput v3, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 71
    :cond_2
    return-void
.end method

.method public writeBits(II)V
    .locals 10
    .param p1, "bits"    # I
    .param p2, "numbits"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    const/4 v0, 0x0

    .line 76
    .local v0, "bitsWritten":I
    const/16 v1, 0xff

    .line 79
    .local v1, "numBytes":I
    :cond_0
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    const/16 v3, 0xfe

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-ne v2, v3, :cond_1

    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    if-eqz v2, :cond_2

    :cond_1
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    if-le v2, v3, :cond_4

    .line 80
    :cond_2
    iget-boolean v2, p0, Lcom/itextpdf/io/codec/BitFile;->blocks:Z

    if-eqz v2, :cond_3

    .line 81
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->output:Ljava/io/OutputStream;

    invoke-virtual {v2, v1}, Ljava/io/OutputStream;->write(I)V

    .line 83
    :cond_3
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->output:Ljava/io/OutputStream;

    iget-object v3, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    invoke-virtual {v2, v3, v5, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 85
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    aput-byte v5, v2, v5

    .line 86
    iput v5, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    .line 87
    iput v4, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 91
    :cond_4
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 111
    iget-boolean v3, p0, Lcom/itextpdf/io/codec/BitFile;->blocks:Z

    .line 91
    const/4 v6, 0x1

    if-gt p2, v2, :cond_6

    .line 94
    nop

    .line 101
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    .line 94
    if-eqz v3, :cond_5

    .line 96
    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aget-byte v5, v2, v3

    shl-int v7, v6, p2

    sub-int/2addr v7, v6

    and-int v6, p1, v7

    iget v7, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr v4, v7

    shl-int v4, v6, v4

    int-to-byte v4, v4

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 97
    add-int/2addr v0, p2

    .line 98
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr v2, p2

    iput v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 99
    const/4 p2, 0x0

    goto :goto_0

    .line 101
    :cond_5
    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aget-byte v4, v2, v3

    shl-int v5, v6, p2

    sub-int/2addr v5, v6

    and-int/2addr v5, p1

    iget v6, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr v6, p2

    shl-int/2addr v5, v6

    int-to-byte v5, v5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 102
    add-int/2addr v0, p2

    .line 103
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr v2, p2

    iput v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 104
    const/4 p2, 0x0

    goto :goto_0

    .line 111
    :cond_6
    if-eqz v3, :cond_7

    .line 115
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aget-byte v7, v2, v3

    iget v8, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    shl-int v8, v6, v8

    sub-int/2addr v8, v6

    and-int/2addr v8, p1

    iget v9, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    rsub-int/lit8 v9, v9, 0x8

    shl-int/2addr v8, v9

    int-to-byte v8, v8

    or-int/2addr v7, v8

    int-to-byte v7, v7

    aput-byte v7, v2, v3

    .line 116
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    add-int/2addr v0, v2

    .line 117
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    shr-int/2addr p1, v2

    .line 118
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr p2, v2

    .line 119
    iget-object v2, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    add-int/2addr v3, v6

    iput v3, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aput-byte v5, v2, v3

    .line 120
    iput v4, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    goto :goto_0

    .line 125
    :cond_7
    iget v2, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int v2, p2, v2

    ushr-int v2, p1, v2

    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    shl-int v3, v6, v3

    sub-int/2addr v3, v6

    and-int/2addr v2, v3

    .line 126
    .local v2, "topbits":I
    iget-object v3, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    iget v7, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aget-byte v8, v3, v7

    int-to-byte v9, v2

    or-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v3, v7

    .line 128
    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    sub-int/2addr p2, v3

    .line 129
    iget v3, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    add-int/2addr v0, v3

    .line 131
    iget-object v3, p0, Lcom/itextpdf/io/codec/BitFile;->buffer:[B

    iget v7, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    add-int/2addr v7, v6

    iput v7, p0, Lcom/itextpdf/io/codec/BitFile;->index:I

    aput-byte v5, v3, v7

    .line 132
    iput v4, p0, Lcom/itextpdf/io/codec/BitFile;->bitsLeft:I

    .line 136
    .end local v2    # "topbits":I
    :goto_0
    if-nez p2, :cond_0

    .line 137
    return-void
.end method
