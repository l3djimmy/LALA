.class public Lcom/itextpdf/layout/hyphenation/CharVector;
.super Ljava/lang/Object;
.source "CharVector.java"


# static fields
.field private static final DEFAULT_BLOCK_SIZE:I = 0x800


# instance fields
.field private array:[C

.field private blockSize:I

.field private n:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 50
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lcom/itextpdf/layout/hyphenation/CharVector;-><init>(I)V

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
    iput p1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    goto :goto_0

    .line 61
    :cond_0
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    .line 63
    :goto_0
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 65
    return-void
.end method

.method public constructor <init>(Lcom/itextpdf/layout/hyphenation/CharVector;)V
    .locals 1
    .param p1, "cv"    # Lcom/itextpdf/layout/hyphenation/CharVector;

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iget-object v0, p1, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    invoke-virtual {v0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 98
    iget v0, p1, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    .line 99
    iget v0, p1, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 100
    return-void
.end method

.method public constructor <init>([C)V
    .locals 1
    .param p1, "a"    # [C

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    .line 73
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 74
    array-length v0, p1

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 75
    return-void
.end method

.method public constructor <init>([CI)V
    .locals 1
    .param p1, "a"    # [C
    .param p2, "capacity"    # I

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    if-lez p2, :cond_0

    .line 84
    iput p2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    goto :goto_0

    .line 86
    :cond_0
    const/16 v0, 0x800

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    .line 88
    :goto_0
    iput-object p1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 89
    array-length v0, p1

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 90
    return-void
.end method


# virtual methods
.method public alloc(I)I
    .locals 5
    .param p1, "size"    # I

    .line 157
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 158
    .local v0, "index":I
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    array-length v1, v1

    .line 159
    .local v1, "len":I
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    add-int/2addr v2, p1

    if-lt v2, v1, :cond_0

    .line 160
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->blockSize:I

    add-int/2addr v2, v1

    new-array v2, v2, [C

    .line 161
    .local v2, "aux":[C
    iget-object v3, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    const/4 v4, 0x0

    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 162
    iput-object v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 164
    .end local v2    # "aux":[C
    :cond_0
    iget v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 165
    return v0
.end method

.method public capacity()I
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    array-length v0, v0

    return v0
.end method

.method public clear()V
    .locals 1

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    .line 107
    return-void
.end method

.method public get(I)C
    .locals 1
    .param p1, "index"    # I

    .line 148
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    aget-char v0, v0, p1

    return v0
.end method

.method public getArray()[C
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    return-object v0
.end method

.method public length()I
    .locals 1

    .line 122
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    return v0
.end method

.method public put(IC)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "val"    # C

    .line 139
    iget-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    aput-char p2, v0, p1

    .line 140
    return-void
.end method

.method public trimToSize()V
    .locals 4

    .line 172
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 173
    iget v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    new-array v0, v0, [C

    .line 174
    .local v0, "aux":[C
    iget-object v1, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    iget v2, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->n:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    iput-object v0, p0, Lcom/itextpdf/layout/hyphenation/CharVector;->array:[C

    .line 177
    .end local v0    # "aux":[C
    :cond_0
    return-void
.end method
