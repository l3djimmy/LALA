.class Lcom/itextpdf/io/source/RAFRandomAccessSource;
.super Ljava/lang/Object;
.source "RAFRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final length:J

.field private final raf:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 2
    .param p1, "raf"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    .line 50
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->length:J

    .line 51
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

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 97
    return-void
.end method

.method public get(J)I
    .locals 2
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    iget-wide v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->length:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 58
    const/4 v0, -0x1

    return v0

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_1

    .line 62
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 65
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    return v0
.end method

.method public get(J[BII)I
    .locals 2
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    iget-wide v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->length:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 73
    const/4 v0, -0x1

    return v0

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_1

    .line 77
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 80
    :cond_1
    iget-object v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p3, p4, p5}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    return v0
.end method

.method public length()J
    .locals 2

    .line 89
    iget-wide v0, p0, Lcom/itextpdf/io/source/RAFRandomAccessSource;->length:J

    return-wide v0
.end method
