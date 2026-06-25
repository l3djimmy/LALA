.class Landroidx/camera/core/imagecapture/JpegBytes2Disk;
.super Ljava/lang/Object;
.source "JpegBytes2Disk.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;",
        "Landroidx/camera/core/ImageCapture$OutputFileResults;",
        ">;"
    }
.end annotation


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x400

.field private static final NOT_PENDING:I = 0x0

.field private static final PENDING:I = 0x1

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "CameraX"

.field private static final TEMP_FILE_SUFFIX:Ljava/lang/String; = ".tmp"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;
    .locals 4
    .param p0, "source"    # Ljava/io/File;
    .param p1, "target"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 215
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 216
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 218
    :cond_0
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    .line 219
    :cond_1
    new-instance v0, Landroidx/camera/core/ImageCaptureException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to overwrite the file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 221
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v3, v1, v2}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 9
    .param p0, "file"    # Ljava/io/File;
    .param p1, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 186
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 187
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 188
    new-instance v1, Landroid/content/ContentValues;

    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 189
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    :goto_0
    nop

    .line 190
    .local v1, "values":Landroid/content/ContentValues;
    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    .line 191
    const/4 v3, 0x0

    .line 193
    .local v3, "uri":Landroid/net/Uri;
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v0, v5, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    move-object v3, v5

    .line 194
    if-eqz v3, :cond_2

    .line 198
    invoke-static {p0, v3, v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    if-eqz v3, :cond_1

    .line 204
    invoke-static {v3, v0, v4}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    .line 207
    :cond_1
    return-object v3

    .line 195
    :cond_2
    :try_start_1
    new-instance v5, Landroidx/camera/core/ImageCaptureException;

    const-string v6, "Failed to insert a MediaStore URI."

    const/4 v7, 0x0

    invoke-direct {v5, v2, v6, v7}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local p0    # "file":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v1    # "values":Landroid/content/ContentValues;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p0    # "file":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 199
    :catch_0
    move-exception v5

    goto :goto_1

    :catch_1
    move-exception v5

    .line 200
    .local v5, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_2
    new-instance v6, Landroidx/camera/core/ImageCaptureException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to write to MediaStore URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v2, v7, v5}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local p0    # "file":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 203
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v1    # "values":Landroid/content/ContentValues;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p0    # "file":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :goto_2
    if-eqz v3, :cond_3

    .line 204
    invoke-static {v3, v0, v4}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V

    .line 206
    :cond_3
    throw v2
.end method

