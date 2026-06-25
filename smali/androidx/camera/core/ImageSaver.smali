.class final Landroidx/camera/core/ImageSaver;
.super Ljava/lang/Object;
.source "ImageSaver.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ImageSaver$OnImageSavedCallback;,
        Landroidx/camera/core/ImageSaver$SaveError;
    }
.end annotation


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x400

.field private static final NOT_PENDING:I = 0x0

.field private static final PENDING:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ImageSaver"

.field private static final TEMP_FILE_PREFIX:Ljava/lang/String; = "CameraX"

.field private static final TEMP_FILE_SUFFIX:Ljava/lang/String; = ".tmp"


# instance fields
.field private final mCallback:Landroidx/camera/core/ImageSaver$OnImageSavedCallback;

.field private final mImage:Landroidx/camera/core/ImageProxy;

.field private final mJpegQuality:I

.field private final mOrientation:I

.field private final mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

.field private final mSequentialIoExecutor:Ljava/util/concurrent/Executor;

.field private final mUserCallbackExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method constructor <init>(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageCapture$OutputFileOptions;IILjava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Landroidx/camera/core/ImageSaver$OnImageSavedCallback;)V
    .locals 0
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;
    .param p2, "outputFileOptions"    # Landroidx/camera/core/ImageCapture$OutputFileOptions;
    .param p3, "orientation"    # I
    .param p4, "jpegQuality"    # I
    .param p5, "userCallbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p6, "sequentialIoExecutor"    # Ljava/util/concurrent/Executor;
    .param p7, "callback"    # Landroidx/camera/core/ImageSaver$OnImageSavedCallback;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Landroidx/camera/core/ImageSaver;->mImage:Landroidx/camera/core/ImageProxy;

    .line 83
    iput-object p2, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 84
    iput p3, p0, Landroidx/camera/core/ImageSaver;->mOrientation:I

    .line 85
    iput p4, p0, Landroidx/camera/core/ImageSaver;->mJpegQuality:I

    .line 86
    iput-object p7, p0, Landroidx/camera/core/ImageSaver;->mCallback:Landroidx/camera/core/ImageSaver$OnImageSavedCallback;

    .line 87
    iput-object p5, p0, Landroidx/camera/core/ImageSaver;->mUserCallbackExecutor:Ljava/util/concurrent/Executor;

    .line 88
    iput-object p6, p0, Landroidx/camera/core/ImageSaver;->mSequentialIoExecutor:Ljava/util/concurrent/Executor;

    .line 89
    return-void
.end method

.method private copyTempFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "tempFile"    # Ljava/io/File;
    .param p2, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 336
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 337
    .local v0, "in":Ljava/io/InputStream;
    const/16 v1, 0x400

    :try_start_0
    new-array v1, v1, [B

    .line 339
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    move v3, v2

    .local v3, "len":I
    if-lez v2, :cond_0

    .line 340
    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 342
    .end local v1    # "buf":[B
    .end local v3    # "len":I
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 343
    .end local v0    # "in":Ljava/io/InputStream;
    return-void

    .line 336
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

.method private copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;)Z
    .locals 3
    .param p1, "tempFile"    # Ljava/io/File;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 323
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 324
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object v0

    .line 325
    .local v0, "outputStream":Ljava/io/OutputStream;
    if-nez v0, :cond_1

    .line 327
    nop

    .line 330
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 327
    :cond_0
    const/4 v1, 0x0

    return v1

    .line 329
    :cond_1
    :try_start_0
    invoke-direct {p0, p1, v0}, Landroidx/camera/core/ImageSaver;->copyTempFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 330
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 331
    .end local v0    # "outputStream":Ljava/io/OutputStream;
    :cond_2
    const/4 v0, 0x1

    return v0

    .line 323
    .restart local v0    # "outputStream":Ljava/io/OutputStream;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_0
    throw v1
.end method

.method private static getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p0, "file"    # Ljava/io/File;

    .line 192
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "fileName":Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 194
    .local v1, "dotIndex":I
    if-ltz v1, :cond_0

    .line 195
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 197
    :cond_0
    const-string v2, ""

    return-object v2
