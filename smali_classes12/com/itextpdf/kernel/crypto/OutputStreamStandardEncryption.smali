.class public Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;
.super Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
.source "OutputStreamStandardEncryption.java"


# instance fields
.field protected arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;[B)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "key"    # [B

    .line 45
    const/4 v0, 0x0

    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;-><init>(Ljava/io/OutputStream;[BII)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;[BII)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "key"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .line 39
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;-><init>(Ljava/io/OutputStream;)V

    .line 40
    new-instance v0, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-direct {v0}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    .line 41
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    invoke-virtual {v0, p2, p3, p4}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->prepareARCFOURKey([BII)V

    .line 42
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 0

    .line 87
    return-void
.end method

.method public write([BII)V
    .locals 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    const/16 v0, 0x1060

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    new-array v5, v0, [B

    move v3, p2

    .line 78
    .end local p2    # "off":I
    .local v3, "off":I
    .local v5, "b2":[B
    :goto_0
    if-lez p3, :cond_0

    .line 79
    array-length p2, v5

    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 80
    .local v4, "sz":I
    iget-object v1, p0, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;->arcfour:Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;

    const/4 v6, 0x0

    move-object v2, p1

    .end local p1    # "b":[B
    .local v2, "b":[B
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/kernel/crypto/ARCFOUREncryption;->encryptARCFOUR([BII[BI)V

    .line 81
    iget-object p1, p0, Lcom/itextpdf/kernel/crypto/OutputStreamStandardEncryption;->out:Ljava/io/OutputStream;

    const/4 p2, 0x0

    invoke-virtual {p1, v5, p2, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 82
    sub-int/2addr p3, v4

    .line 83
    add-int/2addr v3, v4

    .line 84
    .end local v4    # "sz":I
    move-object p1, v2

    goto :goto_0

    .line 85
    .end local v2    # "b":[B
    .restart local p1    # "b":[B
    :cond_0
    return-void
.end method
