.class public Lcom/itextpdf/io/source/FileChannelRandomAccessSource;
.super Ljava/lang/Object;
.source "FileChannelRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# instance fields
.field private final channel:Ljava/nio/channels/FileChannel;

.field private final source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 7
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    .line 54
    invoke-virtual {p1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 56
    new-instance v1, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    const-wide/16 v3, 0x0

    invoke-virtual {p1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v5

    move-object v2, p1

    .end local p1    # "channel":Ljava/nio/channels/FileChannel;
    .local v2, "channel":Ljava/nio/channels/FileChannel;
    invoke-direct/range {v1 .. v6}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;-><init>(Ljava/nio/channels/FileChannel;JJ)V

    iput-object v1, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    .line 57
    iget-object p1, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    invoke-virtual {p1}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->open()V

    .line 58
    return-void

    .line 55
    .end local v2    # "channel":Ljava/nio/channels/FileChannel;
    .restart local p1    # "channel":Ljava/nio/channels/FileChannel;
    :cond_0
    move-object v2, p1

    .end local p1    # "channel":Ljava/nio/channels/FileChannel;
    .restart local v2    # "channel":Ljava/nio/channels/FileChannel;
    new-instance p1, Ljava/io/IOException;

    const-string v0, "File size is 0 bytes"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    const-string v0, "Closing of the file channel this source is based on failed."

    const-class v1, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;

    :try_start_0
    iget-object v2, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    invoke-virtual {v2}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :try_start_1
    iget-object v2, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 74
    goto :goto_0

    .line 71
    :catch_0
    move-exception v2

    .line 72
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 73
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v2    # "ex":Ljava/lang/Exception;
    nop

    .line 76
    :goto_0
    return-void

    .line 69
    :catchall_0
    move-exception v2

    .line 70
    :try_start_2
    iget-object v3, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 74
    goto :goto_1

    .line 71
    :catch_1
    move-exception v3

    .line 72
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 73
    .restart local v1    # "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v3    # "ex":Ljava/lang/Exception;
    :goto_1
    throw v2
.end method

.method public get(J)I
    .locals 1
    .param p1, "position"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->get(J)I

    move-result v0

    return v0
.end method

.method public get(J[BII)I
    .locals 6
    .param p1, "position"    # J
    .param p3, "bytes"    # [B
    .param p4, "off"    # I
    .param p5, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    .end local p1    # "position":J
    .end local p3    # "bytes":[B
    .end local p4    # "off":I
    .end local p5    # "len":I
    .local v1, "position":J
    .local v3, "bytes":[B
    .local v4, "off":I
    .local v5, "len":I
    invoke-virtual/range {v0 .. v5}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->get(J[BII)I

    move-result p1

    return p1
.end method

.method public length()J
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;->source:Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->length()J

    move-result-wide v0

    return-wide v0
.end method
