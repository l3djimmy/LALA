.class Lcom/itextpdf/io/font/Type1Parser;
.super Ljava/lang/Object;
.source "Type1Parser.java"


# static fields
.field private static final AFM_HEADER:Ljava/lang/String; = "StartFontMetrics"


# instance fields
.field private afmData:[B

.field private afmPath:Ljava/lang/String;

.field private isBuiltInFont:Z

.field private pfbData:[B

.field private pfbPath:Ljava/lang/String;

.field private sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[B[B)V
    .locals 1
    .param p1, "metricsPath"    # Ljava/lang/String;
    .param p2, "binaryPath"    # Ljava/lang/String;
    .param p3, "afm"    # [B
    .param p4, "pfb"    # [B

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-direct {v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;-><init>()V

    iput-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    .line 57
    iput-object p3, p0, Lcom/itextpdf/io/font/Type1Parser;->afmData:[B

    .line 58
    iput-object p4, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbData:[B

    .line 59
    iput-object p1, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    .line 61
    return-void
.end method

.method private isAfmFile(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)Z
    .locals 6
    .param p1, "raf"    # Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "StartFontMetrics"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 142
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const-wide/16 v4, 0x0

    if-ge v2, v3, :cond_0

    .line 144
    :try_start_0
    invoke-virtual {p1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->readByte()B

    move-result v3

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    nop

    .line 142
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 145
    :catch_0
    move-exception v1

    .line 146
    .local v1, "e":Ljava/io/EOFException;
    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 147
    const/4 v3, 0x0

    return v3

    .line 150
    .end local v1    # "e":Ljava/io/EOFException;
    .end local v2    # "i":I
    :cond_0
    invoke-virtual {p1, v4, v5}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->seek(J)V

    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public getAfmPath()Ljava/lang/String;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    return-object v0
.end method

.method public getMetricsFile()Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itextpdf/io/font/Type1Parser;->isBuiltInFont:Z

    .line 65
    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-static {v1}, Lcom/itextpdf/io/font/constants/StandardFonts;->isStandardFont(Ljava/lang/String;)Z

    move-result v1

    const-string v2, ".afm"

    if-eqz v1, :cond_4

    .line 66
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/itextpdf/io/font/Type1Parser;->isBuiltInFont:Z

    .line 67
    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 68
    .local v1, "buf":[B
    const/4 v3, 0x0

    .line 70
    .local v3, "resource":Ljava/io/InputStream;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com/itextpdf/io/font/afm/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "resourcePath":Ljava/lang/String;
    invoke-static {v2}, Lcom/itextpdf/io/util/ResourceUtil;->getResourceStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    move-object v3, v4

    .line 72
    if-eqz v3, :cond_2

    .line 75
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 77
    .local v4, "stream":Ljava/io/ByteArrayOutputStream;
    :goto_0
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "read":I
    if-ltz v5, :cond_0

    .line 78
    invoke-virtual {v4, v1, v0, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 80
    :cond_0
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    .end local v1    # "buf":[B
    .end local v2    # "resourcePath":Ljava/lang/String;
    .end local v4    # "stream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "read":I
    .local v0, "buf":[B
    if-eqz v3, :cond_1

    .line 84
    :try_start_1
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 85
    :goto_1
    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    .line 88
    :cond_1
    :goto_2
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-virtual {v2, v0}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v1

    .line 73
    .end local v0    # "buf":[B
    .restart local v1    # "buf":[B
    .restart local v2    # "resourcePath":Ljava/lang/String;
    :cond_2
    :try_start_2
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v4, "{0} was not found as resource."

    invoke-direct {v0, v4}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    .end local v1    # "buf":[B
    .end local v3    # "resource":Ljava/io/InputStream;
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 82
    .end local v2    # "resourcePath":Ljava/lang/String;
    .restart local v1    # "buf":[B
    .restart local v3    # "resource":Ljava/io/InputStream;
    :catchall_0
    move-exception v0

    if-eqz v3, :cond_3

    .line 84
    :try_start_3
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 85
    :goto_3
    goto :goto_4

    :catch_1
    move-exception v2

    goto :goto_3

    .line 87
    :cond_3
    :goto_4
    throw v0

    .line 89
    .end local v1    # "buf":[B
    .end local v3    # "resource":Ljava/io/InputStream;
    :cond_4
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 90
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 91
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0

    .line 92
    :cond_5
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pfm"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 93
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 94
    .local v0, "ba":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 95
    .local v1, "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    invoke-static {v1, v0}, Lcom/itextpdf/io/font/Pfm2afm;->convert(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V

    .line 96
    invoke-virtual {v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 97
    new-instance v2, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v2

    .line 99
    .end local v0    # "ba":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    :cond_6
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    const-string/jumbo v1, "{0} is not an afm or pfm font file."

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;->setMessageParams([Ljava/lang/Object;)Lcom/itextpdf/io/exceptions/IOException;

    move-result-object v0

    throw v0

    .line 101
    :cond_7
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->afmData:[B

    const-string v1, "Invalid afm or pfm font file."

    if-eqz v0, :cond_9

    .line 102
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Parser;->afmData:[B

    invoke-virtual {v2, v3}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    .line 103
    .local v0, "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    invoke-direct {p0, v0}, Lcom/itextpdf/io/font/Type1Parser;->isAfmFile(Lcom/itextpdf/io/source/RandomAccessFileOrArray;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 104
    return-object v0

    .line 106
    :cond_8
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 108
    .local v2, "ba":Ljava/io/ByteArrayOutputStream;
    :try_start_4
    invoke-static {v0, v2}, Lcom/itextpdf/io/font/Pfm2afm;->convert(Lcom/itextpdf/io/source/RandomAccessFileOrArray;Ljava/io/OutputStream;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 112
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 113
    nop

    .line 114
    new-instance v1, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v3, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v1

    .line 112
    :catchall_1
    move-exception v1

    goto :goto_5

    .line 109
    :catch_2
    move-exception v3

    .line 110
    .local v3, "ignored":Ljava/lang/Exception;
    :try_start_5
    new-instance v4, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v4, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "ba":Ljava/io/ByteArrayOutputStream;
    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 112
    .end local v3    # "ignored":Ljava/lang/Exception;
    .restart local v0    # "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .restart local v2    # "ba":Ljava/io/ByteArrayOutputStream;
    :goto_5
    invoke-virtual {v0}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;->close()V

    .line 113
    throw v1

    .line 117
    .end local v0    # "rf":Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .end local v2    # "ba":Ljava/io/ByteArrayOutputStream;
    :cond_9
    new-instance v0, Lcom/itextpdf/io/exceptions/IOException;

    invoke-direct {v0, v1}, Lcom/itextpdf/io/exceptions/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPostscriptBinary()Lcom/itextpdf/io/source/RandomAccessFileOrArray;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbData:[B

    if-eqz v0, :cond_0

    .line 123
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbData:[B

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createSource([B)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".pfb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 125
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0

    .line 127
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->afmPath:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x3

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "pfb"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    .line 128
    new-instance v0, Lcom/itextpdf/io/source/RandomAccessFileOrArray;

    iget-object v1, p0, Lcom/itextpdf/io/font/Type1Parser;->sourceFactory:Lcom/itextpdf/io/source/RandomAccessSourceFactory;

    iget-object v2, p0, Lcom/itextpdf/io/font/Type1Parser;->pfbPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/itextpdf/io/source/RandomAccessSourceFactory;->createBestSource(Ljava/lang/String;)Lcom/itextpdf/io/source/IRandomAccessSource;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/io/source/RandomAccessFileOrArray;-><init>(Lcom/itextpdf/io/source/IRandomAccessSource;)V

    return-object v0
.end method

.method public isBuiltInFont()Z
    .locals 1

    .line 133
    iget-boolean v0, p0, Lcom/itextpdf/io/font/Type1Parser;->isBuiltInFont:Z

    return v0
.end method
