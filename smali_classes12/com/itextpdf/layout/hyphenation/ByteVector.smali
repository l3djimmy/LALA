.class public Lcom/itextpdf/layout/hyphenation/ByteVector;
.super Ljava/lang/Object;
.source "ByteVector.java"


# static fields
.field private static final DEFAULT_BLOCK_SIZE:I = 0x800


# instance fields
.field private array:[B

.field private blockSize:I

.field private n:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/hyphenation/ByteVector;-><init>(I)V

    .line 51
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    if-lez p1, :cond_0

    .line 59
    iput p1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    goto :goto_0

    .line 61
    :cond_0
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    .line 63
    :goto_0
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    .line 65
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "a"    # [B

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    .line 75
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    .line 77
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 1
    .param p1, "a"    # [B
    .param p2, "capacity"    # I

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    if-lez p2, :cond_0

    .line 88
    iput p2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    goto :goto_0

    .line 90
    :cond_0
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    .line 92
    :goto_0
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    .line 93
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    .line 94
    return-void
.end method


# virtual methods
.method public alloc(I)I
    .locals 5
    .param p1, "size"    # I

    .line 144
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    .line 145
    .local v0, "index":I
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    array-length v1, v1

    .line 146
    .local v1, "len":I
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    add-int/2addr v2, p1

    if-lt v2, v1, :cond_0

    .line 147
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->blockSize:I

    add-int/2addr v2, v1

    new-array v2, v2, [B

    .line 148
    .local v2, "aux":[B
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    iput-object v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    .line 151
    .end local v2    # "aux":[B
    :cond_0
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    .line 152
    return v0
.end method

.method public capacity()I
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    array-length v0, v0

    return v0
.end method

.method public get(I)B
    .locals 1
    .param p1, "index"    # I

    .line 135
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    aget-byte v0, v0, p1

    return v0
.end method

.method public getArray()[B
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    return-object v0
.end method

.method public length()I
    .locals 1

    .line 109
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    return v0
.end method

.method public put(IB)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "val"    # B

    .line 126
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    aput-byte p2, v0, p1

    .line 127
    return-void
.end method

.method public trimToSize()V
    .locals 4

    .line 159
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 160
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    new-array v0, v0, [B

    .line 161
    .local v0, "aux":[B
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    iget v2, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->n:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 162
    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/ByteVector;->array:[B

    .line 164
    .end local v0    # "aux":[B
    :cond_0
    return-void
.end method