.end method

.method private imageToJpegByteArray(Landroidx/camera/core/ImageProxy;I)[B
    .locals 5
    .param p1, "image"    # Landroidx/camera/core/ImageProxy;
    .param p2, "jpegQuality"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
        }
    .end annotation

    .line 204
    invoke-static {p1}, Landroidx/camera/core/internal/utils/ImageUtil;->shouldCropImage(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    .line 205
    .local v0, "shouldCropImage":Z
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v1

    .line 207
    .local v1, "imageFormat":I
    const/16 v2, 0x100

    if-ne v1, v2, :cond_1

    .line 208
    if-nez v0, :cond_0

    .line 211
    invoke-static {p1}, Landroidx/camera/core/internal/utils/ImageUtil;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;)[B

    move-result-object v2

    return-object v2

    .line 213
    :cond_0
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-static {p1, v2, p2}, Landroidx/camera/core/internal/utils/ImageUtil;->jpegImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;I)[B

    move-result-object v2

    return-object v2

    .line 215
    :cond_1
    const/16 v2, 0x23

    const/4 v3, 0x0

    if-ne v1, v2, :cond_3

    .line 216
    if-eqz v0, :cond_2

    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    goto :goto_0

    .line 217
    :cond_2
    nop

    :goto_0
    nop

    .line 216
    const/4 v2, 0x0

    invoke-static {p1, v3, p2, v2}, Landroidx/camera/core/internal/utils/ImageUtil;->yuvImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;II)[B

    move-result-object v2

    return-object v2

    .line 219
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unrecognized image format: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "ImageSaver"

    invoke-static {v4, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    return-object v3
.end method

.method private isSaveToFile()Z
    .locals 1

    .line 292
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isSaveToMediaStore()Z
    .locals 1

    .line 286
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 287
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 288
    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 286
    :goto_0
    return v0
.end method

.method private isSaveToOutputStream()Z
    .locals 1

    .line 296
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v0}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private postError(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "saveError"    # Landroidx/camera/core/ImageSaver$SaveError;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 359
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mUserCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2, p3}, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageSaver;Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    goto :goto_0

    .line 360
    :catch_0
    move-exception v0

    .line 361
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v1, "ImageSaver"

    const-string v2, "Application executor rejected executing OnImageSavedCallback.onError callback. Skipping."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method

.method private postSuccess(Landroid/net/Uri;)V
    .locals 3
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 347
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mUserCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/ImageSaver;Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 353
    goto :goto_0

    .line 349
    :catch_0
    move-exception v0

    .line 350
    .local v0, "e":Ljava/util/concurrent/RejectedExecutionException;
    const-string v1, "ImageSaver"

    const-string v2, "Application executor rejected executing OnImageSavedCallback.onImageSaved callback. Skipping."

    invoke-static {v1, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    .end local v0    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :goto_0
    return-void
.end method

.method private saveImageToTempFile()Ljava/io/File;
    .locals 11

    .line 112
    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0}, Landroidx/camera/core/ImageSaver;->isSaveToFile()Z

    move-result v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    const-string v2, "CameraX"

    if-eqz v1, :cond_0

    .line 116
    :try_start_1
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v3}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 117
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 118
    invoke-virtual {v4}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v4

    invoke-static {v4}, Landroidx/camera/core/ImageSaver;->getFileExtensionWithDot(Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .local v1, "tempFile":Ljava/io/File;
    goto :goto_0

    .line 120
    .end local v1    # "tempFile":Ljava/io/File;
    :cond_0
    const-string v1, ".tmp"

    invoke-static {v2, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 125
    .restart local v1    # "tempFile":Ljava/io/File;
    :goto_0
    nop

    .line 127
    const/4 v2, 0x0

    .line 128
    .local v2, "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    const/4 v3, 0x0

    .line 129
    .local v3, "errorMessage":Ljava/lang/String;
    const/4 v4, 0x0

    .line 130
    .local v4, "throwable":Ljava/lang/Throwable;
    :try_start_2
    iget-object v5, p0, Landroidx/camera/core/ImageSaver;->mImage:Landroidx/camera/core/ImageProxy;
    :try_end_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 131
    .local v5, "imageToClose":Landroidx/camera/core/ImageProxy;
    :try_start_3
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 132
    .local v6, "output":Ljava/io/FileOutputStream;
    :try_start_4
    iget-object v7, p0, Landroidx/camera/core/ImageSaver;->mImage:Landroidx/camera/core/ImageProxy;

    iget v8, p0, Landroidx/camera/core/ImageSaver;->mJpegQuality:I

    invoke-direct {p0, v7, v8}, Landroidx/camera/core/ImageSaver;->imageToJpegByteArray(Landroidx/camera/core/ImageProxy;I)[B

    move-result-object v7

    .line 133
    .local v7, "bytes":[B
    invoke-virtual {v6, v7}, Ljava/io/FileOutputStream;->write([B)V

    .line 136
    invoke-static {v1}, Landroidx/camera/core/impl/utils/Exif;->createFromFile(Ljava/io/File;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v8

    .line 137
    .local v8, "exif":Landroidx/camera/core/impl/utils/Exif;
    iget-object v9, p0, Landroidx/camera/core/ImageSaver;->mImage:Landroidx/camera/core/ImageProxy;

    invoke-static {v9}, Landroidx/camera/core/impl/utils/Exif;->createFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/impl/utils/Exif;

    move-result-object v9

    invoke-virtual {v9, v8}, Landroidx/camera/core/impl/utils/Exif;->copyToCroppedImage(Landroidx/camera/core/impl/utils/Exif;)V

    .line 140
    new-instance v9, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;

    invoke-direct {v9}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;-><init>()V

    iget-object v10, p0, Landroidx/camera/core/ImageSaver;->mImage:Landroidx/camera/core/ImageProxy;

    invoke-virtual {v9, v10}, Landroidx/camera/core/internal/compat/workaround/ExifRotationAvailability;->shouldUseExifOrientation(Landroidx/camera/core/ImageProxy;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 141
    iget v9, p0, Landroidx/camera/core/ImageSaver;->mOrientation:I

    invoke-virtual {v8, v9}, Landroidx/camera/core/impl/utils/Exif;->rotate(I)V

    .line 145
    :cond_1
    iget-object v9, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v9}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v9

    .line 146
    .local v9, "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    invoke-virtual {v9}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedHorizontal()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 147
    invoke-virtual {v8}, Landroidx/camera/core/impl/utils/Exif;->flipHorizontally()V

    .line 149
    :cond_2
    invoke-virtual {v9}, Landroidx/camera/core/ImageCapture$Metadata;->isReversedVertical()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 150
    invoke-virtual {v8}, Landroidx/camera/core/impl/utils/Exif;->flipVertically()V

    .line 152
    :cond_3
    invoke-virtual {v9}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v10

    if-eqz v10, :cond_4

    .line 153
    iget-object v10, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v10}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getMetadata()Landroidx/camera/core/ImageCapture$Metadata;

    move-result-object v10

    invoke-virtual {v10}, Landroidx/camera/core/ImageCapture$Metadata;->getLocation()Landroid/location/Location;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroidx/camera/core/impl/utils/Exif;->attachLocation(Landroid/location/Location;)V

    .line 156
    :cond_4
    invoke-virtual {v8}, Landroidx/camera/core/impl/utils/Exif;->save()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 157
    .end local v7    # "bytes":[B
    .end local v8    # "exif":Landroidx/camera/core/impl/utils/Exif;
    .end local v9    # "metadata":Landroidx/camera/core/ImageCapture$Metadata;
    :try_start_5
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .end local v6    # "output":Ljava/io/FileOutputStream;
    if-eqz v5, :cond_6

    :try_start_6
    invoke-interface {v5}, Landroidx/camera/core/ImageProxy;->close()V
    :try_end_6
    .catch Ljava/lang/OutOfMemoryError; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_5

    .line 130
    .restart local v6    # "output":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v7

    :try_start_7
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v8

    :try_start_8
    invoke-virtual {v7, v8}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "tempFile":Ljava/io/File;
    .end local v2    # "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    .end local v3    # "errorMessage":Ljava/lang/String;
    .end local v4    # "throwable":Ljava/lang/Throwable;
    .end local v5    # "imageToClose":Landroidx/camera/core/ImageProxy;
    :goto_1
    throw v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .end local v6    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "tempFile":Ljava/io/File;
    .restart local v2    # "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    .restart local v3    # "errorMessage":Ljava/lang/String;
    .restart local v4    # "throwable":Ljava/lang/Throwable;
    .restart local v5    # "imageToClose":Landroidx/camera/core/ImageProxy;
    :catchall_2
    move-exception v6

    if-eqz v5, :cond_5

    :try_start_9
    invoke-interface {v5}, Landroidx/camera/core/ImageProxy;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception v7

    :try_start_a
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v1    # "tempFile":Ljava/io/File;
    .end local v2    # "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    .end local v3    # "errorMessage":Ljava/lang/String;
    .end local v4    # "throwable":Ljava/lang/Throwable;
    :cond_5
    :goto_2
    throw v6
    :try_end_a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_a} :catch_1
    .catch Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException; {:try_start_a .. :try_end_a} :catch_0

    .line 165
    .end local v5    # "imageToClose":Landroidx/camera/core/ImageProxy;
    .restart local v1    # "tempFile":Ljava/io/File;
    .restart local v2    # "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    .restart local v3    # "errorMessage":Ljava/lang/String;
    .restart local v4    # "throwable":Ljava/lang/Throwable;
    :catch_0
    move-exception v5

    .line 166
    .local v5, "e":Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
    sget-object v6, Landroidx/camera/core/ImageSaver$1;->$SwitchMap$androidx$camera$core$internal$utils$ImageUtil$CodecFailedException$FailureType:[I

    invoke-virtual {v5}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;->getFailureType()Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException$FailureType;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 177
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->UNKNOWN:Landroidx/camera/core/ImageSaver$SaveError;

    .line 178
    const-string v3, "Failed to transcode mImage"

    goto :goto_3

    .line 172
    :pswitch_0
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->CROP_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    .line 173
    const-string v3, "Failed to crop mImage"

    .line 174
    goto :goto_3

    .line 168
    :pswitch_1
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->ENCODE_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    .line 169
    const-string v3, "Failed to encode mImage"

    .line 170
    nop

    .line 181
    :goto_3
    move-object v4, v5

    goto :goto_6

    .line 161
    .end local v5    # "e":Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
    :catch_1
    move-exception v5

    goto :goto_4

    :catch_2
    move-exception v5

    .line 162
    .local v5, "e":Ljava/lang/Exception;
    :goto_4
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    .line 163
    const-string v3, "Failed to write temp file"

    .line 164
    move-object v4, v5

    .end local v5    # "e":Ljava/lang/Exception;
    goto :goto_5

    .line 157
    :catch_3
    move-exception v5

    .line 158
    .local v5, "e":Ljava/lang/OutOfMemoryError;
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->UNKNOWN:Landroidx/camera/core/ImageSaver$SaveError;

    .line 159
    const-string/jumbo v3, "Processing failed due to low memory."

    .line 160
    move-object v4, v5

    .line 182
    .end local v5    # "e":Ljava/lang/OutOfMemoryError;
    :cond_6
    :goto_5
    nop

    .line 183
    :goto_6
    if-eqz v2, :cond_7

    .line 184
    invoke-direct {p0, v2, v3, v4}, Landroidx/camera/core/ImageSaver;->postError(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 185
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 186
    return-object v0

    .line 188
    :cond_7
    return-object v1

    .line 122
    .end local v1    # "tempFile":Ljava/io/File;
    .end local v2    # "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    .end local v3    # "errorMessage":Ljava/lang/String;
    .end local v4    # "throwable":Ljava/lang/Throwable;
    :catch_4
    move-exception v1

    .line 123
    .local v1, "e":Ljava/io/IOException;
    sget-object v2, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    const-string v3, "Failed to create temp file"

    invoke-direct {p0, v2, v3, v1}, Landroidx/camera/core/ImageSaver;->postError(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setContentValuePending(Landroid/content/ContentValues;I)V
    .locals 2
    .param p1, "values"    # Landroid/content/ContentValues;
    .param p2, "isPending"    # I

    .line 312
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 313
    const-string/jumbo v0, "is_pending"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 315
    :cond_0
    return-void
.end method

.method private setUriNotPending(Landroid/net/Uri;)V
    .locals 3
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 303
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    .line 304
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 305
    .local v0, "values":Landroid/content/ContentValues;
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Landroidx/camera/core/ImageSaver;->setContentValuePending(Landroid/content/ContentValues;I)V

    .line 306
    iget-object v1, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v1}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v0, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 308
    .end local v0    # "values":Landroid/content/ContentValues;
    :cond_0
    return-void
.end method


# virtual methods
.method copyTempFileToDestination(Ljava/io/File;)V
    .locals 7
    .param p1, "tempFile"    # Ljava/io/File;

    .line 231
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const/4 v0, 0x0

    .line 233
    .local v0, "saveError":Landroidx/camera/core/ImageSaver$SaveError;
    const/4 v1, 0x0

    .line 234
    .local v1, "errorMessage":Ljava/lang/String;
    const/4 v2, 0x0

    .line 235
    .local v2, "exception":Ljava/lang/Exception;
    const/4 v3, 0x0

    .line 237
    .local v3, "outputUri":Landroid/net/Uri;
    :try_start_0
    invoke-direct {p0}, Landroidx/camera/core/ImageSaver;->isSaveToMediaStore()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 238
    iget-object v4, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v4}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 239
    new-instance v4, Landroid/content/ContentValues;

    iget-object v5, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v5}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentValues()Landroid/content/ContentValues;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 240
    :cond_0
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    :goto_0
    nop

    .line 241
    .local v4, "values":Landroid/content/ContentValues;
    const/4 v5, 0x1

    invoke-direct {p0, v4, v5}, Landroidx/camera/core/ImageSaver;->setContentValuePending(Landroid/content/ContentValues;I)V

    .line 242
    iget-object v5, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v5}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    iget-object v6, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    .line 243
    invoke-virtual {v6}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getSaveCollection()Landroid/net/Uri;

    move-result-object v6

    .line 242
    invoke-virtual {v5, v6, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    move-object v3, v5

    .line 245
    if-nez v3, :cond_1

    .line 246
    sget-object v5, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    move-object v0, v5

    .line 247
    const-string v5, "Failed to insert URI."

    move-object v1, v5

    .end local v1    # "errorMessage":Ljava/lang/String;
    .local v5, "errorMessage":Ljava/lang/String;
    goto :goto_1

    .line 249
    .end local v5    # "errorMessage":Ljava/lang/String;
    .restart local v1    # "errorMessage":Ljava/lang/String;
    :cond_1
    invoke-direct {p0, p1, v3}, Landroidx/camera/core/ImageSaver;->copyTempFileToUri(Ljava/io/File;Landroid/net/Uri;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 250
    sget-object v5, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    move-object v0, v5

    .line 251
    const-string v5, "Failed to save to URI."

    move-object v1, v5

    .line 253
    :cond_2
    invoke-direct {p0, v3}, Landroidx/camera/core/ImageSaver;->setUriNotPending(Landroid/net/Uri;)V

    .line 255
    .end local v4    # "values":Landroid/content/ContentValues;
    :goto_1
    goto :goto_3

    :cond_3
    invoke-direct {p0}, Landroidx/camera/core/ImageSaver;->isSaveToOutputStream()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 256
    iget-object v4, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v4}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {p0, p1, v4}, Landroidx/camera/core/ImageSaver;->copyTempFileToOutputStream(Ljava/io/File;Ljava/io/OutputStream;)V

    goto :goto_3

    .line 257
    :cond_4
    invoke-direct {p0}, Landroidx/camera/core/ImageSaver;->isSaveToFile()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 258
    iget-object v4, p0, Landroidx/camera/core/ImageSaver;->mOutputFileOptions:Landroidx/camera/core/ImageCapture$OutputFileOptions;

    invoke-virtual {v4}, Landroidx/camera/core/ImageCapture$OutputFileOptions;->getFile()Ljava/io/File;

    move-result-object v4

    .line 262
    .local v4, "targetFile":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 263
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 265
    :cond_5
    invoke-virtual {p1, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 266
    sget-object v5, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    move-object v0, v5

    .line 267
    const-string v5, "Failed to rename file."

    move-object v1, v5

    .line 269
    :cond_6
    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, v5

    goto :goto_3

    .line 276
    .end local v4    # "targetFile":Ljava/io/File;
    :catchall_0
    move-exception v4

    goto :goto_5

    .line 271
    :catch_0
    move-exception v4

    goto :goto_2

    :catch_1
    move-exception v4

    goto :goto_2

    :catch_2
    move-exception v4

    .line 272
    .local v4, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_1
    sget-object v5, Landroidx/camera/core/ImageSaver$SaveError;->FILE_IO_FAILED:Landroidx/camera/core/ImageSaver$SaveError;

    move-object v0, v5

    .line 273
    const-string v5, "Failed to write destination file."
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v5

    .line 274
    move-object v2, v4

    .line 276
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_7
    :goto_3
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 277
    nop

    .line 278
    if-eqz v0, :cond_8

    .line 279
    invoke-direct {p0, v0, v1, v2}, Landroidx/camera/core/ImageSaver;->postError(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 281
    :cond_8
    invoke-direct {p0, v3}, Landroidx/camera/core/ImageSaver;->postSuccess(Landroid/net/Uri;)V

    .line 283
    :goto_4
    return-void

    .line 276
    :goto_5
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 277
    throw v4
.end method

.method synthetic lambda$postError$2$androidx-camera-core-ImageSaver(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "saveError"    # Landroidx/camera/core/ImageSaver$SaveError;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "cause"    # Ljava/lang/Throwable;

    .line 359
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mCallback:Landroidx/camera/core/ImageSaver$OnImageSavedCallback;

    invoke-interface {v0, p1, p2, p3}, Landroidx/camera/core/ImageSaver$OnImageSavedCallback;->onError(Landroidx/camera/core/ImageSaver$SaveError;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method synthetic lambda$postSuccess$1$androidx-camera-core-ImageSaver(Landroid/net/Uri;)V
    .locals 2
    .param p1, "outputUri"    # Landroid/net/Uri;

    .line 348
    iget-object v0, p0, Landroidx/camera/core/ImageSaver;->mCallback:Landroidx/camera/core/ImageSaver$OnImageSavedCallback;

    new-instance v1, Landroidx/camera/core/ImageCapture$OutputFileResults;

    invoke-direct {v1, p1}, Landroidx/camera/core/ImageCapture$OutputFileResults;-><init>(Landroid/net/Uri;)V

    invoke-interface {v0, v1}, Landroidx/camera/core/ImageSaver$OnImageSavedCallback;->onImageSaved(Landroidx/camera/core/ImageCapture$OutputFileResults;)V

    return-void
.end method

.method synthetic lambda$run$0$androidx-camera-core-ImageSaver(Ljava/io/File;)V
    .locals 0
    .param p1, "tempFile"    # Ljava/io/File;

    .line 99
    invoke-virtual {p0, p1}, Landroidx/camera/core/ImageSaver;->copyTempFileToDestination(Ljava/io/File;)V

    return-void
.end method

.method public run()V
    .locals 3

    .line 95
    invoke-direct {p0}, Landroidx/camera/core/ImageSaver;->saveImageToTempFile()Ljava/io/File;

    move-result-object v0

    .line 96
    .local v0, "tempFile":Ljava/io/File;
    if-eqz v0, :cond_0

    .line 99
    iget-object v1, p0, Landroidx/camera/core/ImageSaver;->mSequentialIoExecutor:Ljava/util/concurrent/Executor;

    new-instance v2, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Landroidx/camera/core/ImageSaver$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageSaver;Ljava/io/File;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 101
    :cond_0
    return-void
.end method
