.class Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;
.super Ljava/lang/Object;
.source "MappedChannelRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final channel:Ljava/nio/channels/FileChannel;

.field private final length:J

.field private final offset:J

.field private source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;JJ)V
    .locals 3
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .param p2, "offset"    # J
    .param p4, "length"    # J

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_1

    .line 61
    cmp-long v0, p4, v0

    if-lez v0, :cond_0

    .line 64
    iput-object p1, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    .line 65
    iput-wide p2, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->offset:J

    .line 66
    iput-wide p4, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->length:J

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    .line 68
    return-void

    .line 62
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is zero or negative"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is negative"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    if-nez v0, :cond_0

    .line 116
    return-void

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->close()V

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    .line 119
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

    .line 90
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    if-eqz v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->get(J)I

    move-result v0

    return v0

    .line 91
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "RandomAccessSource not opened"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(J[BII)I
    .locals 7
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    if-eqz v0, :cond_0

    .line 101
    iget-object v1, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    move-wide v2, p1

    move-object v4, p3

    move v5, p4

    move v6, p5

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .local v2, "position":J
    .local v4, "bytes":[B
    .local v5, "off":I
    .local v6, "len":I
    invoke-virtual/range {v1 .. v6}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;->get(J[BII)I

    move-result p1

    return p1

    .line 100
    .end local v2    # "position":J
    .end local v4    # "bytes":[B
    .end local v5    # "off":I
    .end local v6    # "len":I
    .restart local p1    # "position":J
    .restart local p3    # "bytes":[B
    .restart local p4    # "off":I
    .restart local p5    # "len":I
    :cond_0
    move-wide v2, p1

    .end local p1    # "position":J
    .restart local v2    # "position":J
    new-instance p1, Ljava/io/IOException;

    const-string p2, "RandomAccessSource not opened"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public length()J
    .locals 2

    .line 108
    iget-wide v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->length:J

    return-wide v0
.end method

.method open()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    if-eqz v0, :cond_0

    .line 76
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    new-instance v0, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    iget-object v1, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    sget-object v2, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    iget-wide v3, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->offset:J

    iget-wide v5, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->length:J

    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v0, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/ByteBufferRandomAccessSource;

    .line 82
    return-void

    .line 79
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Channel is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->offset:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->length:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
