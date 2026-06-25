.class public final Lcom/itextpdf/io/source/RandomAccessSourceFactory;
.super Ljava/lang/Object;
.source "RandomAccessSourceFactory.java"


# static fields
.field private static forceReadDefaultValue:Z


# instance fields
.field private exclusivelyLockFile:Z

.field private forceRead:Z

.field private usePlainRandomAccess:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const/4 v0, 0x0

    sput-boolean v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceReadDefaultValue:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    sget-boolean v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceReadDefaultValue:Z

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceRead:Z

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->usePlainRandomAccess:Z

    .line 60
    iput-boolean v0, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->exclusivelyLockFile:Z

    .line 66
    return-void
.end method

.method private createByReadingToMemory(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 2
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    :try_start_0
    new-instance v0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;

    invoke-static {p1}, Lcom/itextpdf/io/util/StreamUtil;->inputStreamToArray(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/ArrayRandomAccessSource;-><init>([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 294
    :goto_0
    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    .line 289
    :goto_1
    return-object v0

    .line 292
    :catchall_0
    move-exception v0

    .line 293
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 294
    :goto_2
    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    .line 295
    :goto_3
    throw v0
.end method

.method private createByReadingToMemory(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 4
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    invoke-static {p1}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 275
    .local v0, "stream":Ljava/io/InputStream;
    if-eqz v0, :cond_0

    .line 278
    invoke-direct {p0, v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createByReadingToMemory(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    return-object v1

    .line 276
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "{0} not found as file or resource."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static exceptionIsMapFailureException(Ljava/io/IOException;)Z
    .locals 2
    .param p0, "e"    # Ljava/io/IOException;

    .line 307
    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Map failed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 308
    const/4 v0, 0x1

    return v0

    .line 309
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static setForceReadDefaultValue(Z)V
    .locals 0
    .param p0, "forceRead"    # Z

    .line 73
    sput-boolean p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceReadDefaultValue:Z

    .line 74
    return-void
.end method


# virtual methods
.method public createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 7
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 184
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_2

    .line 185
    const-string v1, "file:/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 186
    const-string v1, "http://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 187
    const-string v1, "https://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 188
    const-string v1, "jar:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 189
    const-string/jumbo v1, "wsjar:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 190
    const-string/jumbo v1, "vfszip:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 193
    :cond_0
    invoke-direct {p0, p1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createByReadingToMemory(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    return-object v1

    .line 191
    :cond_1
    :goto_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource(Ljava/net/URL;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    return-object v1

    .line 197
    :cond_2
    iget-boolean v1, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceRead:Z

    if-eqz v1, :cond_3

    .line 198
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createByReadingToMemory(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    return-object v1

    .line 201
    :cond_3
    iget-boolean v1, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->exclusivelyLockFile:Z

    if-eqz v1, :cond_4

    const-string/jumbo v1, "rw"

    goto :goto_1

    :cond_4
    const-string/jumbo v1, "r"

    .line 203
    .local v1, "openMode":Ljava/lang/String;
    :goto_1
    new-instance v2, Ljava/io/RandomAccessFile;

    invoke-direct {v2, v0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    .local v2, "raf":Ljava/io/RandomAccessFile;
    iget-boolean v3, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->exclusivelyLockFile:Z

    if-eqz v3, :cond_5

    .line 205
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 208
    :cond_5
    iget-boolean v3, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->usePlainRandomAccess:Z

    if-eqz v3, :cond_6

    .line 209
    new-instance v3, Lcom/itextpdf/io/source/RAFRandomAccessSource;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/source/RAFRandomAccessSource;-><init>(Ljava/io/RandomAccessFile;)V

    return-object v3

    .line 216
    :cond_6
    :try_start_0
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-gtz v3, :cond_7

    .line 217
    new-instance v3, Lcom/itextpdf/io/source/RAFRandomAccessSource;

    invoke-direct {v3, v2}, Lcom/itextpdf/io/source/RAFRandomAccessSource;-><init>(Ljava/io/RandomAccessFile;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    return-object v3

    .line 222
    :cond_7
    :try_start_1
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/nio/channels/FileChannel;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v3
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v3

    .line 223
    :catch_0
    move-exception v3

    .line 224
    .local v3, "e":Ljava/io/IOException;
    :try_start_2
    invoke-static {v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->exceptionIsMapFailureException(Ljava/io/IOException;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 225
    new-instance v4, Lcom/itextpdf/io/source/RAFRandomAccessSource;

    invoke-direct {v4, v2}, Lcom/itextpdf/io/source/RAFRandomAccessSource;-><init>(Ljava/io/RandomAccessFile;)V

    return-object v4

    .line 227
    :cond_8
    nop

    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "openMode":Ljava/lang/String;
    .end local v2    # "raf":Ljava/io/RandomAccessFile;
    .end local p1    # "filename":Ljava/lang/String;
    throw v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 229
    .end local v3    # "e":Ljava/io/IOException;
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "openMode":Ljava/lang/String;
    .restart local v2    # "raf":Ljava/io/RandomAccessFile;
    .restart local p1    # "filename":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 233
    .local v3, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 234
    :goto_2
    goto :goto_3

    :catch_2
    move-exception v4

    goto :goto_2

    .line 235
    :goto_3
    throw v3
.end method

.method public createBestSource(Ljava/nio/channels/FileChannel;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 4
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    invoke-virtual {p1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0

    const-wide/32 v2, 0x4000000

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 253
    new-instance v0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;

    new-instance v1, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/source/FileChannelRandomAccessSource;-><init>(Ljava/nio/channels/FileChannel;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0

    .line 255
    :cond_0
    new-instance v0, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;

    new-instance v1, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;

    invoke-direct {v1, p1}, Lcom/itextpdf/io/source/PagedChannelRandomAccessSource;-><init>(Ljava/nio/channels/FileChannel;)V

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/GetBufferedRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0
.end method

.method public createRanged(Lcom/itextpdf/io/source/IRandomAccessSource;[J)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 9
    .param p1, "source"    # Lcom/itextpdf/io/source/IRandomAccessSource;
    .param p2, "ranges"    # [J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 260
    array-length v0, p2

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Lcom/itextpdf/io/source/IRandomAccessSource;

    .line 261
    .local v0, "sources":[Lcom/itextpdf/io/source/IRandomAccessSource;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_0

    .line 262
    div-int/lit8 v2, v1, 0x2

    new-instance v3, Lcom/itextpdf/io/source/WindowRandomAccessSource;

    aget-wide v5, p2, v1

    add-int/lit8 v4, v1, 0x1

    aget-wide v7, p2, v4

    move-object v4, p1

    .end local p1    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    .local v4, "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    invoke-direct/range {v3 .. v8}, Lcom/itextpdf/io/source/WindowRandomAccessSource;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;JJ)V

    aput-object v3, v0, v2

    .line 261
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .end local v4    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    .restart local p1    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    :cond_0
    move-object v4, p1

    .line 264
    .end local v1    # "i":I
    .end local p1    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    .restart local v4    # "source":Lcom/itextpdf/io/source/IRandomAccessSource;
    new-instance p1, Lcom/itextpdf/io/source/GroupedRandomAccessSource;

    invoke-direct {p1, v0}, Lcom/itextpdf/io/source/GroupedRandomAccessSource;-><init>([Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object p1
.end method

.method public createSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 168
    invoke-static {p1}, Lcom/itextpdf/io/util/StreamUtil;->inputStreamToArray(Ljava/io/InputStream;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    return-object v0
.end method

.method public createSource(Ljava/io/RandomAccessFile;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 1
    .param p1, "raf"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 111
    new-instance v0, Lcom/itextpdf/io/source/RAFRandomAccessSource;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/source/RAFRandomAccessSource;-><init>(Ljava/io/RandomAccessFile;)V

    return-object v0
.end method

.method public createSource(Ljava/net/URL;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 124
    .local v0, "stream":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 129
    :goto_0
    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_0

    .line 124
    :goto_1
    return-object v1

    .line 127
    :catchall_0
    move-exception v1

    .line 128
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 129
    :goto_2
    goto :goto_3

    :catch_1
    move-exception v2

    goto :goto_2

    .line 130
    :goto_3
    throw v1
.end method

.method public createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 1
    .param p1, "data"    # [B

    .line 107
    new-instance v0, Lcom/itextpdf/io/source/ArrayRandomAccessSource;

    invoke-direct {v0, p1}, Lcom/itextpdf/io/source/ArrayRandomAccessSource;-><init>([B)V

    return-object v0
.end method

.method public extractOrCreateSource(Ljava/io/InputStream;)Lcom/itextpdf/io/source/IRandomAccessSource;
    .locals 1
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 148
    instance-of v0, p1, Lcom/itextpdf/io/source/RASInputStream;

    if-eqz v0, :cond_0

    .line 149
    move-object v0, p1

    check-cast v0, Lcom/itextpdf/io/source/RASInputStream;

    invoke-virtual {v0}, Lcom/itextpdf/io/source/RASInputStream;->getSource()Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    return-object v0

    .line 151
    :cond_0
    invoke-static {p1}, Lcom/itextpdf/io/util/StreamUtil;->inputStreamToArray(Ljava/io/InputStream;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v0

    return-object v0
.end method

.method public setExclusivelyLockFile(Z)Lcom/itextpdf/io/source/RandomAccessSourceFactory;
    .locals 0
    .param p1, "exclusivelyLockFile"    # Z

    .line 97
    iput-boolean p1, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->exclusivelyLockFile:Z

    .line 98
    return-object p0
.end method

.method public setForceRead(Z)Lcom/itextpdf/io/source/RandomAccessSourceFactory;
    .locals 0
    .param p1, "forceRead"    # Z

    .line 82
    iput-boolean p1, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->forceRead:Z

    .line 83
    return-object p0
.end method

.method public setUsePlainRandomAccess(Z)Lcom/itextpdf/io/source/RandomAccessSourceFactory;
    .locals 0
    .param p1, "usePlainRandomAccess"    # Z

    .line 92
    iput-boolean p1, p0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->usePlainRandomAccess:Z

    .line 93
    return-object p0
.end method
