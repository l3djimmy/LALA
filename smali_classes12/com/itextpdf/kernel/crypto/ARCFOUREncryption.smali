.class public Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;
.super Ljava/lang/Object;
.source "ARCFOUREncryption.java"


# instance fields
.field private state:[B

.field private x:I

.field private y:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    .line 37
    return-void
.end method


# virtual methods
.method public encryptARCFOUR([B)V
    .locals 6
    .param p1, "data"    # [B

    .line 83
    array-length v3, p1

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v4, p1

    move-object v0, p0

    move-object v1, p1

    .end local p1    # "data":[B
    .local v1, "data":[B
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII[BI)V

    .line 84
    return-void
.end method

.method public encryptARCFOUR([BII)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 75
    move-object v4, p1

    move v5, p2

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .end local p1    # "data":[B
    .end local p2    # "off":I
    .end local p3    # "len":I
    .local v1, "data":[B
    .local v2, "off":I
    .local v3, "len":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII[BI)V

    .line 76
    return-void
.end method

.method public encryptARCFOUR([BII[BI)V
    .locals 9
    .param p1, "dataIn"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .param p4, "dataOut"    # [B
    .param p5, "offOut"    # I

    .line 62
    add-int v0, p3, p2

    .line 64
    .local v0, "length":I
    move v1, p2

    .local v1, "k":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 65
    iget v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    add-int/lit8 v2, v2, 0x1

    and-int/lit16 v2, v2, 0xff

    iput v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    .line 66
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    aget-byte v2, v2, v3

    iget v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    add-int/2addr v2, v3

    and-int/lit16 v2, v2, 0xff

    iput v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    .line 67
    iget-object v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    aget-byte v2, v2, v3

    .line 68
    .local v2, "tmp":B
    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v4, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v6, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    aget-byte v5, v5, v6

    aput-byte v5, v3, v4

    .line 69
    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v4, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    aput-byte v2, v3, v4

    .line 70
    sub-int v3, v1, p2

    add-int/2addr v3, p5

    aget-byte v4, p1, v1

    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget-object v6, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v7, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    aget-byte v6, v6, v7

    iget-object v7, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget v8, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    aget-byte v7, v7, v8

    add-int/2addr v6, v7

    and-int/lit16 v6, v6, 0xff

    aget-byte v5, v5, v6

    xor-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, p4, v3

    .line 64
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 72
    .end local v1    # "k":I
    .end local v2    # "tmp":B
    :cond_0
    return-void
.end method

.method public encryptARCFOUR([B[B)V
    .locals 6
    .param p1, "dataIn"    # [B
    .param p2, "dataOut"    # [B

    .line 79
    array-length v3, p1

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    .end local p1    # "dataIn":[B
    .end local p2    # "dataOut":[B
    .local v1, "dataIn":[B
    .local v4, "dataOut":[B
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII[BI)V

    .line 80
    return-void
.end method

.method public prepareARCFOURKey([B)V
    .locals 2
    .param p1, "key"    # [B

    .line 40
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([BII)V

    .line 41
    return-void
.end method

.method public prepareARCFOURKey([BII)V
    .locals 7
    .param p1, "key"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .line 44
    const/4 v0, 0x0

    .line 45
    .local v0, "index1":I
    const/4 v1, 0x0

    .line 46
    .local v1, "index2":I
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_0
    const/16 v3, 0x100

    if-ge v2, v3, :cond_0

    .line 47
    iget-object v3, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    int-to-byte v4, v2

    aput-byte v4, v3, v2

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    .end local v2    # "k":I
    :cond_0
    const/4 v2, 0x0

    iput v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->x:I

    .line 50
    iput v2, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->y:I

    .line 52
    const/4 v2, 0x0

    .restart local v2    # "k":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 53
    add-int v4, v0, p2

    aget-byte v4, p1, v4

    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    aget-byte v5, v5, v2

    add-int/2addr v4, v5

    add-int/2addr v4, v1

    and-int/lit16 v1, v4, 0xff

    .line 54
    iget-object v4, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    aget-byte v4, v4, v2

    .line 55
    .local v4, "tmp":B
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    iget-object v6, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    aget-byte v6, v6, v1

    aput-byte v6, v5, v2

    .line 56
    iget-object v5, p0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->state:[B

    aput-byte v4, v5, v1

    .line 57
    add-int/lit8 v5, v0, 0x1

    rem-int v0, v5, p3

    .line 52
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 59
    .end local v2    # "k":I
    .end local v4    # "tmp":B
    :cond_1
    return-void
.end method
