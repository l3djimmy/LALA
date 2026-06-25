.class final Lcom/itextpdf/io/codec/brotli/dec/IntReader;
.super Ljava/lang/Object;
.source "IntReader.java"


# instance fields
.field private byteBuffer:[B

.field private intBuffer:[I


# direct methods
.method constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static convert(Lcom/itextpdf/io/codec/brotli/dec/IntReader;I)V
    .locals 5
    .param p0, "ir"    # Lcom/itextpdf/io/codec/brotli/dec/IntReader;
    .param p1, "intLen"    # I

    .line 29
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 30
    iget-object v1, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->intBuffer:[I

    iget-object v2, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->byteBuffer:[B

    mul-int/lit8 v3, v0, 0x4

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->byteBuffer:[B

    mul-int/lit8 v4, v0, 0x4

    add-int/lit8 v4, v4, 0x1

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->byteBuffer:[B

    mul-int/lit8 v4, v0, 0x4

    add-int/lit8 v4, v4, 0x2

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    iget-object v3, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->byteBuffer:[B

    mul-int/lit8 v4, v0, 0x4

    add-int/lit8 v4, v4, 0x3

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v2, v3

    aput v2, v1, v0

    .line 29
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 35
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method static init(Lcom/itextpdf/io/codec/brotli/dec/IntReader;[B[I)V
    .locals 0
    .param p0, "ir"    # Lcom/itextpdf/io/codec/brotli/dec/IntReader;
    .param p1, "byteBuffer"    # [B
    .param p2, "intBuffer"    # [I

    .line 18
    iput-object p1, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->byteBuffer:[B

    .line 19
    iput-object p2, p0, Lcom/itextpdf/io/codec/brotli/dec/IntReader;->intBuffer:[I

    .line 20
    return-void
.end method
