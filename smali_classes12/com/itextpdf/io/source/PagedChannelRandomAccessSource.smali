.class Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;
.super Lcom/itextpdf/io/source/GroupedRandomAccessSource;
.source "PagedChannelRandomAccessSource.java"

# interfaces
.implements Lcom/itextpdf/io/source/IRandomAccessSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;
    }
.end annotation


# static fields
.field public static final DEFAULT_MAX_OPEN_BUFFERS:I = 0x10

.field public static final DEFAULT_TOTAL_BUFSIZE:I = 0x4000000


# instance fields
.field private final bufferSize:I

.field private final channel:Ljava/nio/channels/FileChannel;

.field private final mru:Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU<",
            "Lcom/itextpdf/io/source/IRandomAccessSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 2
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    const/high16 v0, 0x4000000

    const/16 v1, 0x10

    invoke-direct {p0, p1, v0, v1}, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;-><init>(Ljava/nio/channels/FileChannel;II)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;II)V
    .locals 1
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .param p2, "totalBufferSize"    # I
    .param p3, "maxOpenBuffers"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    div-int v0, p2, p3

    invoke-static {p1, v0}, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->buildSources(Ljava/nio/channels/FileChannel;I)[Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;-><init>([Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 79
    iput-object p1, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    .line 80
    div-int v0, p2, p3

    iput v0, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->bufferSize:I

    .line 81
    new-instance v0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;

    invoke-direct {v0, p3}, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;-><init>(I)V

    iput-object v0, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->mru:Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;

    .line 82
    return-void
.end method

.method private static buildSources(Ljava/nio/channels/FileChannel;I)[Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 16
    .param p0, "channel"    # Ljava/nio/channels/FileChannel;
    .param p1, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    move/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v1

    .line 93
    .local v1, "size":J
    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    .line 96
    int-to-long v5, v0

    div-long v5, v1, v5

    long-to-int v5, v5

    int-to-long v6, v0

    rem-long v6, v1, v6

    cmp-long v3, v6, v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    :goto_0
    add-int/2addr v5, v3

    .line 98
    .local v5, "bufferCount":I
    new-array v3, v5, [Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    .line 99
    .local v3, "sources":[Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v5, :cond_1

    .line 100
    int-to-long v6, v4

    int-to-long v8, v0

    mul-long v12, v6, v8

    .line 101
    .local v12, "pageOffset":J
    sub-long v6, v1, v12

    int-to-long v8, v0

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v14

    .line 102
    .local v14, "pageLength":J
    new-instance v10, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    move-object/from16 v11, p0

    invoke-direct/range {v10 .. v15}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;-><init>(Ljava/nio/channels/FileChannel;JJ)V

    aput-object v10, v3, v4

    .line 99
    .end local v12    # "pageOffset":J
    .end local v14    # "pageLength":J
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 104
    .end local v4    # "i":I
    :cond_1
    return-object v3

    .line 94
    .end local v3    # "sources":[Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;
    .end local v5    # "bufferCount":I
    :cond_2
    new-instance v3, Ljava/io/IOException;

    const-string v4, "File size must be greater than zero"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public close()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    const-string v0, "Closing of the file channel this source is based on failed."

    const-class v1, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;

    :try_start_0
    invoke-super {p0}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    :try_start_1
    iget-object v2, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 149
    goto :goto_0

    .line 146
    :catch_0
    move-exception v2

    .line 147
    .local v2, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 148
    .local v1, "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 150
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v2    # "ex":Ljava/lang/Exception;
    nop

    .line 151
    :goto_0
    return-void

    .line 144
    :catchall_0
    move-exception v2

    .line 145
    :try_start_2
    iget-object v3, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 149
    goto :goto_1

    .line 146
    :catch_1
    move-exception v3

    .line 147
    .local v3, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    .line 148
    .restart local v1    # "logger":Lorg/slf4j/Logger;
    invoke-interface {v1, v0, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 150
    .end local v1    # "logger":Lorg/slf4j/Logger;
    .end local v3    # "ex":Ljava/lang/Exception;
    :goto_1
    throw v2
.end method

.method protected getStartingSourceIndex(J)I
    .locals 2
    .param p1, "offset"    # J

    .line 112
    iget v0, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->bufferSize:I

    int-to-long v0, v0

    div-long v0, p1, v0

    long-to-int v0, v0

    return v0
.end method

.method protected sourceInUse(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 1
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/MappedChannelRandomAccessSource;->open()V

    .line 133
    return-void
.end method

.method protected sourceReleased(Lcom/itextpdf/io/source/IRandomAccessSource;)V
    .locals 1
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;->mru:Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;

    invoke-virtual {v0, p1}, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource$MRU;->enqueue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 122
    .local v0, "old":Lcom/itextpdf/io/source/IRandomAccessSource;
    if-eqz v0, :cond_0

    .line 123
    invoke-interface {v0}, Lcom/itextpdf/io/source/IRandomAccessSource;->close()V

    .line 124
    :cond_0
    return-void
.end method
