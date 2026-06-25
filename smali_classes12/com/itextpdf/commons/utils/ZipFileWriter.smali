.class public Lcom/itextpdf/commons/utils/ZipFileWriter;
.super Ljava/lang/Object;
.source "ZipFileWriter.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;
    }
.end annotation


# instance fields
.field private final outputStream:Ljava/util/zip/ZipOutputStream;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "archivePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    if-eqz p1, :cond_1

    .line 54
    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->isFileNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->directoryExists(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Ljava/util/zip/ZipOutputStream;

    invoke-static {p1}, Lcom/itextpdf/commons/utils/FileUtil;->getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    iput-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    .line 59
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipOutputStream;->setMethod(I)V

    .line 60
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/util/zip/ZipOutputStream;->setLevel(I)V

    .line 61
    return-void

    .line 55
    :cond_0
    new-instance v0, Ljava/io/IOException;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    .line 56
    const-string v2, "File name: {0}, already exists."

    invoke-static {v2, v1}, Lcom/itextpdf/commons/utils/MessageFormatUtil;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File name can not be null."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private addEntryToZip(Ljava/lang/String;Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "writer"    # Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    if-eqz p1, :cond_0

    .line 126
    new-instance v0, Ljava/util/zip/ZipEntry;

    invoke-direct {v0, p1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, "zipEntry":Ljava/util/zip/ZipEntry;
    iget-object v1, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    invoke-virtual {v1, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 128
    iget-object v1, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    invoke-interface {p2, v1}, Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;->write(Ljava/util/zip/ZipOutputStream;)V

    .line 129
    return-void

    .line 124
    .end local v0    # "zipEntry":Ljava/util/zip/ZipEntry;
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File name should be unique."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$addEntry$0(Ljava/io/InputStream;Ljava/util/zip/ZipOutputStream;)V
    .locals 3
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .param p1, "zos"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    const/16 v0, 0x400

    new-array v0, v0, [B

    .line 93
    .local v0, "bytes":[B
    :goto_0
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    move v2, v1

    .local v2, "length":I
    if-lez v1, :cond_0

    .line 94
    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_0

    .line 96
    :cond_0
    return-void
.end method

.method static synthetic lambda$addJsonEntry$1(Ljava/lang/Object;Ljava/util/zip/ZipOutputStream;)V
    .locals 0
    .param p0, "objectToAdd"    # Ljava/lang/Object;
    .param p1, "zos"    # Ljava/util/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 112
    invoke-static {p1, p0}, Lcom/itextpdf/commons/utils/JsonUtil;->serializeToStream(Ljava/io/OutputStream;Ljava/lang/Object;)V

    .line 113
    return-void
.end method


# virtual methods
.method public addEntry(Ljava/lang/String;Ljava/io/File;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    if-eqz p2, :cond_0

    .line 75
    invoke-virtual {p2}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/nio/file/OpenOption;

    invoke-static {v0, v1}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/commons/utils/ZipFileWriter;->addEntry(Ljava/lang/String;Ljava/io/InputStream;)V

    .line 76
    return-void

    .line 73
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "File should exist."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addEntry(Ljava/lang/String;Ljava/io/InputStream;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    if-eqz p2, :cond_0

    .line 90
    new-instance v0, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda1;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/commons/utils/ZipFileWriter;->addEntryToZip(Ljava/lang/String;Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;)V

    .line 97
    return-void

    .line 88
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Passed stream can not be null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addJsonEntry(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "objectToAdd"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 108
    if-eqz p2, :cond_0

    .line 111
    new-instance v0, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p2}, Lcom/itextpdf/commons/utils/ZipFileWriter$$ExternalSyntheticLambda0;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, p1, v0}, Lcom/itextpdf/commons/utils/ZipFileWriter;->addEntryToZip(Ljava/lang/String;Lcom/itextpdf/commons/utils/ZipFileWriter$ZipWriter;)V

    .line 114
    return-void

    .line 109
    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Passed json object can not be null"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    iget-object v0, p0, Lcom/itextpdf/commons/utils/ZipFileWriter;->outputStream:Ljava/util/zip/ZipOutputStream;

    invoke-virtual {v0}, Ljava/util/zip/ZipOutputStream;->close()V

    .line 120
    return-void
.end method
