.class public final Lcom/itextpdf/commons/utils/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method public static constructFileByDirectoryAndName(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "directory"    # Ljava/lang/String;
    .param p1, "fileName"    # Ljava/lang/String;

    .line 242
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static copy(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "inputFile"    # Ljava/lang/String;
    .param p1, "outputFile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 434
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/String;

    invoke-static {p0, v1}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/String;

    invoke-static {p1, v2}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/nio/file/CopyOption;

    sget-object v4, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v4, v3, v0

    invoke-static {v1, v2, v3}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 435
    return-void
.end method

.method public static createDirectories(Ljava/lang/String;)V
    .locals 1
    .param p0, "outPath"    # Ljava/lang/String;

    .line 334
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 335
    return-void
.end method

.method public static createPrintWriter(Ljava/io/OutputStream;Ljava/lang/String;)Ljava/io/PrintWriter;
    .locals 2
    .param p0, "output"    # Ljava/io/OutputStream;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 202
    new-instance v0, Ljava/io/PrintWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    return-object v0
.end method

.method public static createTempCopy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "tempFilePrefix"    # Ljava/lang/String;
    .param p2, "tempFilePostfix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 410
    const/4 v0, 0x0

    .line 412
    .local v0, "replacementFilePath":Ljava/nio/file/Path;
    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_0
    new-array v3, v2, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {p1, p2, v3}, Ljava/nio/file/Files;->createTempFile(Ljava/lang/String;Ljava/lang/String;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    move-result-object v3

    move-object v0, v3

    .line 413
    new-array v3, v2, [Ljava/lang/String;

    invoke-static {p0, v3}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v3

    .line 414
    .local v3, "pathToPassedFile":Ljava/nio/file/Path;
    new-array v4, v1, [Ljava/nio/file/CopyOption;

    sget-object v5, Ljava/nio/file/StandardCopyOption;->REPLACE_EXISTING:Ljava/nio/file/StandardCopyOption;

    aput-object v5, v4, v2

    invoke-static {v3, v0, v4}, Ljava/nio/file/Files;->copy(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 420
    nop

    .line 421
    .end local v3    # "pathToPassedFile":Ljava/nio/file/Path;
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 415
    :catch_0
    move-exception v3

    .line 416
    .local v3, "e":Ljava/io/IOException;
    if-eqz v0, :cond_0

    .line 417
    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-static {v1}, Lcom/itextpdf/commons/utils/FileUtil;->removeFiles([Ljava/lang/String;)Z

    .line 419
    :cond_0
    throw v3
.end method

.method public static createTempDirectory(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "tempFilePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 452
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/nio/file/attribute/FileAttribute;

    invoke-static {p0, v0}, Ljava/nio/file/Files;->createTempDirectory(Ljava/lang/String;[Ljava/nio/file/attribute/FileAttribute;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static createTempFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 256
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 257
    .local v0, "tempFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 258
    const-string/jumbo v1, "pdf"

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    .line 260
    :cond_0
    return-object v0
.end method

.method public static createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "tempFilePrefix"    # Ljava/lang/String;
    .param p1, "tempFilePostfix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 390
    invoke-static {p0, p1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static deleteFile(Ljava/io/File;)Z
    .locals 1
    .param p0, "file"    # Ljava/io/File;

    .line 359
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    return v0
.end method

.method public static directoryExists(Ljava/lang/String;)Z
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .line 117
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 118
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 119
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 121
    .end local v1    # "f":Ljava/io/File;
    :cond_1
    return v0
.end method

.method public static fileExists(Ljava/lang/String;)Z
    .locals 3
    .param p0, "path"    # Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 87
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 88
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 90
    .end local v1    # "f":Ljava/io/File;
    :cond_1
    return v0
.end method

.method public static getBufferedOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 2
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 215
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method

.method public static getFileOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;
    .locals 1
    .param p0, "tempFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 273
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static getFileOutputStream(Ljava/lang/String;)Ljava/io/OutputStream;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 312
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/String;

    invoke-static {p0, v1}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v1

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    invoke-static {v1, v0}, Ljava/nio/file/Files;->newOutputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getFontsDir()Ljava/lang/String;
    .locals 4

    .line 68
    :try_start_0
    const-string/jumbo v0, "windir"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "winDir":Ljava/lang/String;
    const-string v1, "file.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "fileSeparator":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "fonts"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 71
    .end local v0    # "winDir":Ljava/lang/String;
    .end local v1    # "fileSeparator":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 72
    .local v0, "e":Ljava/lang/SecurityException;
    const-class v1, Lcom/itextpdf/commons/utils/FileUtil;

    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v1

    const-string v2, "Can\'t access System.getenv(\"windir\") to load fonts. Please, add RuntimePermission for getenv.windir."

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 74
    const/4 v1, 0x0

    return-object v1
.end method

.method public static getInputStreamForFile(Ljava/io/File;)Ljava/io/InputStream;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 299
    invoke-virtual {p0}, Ljava/io/File;->toPath()Ljava/nio/file/Path;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/nio/file/OpenOption;

    invoke-static {v0, v1}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getInputStreamForFile(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 286
    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/String;

    invoke-static {p0, v1}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v1

    new-array v0, v0, [Ljava/nio/file/OpenOption;

    invoke-static {v1, v0}, Ljava/nio/file/Files;->newInputStream(Ljava/nio/file/Path;[Ljava/nio/file/OpenOption;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static getParentDirectoryUri(Ljava/io/File;)Ljava/lang/String;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 348
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-interface {v0}, Ljava/nio/file/Path;->toUri()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public static getRandomAccessFile(Ljava/io/File;)Ljava/io/RandomAccessFile;
    .locals 2
    .param p0, "tempFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 325
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string/jumbo v1, "rw"

    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public static isFileNotEmpty(Ljava/lang/String;)Z
    .locals 6
    .param p0, "path"    # Ljava/lang/String;

    .line 101
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 102
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 103
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    .line 105
    .end local v1    # "f":Ljava/io/File;
    :cond_1
    return v0
.end method

.method private static listAllFiles(Ljava/lang/String;Ljava/util/List;)V
    .locals 5
    .param p0, "dir"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 176
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 177
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_1

    .line 179
    new-instance v1, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;-><init>(Lcom/itextpdf/commons/utils/FileUtil$1;)V

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 180
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 181
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 182
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Lcom/itextpdf/commons/utils/FileUtil;->listAllFiles(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 184
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .end local v3    # "file":Ljava/io/File;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 188
    :cond_1
    return-void
.end method

.method public static listFilesInDirectory(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 8
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "recursive"    # Z

    .line 133
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 134
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 135
    .local v1, "root":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 136
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 137
    .local v2, "files":[Ljava/io/File;
    if-eqz v2, :cond_2

    .line 139
    new-instance v3, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;

    invoke-direct {v3, v0}, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;-><init>(Lcom/itextpdf/commons/utils/FileUtil$1;)V

    invoke-static {v2, v3}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 140
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v2, v5

    .line 142
    .local v6, "file":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_0

    if-eqz p1, :cond_0

    .line 143
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v0}, Lcom/itextpdf/commons/utils/FileUtil;->listAllFiles(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_1

    .line 145
    :cond_0
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    .end local v6    # "file":Ljava/io/File;
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 148
    :cond_1
    new-array v3, v4, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    .line 152
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "root":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    :cond_2
    return-object v0
.end method

.method public static listFilesInDirectoryByFilter(Ljava/lang/String;Ljava/io/FileFilter;)[Ljava/io/File;
    .locals 3
    .param p0, "outPath"    # Ljava/lang/String;
    .param p1, "fileFilter"    # Ljava/io/FileFilter;

    .line 164
    const/4 v0, 0x0

    .line 165
    .local v0, "result":[Ljava/io/File;
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 166
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v0

    .line 168
    :cond_0
    if-eqz v0, :cond_1

    .line 170
    new-instance v1, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/itextpdf/commons/utils/FileUtil$CaseSensitiveFileComparator;-><init>(Lcom/itextpdf/commons/utils/FileUtil$1;)V

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 172
    :cond_1
    return-object v0
.end method

.method public static parentDirectory(Ljava/net/URL;)Ljava/lang/String;
    .locals 2
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .line 372
    invoke-virtual {p0}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static removeFiles([Ljava/lang/String;)Z
    .locals 6
    .param p0, "paths"    # [Ljava/lang/String;

    .line 463
    const/4 v0, 0x1

    .line 464
    .local v0, "allFilesAreRemoved":Z
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p0, v3

    .line 466
    .local v4, "path":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 467
    :try_start_0
    new-array v5, v2, [Ljava/lang/String;

    invoke-static {v4, v5}, Ljava/nio/file/Paths;->get(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v5

    invoke-static {v5}, Ljava/nio/file/Files;->delete(Ljava/nio/file/Path;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 469
    :catch_0
    move-exception v5

    .line 470
    .local v5, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_2

    .line 471
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    nop

    .line 464
    .end local v4    # "path":Ljava/lang/String;
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 473
    :cond_1
    return v0
.end method

.method public static wrapWithBufferedOutputStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;
    .locals 1
    .param p0, "outputStream"    # Ljava/io/OutputStream;

    .line 226
    instance-of v0, p0, Ljava/io/ByteArrayOutputStream;

    if-nez v0, :cond_1

    instance-of v0, p0, Ljava/io/BufferedOutputStream;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 229
    :cond_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-direct {v0, p0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0

    .line 227
    :cond_1
    :goto_0
    return-object p0
.end method
