.class public Lcom/itextpdf/commons/utils/ZipFileReader;
.super Ljava/lang/Object;
.source "ZipFileReader.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private thresholdEntries:I

.field private thresholdRatio:D

.field private thresholdSize:I

.field private final zipFile:Ljava/util/zip/ZipFile;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    const-class v0, Lcom/itextpdf/commons/utils/ZipFileReader;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/itextpdf/commons/utils/ZipFileReader;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "archivePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const v0, 0x3b9aca00

    iput v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdSize:I

    .line 50
    const/16 v0, 0x2710

    iput v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdEntries:I

    .line 51
    const-wide/high16 v0, 0x4024000000000000L    # 10.0

    iput-wide v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdRatio:D

    .line 61
    if-eqz p1, :cond_0

    .line 64
    new-instance v0, Ljava/util/zip/ZipFile;

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    .line 65
    return-void

    .line 62
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File name can not be null."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

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

    .line 172
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->close()V

    .line 173
    return-void
.end method

.method public getFileNames()Ljava/util/Set;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 77
    .local v0, "fileNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v1}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v1

    .line 79
    .local v1, "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    const/4 v2, 0x0

    .line 80
    .local v2, "totalSizeArchive":I
    const/4 v3, 0x0

    .line 81
    .local v3, "totalEntryArchive":I
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 82
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/zip/ZipEntry;

    .line 83
    .local v4, "entry":Ljava/util/zip/ZipEntry;
    const/4 v5, 0x0

    .line 84
    .local v5, "zipBombSuspicious":Z
    new-instance v6, Ljava/io/BufferedInputStream;

    iget-object v7, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v7, v4}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 85
    .local v6, "in":Ljava/io/InputStream;
    add-int/lit8 v3, v3, 0x1

    .line 87
    const/16 v7, 0x800

    :try_start_0
    new-array v7, v7, [B

    .line 88
    .local v7, "buffer":[B
    const/4 v8, 0x0

    .line 89
    .local v8, "totalSizeEntry":I
    :goto_1
    invoke-virtual {v6, v7}, Ljava/io/InputStream;->read([B)I

    move-result v9

    move v10, v9

    .local v10, "nBytes":I
    if-lez v9, :cond_1

    .line 90
    add-int/2addr v8, v10

    .line 91
    add-int/2addr v2, v10

    .line 92
    int-to-double v11, v8

    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getCompressedSize()J

    move-result-wide v13

    long-to-double v13, v13

    div-double/2addr v11, v13

    .line 93
    .local v11, "compressionRatio":D
    iget-wide v13, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdRatio:D

    cmpl-double v9, v11, v13

    if-lez v9, :cond_0

    .line 94
    const/4 v5, 0x1

    .line 95
    goto :goto_2

    .line 97
    .end local v11    # "compressionRatio":D
    :cond_0
    goto :goto_1

    .line 98
    :cond_1
    :goto_2
    if-eqz v5, :cond_2

    .line 99
    sget-object v9, Lcom/itextpdf/commons/utils/ZipFileReader;->LOGGER:Lorg/slf4j/Logger;

    const-string v11, "Ratio between compressed and uncompressed data is highly suspicious, looks like a Zip Bomb Attack. Threshold ratio is {0}."

    iget-wide v12, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdRatio:D

    .line 100
    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    .line 99
    invoke-static {v11, v12}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v11}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    nop

    :goto_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    goto :goto_5

    .line 103
    :cond_2
    :try_start_1
    iget v9, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdSize:I

    if-le v2, v9, :cond_3

    .line 104
    sget-object v9, Lcom/itextpdf/commons/utils/ZipFileReader;->LOGGER:Lorg/slf4j/Logger;

    const-string v11, "The uncompressed data size is too much for the application resource capacity, looks like a Zip Bomb Attack. Threshold size is {0}."

    iget v12, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdSize:I

    .line 105
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    .line 104
    invoke-static {v11, v12}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v11}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 113
    goto :goto_3

    .line 108
    :cond_3
    iget v9, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdEntries:I

    if-le v3, v9, :cond_4

    .line 109
    sget-object v9, Lcom/itextpdf/commons/utils/ZipFileReader;->LOGGER:Lorg/slf4j/Logger;

    const-string v11, "Too much entries in this archive, can lead to inodes exhaustion of the system, looks like a Zip Bomb Attack. Threshold number of file entries is {0}."

    iget v12, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdEntries:I

    .line 110
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    .line 109
    invoke-static {v11, v12}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v11}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    goto :goto_3

    .end local v7    # "buffer":[B
    .end local v8    # "totalSizeEntry":I
    .end local v10    # "nBytes":I
    :cond_4
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 114
    .end local v6    # "in":Ljava/io/InputStream;
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_5

    .line 115
    invoke-virtual {v4}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 117
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v5    # "zipBombSuspicious":Z
    :cond_5
    goto/16 :goto_0

    .line 84
    .restart local v4    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v5    # "zipBombSuspicious":Z
    .restart local v6    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v7

    .end local v0    # "fileNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v2    # "totalSizeArchive":I
    .end local v3    # "totalEntryArchive":I
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v5    # "zipBombSuspicious":Z
    .end local v6    # "in":Ljava/io/InputStream;
    :try_start_2
    throw v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 113
    .restart local v0    # "fileNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v1    # "entries":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v2    # "totalSizeArchive":I
    .restart local v3    # "totalEntryArchive":I
    .restart local v4    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v5    # "zipBombSuspicious":Z
    .restart local v6    # "in":Ljava/io/InputStream;
    :catchall_1
    move-exception v8

    :try_start_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v9

    invoke-virtual {v7, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_4
    throw v8

    .line 118
    .end local v4    # "entry":Ljava/util/zip/ZipEntry;
    .end local v5    # "zipBombSuspicious":Z
    .end local v6    # "in":Ljava/io/InputStream;
    :cond_6
    :goto_5
    return-object v0
.end method

.method public readFromZip(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p1, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    if-eqz p1, :cond_1

    .line 134
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v0, p1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    .line 135
    .local v0, "entry":Ljava/util/zip/ZipEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->zipFile:Ljava/util/zip/ZipFile;

    invoke-virtual {v1, v0}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v1

    return-object v1

    .line 136
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Zip entry not found for name: {0}"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 132
    .end local v0    # "entry":Ljava/util/zip/ZipEntry;
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File name can not be null."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setThresholdEntries(I)V
    .locals 0
    .param p1, "thresholdEntries"    # I

    .line 157
    iput p1, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdEntries:I

    .line 158
    return-void
.end method

.method public setThresholdRatio(D)V
    .locals 0
    .param p1, "thresholdRatio"    # D

    .line 167
    iput-wide p1, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdRatio:D

    .line 168
    return-void
.end method

.method public setThresholdSize(I)V
    .locals 0
    .param p1, "thresholdSize"    # I

    .line 148
    iput p1, p0, Lcom/itextpdf/commons/utils/ZipFileReader;->thresholdSize:I

    .line 149
    return-void
.end method
