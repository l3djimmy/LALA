.class public abstract Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;
.super Ljava/io/OutputStream;
.source "OutputStreamEncryption.java"


# instance fields
.field protected out:Ljava/io/OutputStream;

.field private sb:[B


# direct methods
.method protected constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;

    .line 36
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 30
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->sb:[B

    .line 37
    iput-object p1, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->out:Ljava/io/OutputStream;

    .line 38
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->finish()V

    .line 52
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 53
    return-void
.end method

.method public abstract finish()V
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 69
    return-void
.end method

.method public write(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->sb:[B

    int-to-byte v1, p1

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 101
    iget-object v0, p0, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->sb:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->write([BII)V

    .line 102
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/itextpdf/kernel/crypto/OutputStreamEncryption;->write([BII)V

    .line 83
    return-void
.end method

.method public abstract write([BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
