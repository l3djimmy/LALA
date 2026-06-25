.class public final Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;
.super Ljava/io/OutputStream;
.source "CountOutputStream.java"


# instance fields
.field private bytesWritten:I

.field private final output:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "output"    # Ljava/io/OutputStream;

    .line 55
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    .line 56
    iput-object p1, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->output:Ljava/io/OutputStream;

    .line 57
    return-void
.end method


# virtual methods
.method public getBytesWritten()I
    .locals 1

    .line 94
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    return v0
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 86
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    .line 87
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 76
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    array-length v1, p1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    .line 77
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    iget-object v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->output:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 66
    iget v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/itextpdf/kernel/xmp/impl/CountOutputStream;->bytesWritten:I

    .line 67
    return-void
.end method