.method private static copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 247
    .local v0, "in":Ljava/io/InputStream;
    const/16 v1, 0x400

    :try_start_0
    new-array v1, v1, [B

    .line 249
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "len":I
    if-lez v2, :cond_0

    .line 250
    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 252
    .end local v1    # "buf":[B
    .end local v3    # "len":I
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 253
    .end local v0    # "in":Ljava/io/InputStream;
    return-void

    .line 246
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
.end method

.method private static copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;Landroid/content/ContentResolver;)V
    .locals 4
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "contentResolver"    # Landroid/content/ContentResolver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-virtual {p2, p1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 235
    .local v0, "outputStream":Ljava/io/OutputStream;
    if-eqz v0, :cond_1

    .line 238
    :try_start_0
    invoke-static {p0, v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 240
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :cond_0
    return-void

    .line 234
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 236
    :cond_1
    :try_start_1
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " cannot be resolved."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .end local v0    # "outputStream":Ljava/io/OutputStream;
    .end local p0    # "tempFile":Ljava/io/File;
    .end local p1    # "uri":Landroid/net/Uri;
    .end local p2    # "contentResolver":Landroid/content/ContentResolver;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 234
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    .restart local p0    # "tempFile":Ljava/io/File;
    .restart local p1    # "uri":Landroid/net/Uri;
    .restart local p2    # "contentResolver":Landroid/content/ContentResolver;
    :goto_0
    if-eqz v0, :cond_2

    :try_start_2
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    throw v1
.end method

.method private static createTempFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Ljava/io/File;
    .locals 5
    .param p0, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 81
    :try_start_0
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    .local v0, "appProvidedFile":Ljava/io/File;
    const-string v1, "CameraX"

    if-eqz v0, :cond_0

    .line 86
    :try_start_1
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 87
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 88
    invoke-static {v0}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    return-object v2

    .line 90
    :cond_0
    const-string v2, ".tmp"

    invoke-static {v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    .line 92
    .end local v0    # "appProvidedFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x1

    const-string v3, "Failed to create temp file."

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p0, "file"    # Ljava/io/File;

    .line 98
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "fileName":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 100
    .local v1, "dotIndex":I
    if-ltz v1, :cond_0

    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 103
    :cond_0
    const-string v2, ""

    return-object v2
.end method

.method private static isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 281
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 275
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 276
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 275
    :goto_0
    return v0
.end method

.method private static isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z
    .locals 1
    .param p0, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 285
    invoke-virtual {p0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static moveFileToTarget(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;
    .locals 6
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 164
    const/4 v0, 0x0

    .line 166
    .local v0, "uri":Landroid/net/Uri;
    :try_start_0
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToMediaStore(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 167
    invoke-static {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToMediaStore(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;

    move-result-object v1

    move-object v0, v1

    goto :goto_0

    .line 168
    :cond_0
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToOutputStream(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 169
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/OutputStream;

    invoke-static {p0, v1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V

    goto :goto_0

    .line 170
    :cond_1
    invoke-static {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->isSaveToFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 171
    invoke-virtual {p1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-static {p0, v1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->copyFileToFile(Ljava/io/File;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 177
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 178
    nop

    .line 179
    return-object v0

    .line 177
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 173
    :catch_0
    move-exception v1

    .line 174
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v2, Landroidx/camera/core/ImageCaptureException;

    const-string v3, "Failed to write to OutputStream."

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-direct {v2, v5, v3, v4}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "uri":Landroid/net/Uri;
    .end local p0    # "tempFile":Ljava/io/File;
    .end local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "uri":Landroid/net/Uri;
    .restart local p0    # "tempFile":Ljava/io/File;
    .restart local p1    # "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    :goto_1
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 178
    throw v1
.end method

.method private static setContentValuePendingFlag(Landroid/content/ContentValues;I)V
    .locals 2
    .param p0, "values"    # Landroid/content/ContentValues;
    .param p1, "isPending"    # I

    .line 269
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 270
    const-string/jumbo v0, "is_pending"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 272
    :cond_0
    return-void
.end method

.method private static updateFileExif(Ljava/io/File;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)V
    .locals 4
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "originalExif"    # Landroidx/camera/core/impl/utils/Exif;
    .param p2, "options"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p3, "rotationDegrees"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 128
    :try_start_0
    invoke-static {p0}, Landroidx/camera/core/impl/utils/Exif;->createFromFile(Ljava/io/File;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v0

    .line 129
    .local v0, "exif":Landroidx/camera/core/impl/utils/Exif;
    invoke-virtual {p1, v0}, Landroidx/camera/core/impl/utils/Exif;->copyToCroppedImage(Landroidx/camera/core/impl/utils/Exif;)V

    .line 131
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->getRotation()I

    move-result v1

    if-nez v1, :cond_0

    if-eqz p3, :cond_0

    .line 135
    invoke-virtual {v0, p3}, Landroidx/camera/core/impl/utils/Exif;->rotate(I)V

    .line 139
    :cond_0
    invoke-virtual {p2}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v1

    .line 140
    .local v1, "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontal()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 141
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->flipHorizontally()V

    .line 143
    :cond_1
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedVertical()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 144
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->flipVertically()V

    .line 146
    :cond_2
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 147
    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/utils/Exif;->attachLocation(Landroid/location/Location;)V

    .line 149
    :cond_3
    invoke-virtual {v0}, Landroidx/camera/core/impl/utils/Exif;->save()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .end local v0    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local v1    # "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    nop

    .line 153
    return-void

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x1

    const-string v3, "Failed to update Exif data"

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static updateUriPendingStatus(Landroid/net/Uri;Landroid/content/ContentResolver;I)V
    .locals 2
    .param p0, "outputUri"    # Landroid/net/Uri;
    .param p1, "contentResolver"    # Landroid/content/ContentResolver;
    .param p2, "isPending"    # I

    .line 260
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 261
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 262
    .local v0, "values":Landroid/content/ContentValues;
    invoke-static {v0, p2}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->setContentValuePendingFlag(Landroid/content/ContentValues;I)V

    .line 263
    const/4 v1, 0x0

    invoke-virtual {p1, p0, v0, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 265
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    return-void
.end method

.method private static writeBytesToFile(Ljava/io/File;[B)V
    .locals 4
    .param p0, "tempFile"    # Ljava/io/File;
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 112
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .local v0, "output":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v1, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;

    invoke-direct {v1}, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;-><init>()V

    .line 114
    .local v1, "invalidJpegDataParser":Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;
    invoke-virtual {v1, p1}, Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;->getValidDataLength([B)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v3, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 115
    .end local v1    # "invalidJpegDataParser":Landroidx/camera/core/internal/compat/workaround/InvalidJpegDataParser;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 117
    .end local v0    # "output":Ljava/io/FileOutputStream;
    nop

    .line 118
    return-void

    .line 112
    .restart local v0    # "output":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_4
    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "tempFile":Ljava/io/File;
    .end local p1    # "bytes":[B
    :goto_0
    throw v1
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 115
    .end local v0    # "output":Ljava/io/FileOutputStream;
    .restart local p0    # "tempFile":Ljava/io/File;
    .restart local p1    # "bytes":[B
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Landroidx/camera/core/ImageCaptureException;

    const/4 v2, 0x1

    const-string v3, "Failed to write to temp file"

    invoke-direct {v1, v2, v3, v0}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public apply(Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;)Landroidx/camera/core/ImageCapture$OutputFileResults;
    .locals 5
    .param p1, "in"    # Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 64
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->getPacket()Landroidx/camera/core/processing/Packet;

    move-result-object v0

    .line 65
    .local v0, "packet":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<[B>;"
    invoke-virtual {p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;->getOutputFileOptions()Landroidx/camera/core/ImageCapture$OutputFileOptions;

    move-result-object v1

    .line 66
    .local v1, "options":Landroidx/camera/core/ImageCapture$OutputFileOptions;
    invoke-static {v1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->createTempFile(Landroidx/camera/core/ImageCapture$OutputFileOptions;)Ljava/io/File;

    move-result-object v2

    .line 67
    .local v2, "tempFile":Ljava/io/File;
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    invoke-static {v2, v3}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->writeBytesToFile(Ljava/io/File;[B)V

    .line 68
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getExif()Landroidx/camera/core/impl/utils/Exif;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/impl/utils/Exif;

    .line 69
    invoke-virtual {v0}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v4

    .line 68
    invoke-static {v2, v3, v1, v4}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->updateFileExif(Ljava/io/File;Landroidx/camera/core/impl/utils/Exif;Landroidx/camera/core/ImageCapture$OutputFileOptions;I)V

    .line 70
    invoke-static {v2, v1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->moveFileToTarget(Ljava/io/File;Landroidx/camera/core/ImageCapture$OutputFileOptions;)Landroid/net/Uri;

    move-result-object v3

    .line 71
    .local v3, "uri":Landroid/net/Uri;
    new-instance v4, Landroidx/camera/core/ImageCapture$OutputFileResults;

    invoke-direct {v4, v3}, Landroidx/camera/core/ImageCapture$OutputFileResults;-><init>(Landroid/net/Uri;)V

    return-object v4
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 52
    check-cast p1, Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/JpegBytes2Disk;->apply(Landroidx/camera/core/imagecapture/JpegBytes2Disk$In;)Landroidx/camera/core/ImageCapture$OutputFileResults;

    move-result-object p1

    return-object p1
.end method
