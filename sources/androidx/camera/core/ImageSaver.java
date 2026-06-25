package androidx.camera.core;

import android.content.ContentValues;
import android.net.Uri;
import android.os.Build;
import androidx.camera.core.ImageCapture;
import androidx.camera.core.impl.utils.Exif;
import androidx.camera.core.internal.compat.workaround.ExifRotationAvailability;
import androidx.camera.core.internal.utils.ImageUtil;
import androidx.core.util.Preconditions;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
/* loaded from: classes.dex */
final class ImageSaver implements Runnable {
    private static final int COPY_BUFFER_SIZE = 1024;
    private static final int NOT_PENDING = 0;
    private static final int PENDING = 1;
    private static final String TAG = "ImageSaver";
    private static final String TEMP_FILE_PREFIX = "CameraX";
    private static final String TEMP_FILE_SUFFIX = ".tmp";
    private final OnImageSavedCallback mCallback;
    private final ImageProxy mImage;
    private final int mJpegQuality;
    private final int mOrientation;
    private final ImageCapture.OutputFileOptions mOutputFileOptions;
    private final Executor mSequentialIoExecutor;
    private final Executor mUserCallbackExecutor;

    /* loaded from: classes.dex */
    public interface OnImageSavedCallback {
        void onError(SaveError saveError, String str, Throwable th);

        void onImageSaved(ImageCapture.OutputFileResults outputFileResults);
    }

    /* loaded from: classes.dex */
    public enum SaveError {
        FILE_IO_FAILED,
        ENCODE_FAILED,
        CROP_FAILED,
        UNKNOWN
    }

    ImageSaver(ImageProxy image, ImageCapture.OutputFileOptions outputFileOptions, int orientation, int jpegQuality, Executor userCallbackExecutor, Executor sequentialIoExecutor, OnImageSavedCallback callback) {
        this.mImage = image;
        this.mOutputFileOptions = outputFileOptions;
        this.mOrientation = orientation;
        this.mJpegQuality = jpegQuality;
        this.mCallback = callback;
        this.mUserCallbackExecutor = userCallbackExecutor;
        this.mSequentialIoExecutor = sequentialIoExecutor;
    }

    @Override // java.lang.Runnable
    public void run() {
        final File tempFile = saveImageToTempFile();
        if (tempFile != null) {
            this.mSequentialIoExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageSaver$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    ImageSaver.this.m122lambda$run$0$androidxcameracoreImageSaver(tempFile);
                }
            });
        }
    }

    private File saveImageToTempFile() {
        File tempFile;
        try {
            if (isSaveToFile()) {
                tempFile = new File(this.mOutputFileOptions.getFile().getParent(), TEMP_FILE_PREFIX + UUID.randomUUID().toString() + getFileExtensionWithDot(this.mOutputFileOptions.getFile()));
            } else {
                tempFile = File.createTempFile(TEMP_FILE_PREFIX, TEMP_FILE_SUFFIX);
            }
            SaveError saveError = null;
            String errorMessage = null;
            Throwable throwable = null;
            try {
                ImageProxy imageToClose = this.mImage;
                try {
                    FileOutputStream output = new FileOutputStream(tempFile);
                    byte[] bytes = imageToJpegByteArray(this.mImage, this.mJpegQuality);
                    output.write(bytes);
                    Exif exif = Exif.createFromFile(tempFile);
                    Exif.createFromImageProxy(this.mImage).copyToCroppedImage(exif);
                    if (!new ExifRotationAvailability().shouldUseExifOrientation(this.mImage)) {
                        exif.rotate(this.mOrientation);
                    }
                    ImageCapture.Metadata metadata = this.mOutputFileOptions.getMetadata();
                    if (metadata.isReversedHorizontal()) {
                        exif.flipHorizontally();
                    }
                    if (metadata.isReversedVertical()) {
                        exif.flipVertically();
                    }
                    if (metadata.getLocation() != null) {
                        exif.attachLocation(this.mOutputFileOptions.getMetadata().getLocation());
                    }
                    exif.save();
                    output.close();
                    if (imageToClose != null) {
                        imageToClose.close();
                    }
                } catch (Throwable th) {
                    if (imageToClose != null) {
                        try {
                            imageToClose.close();
                        } catch (Throwable th2) {
                            th.addSuppressed(th2);
                        }
                    }
                    throw th;
                }
            } catch (ImageUtil.CodecFailedException e) {
                switch (e.getFailureType()) {
                    case ENCODE_FAILED:
                        saveError = SaveError.ENCODE_FAILED;
                        errorMessage = "Failed to encode mImage";
                        break;
                    case DECODE_FAILED:
                        saveError = SaveError.CROP_FAILED;
                        errorMessage = "Failed to crop mImage";
                        break;
                    default:
                        saveError = SaveError.UNKNOWN;
                        errorMessage = "Failed to transcode mImage";
                        break;
                }
                throwable = e;
            } catch (IOException e2) {
                e = e2;
                saveError = SaveError.FILE_IO_FAILED;
                errorMessage = "Failed to write temp file";
                throwable = e;
            } catch (IllegalArgumentException e3) {
                e = e3;
                saveError = SaveError.FILE_IO_FAILED;
                errorMessage = "Failed to write temp file";
                throwable = e;
            } catch (OutOfMemoryError e4) {
                saveError = SaveError.UNKNOWN;
                errorMessage = "Processing failed due to low memory.";
                throwable = e4;
            }
            if (saveError != null) {
                postError(saveError, errorMessage, throwable);
                tempFile.delete();
                return null;
            }
            return tempFile;
        } catch (IOException e5) {
            postError(SaveError.FILE_IO_FAILED, "Failed to create temp file", e5);
            return null;
        }
    }

    private static String getFileExtensionWithDot(File file) {
        String fileName = file.getName();
        int dotIndex = fileName.lastIndexOf(46);
        if (dotIndex >= 0) {
            return fileName.substring(dotIndex);
        }
        return "";
    }

    private byte[] imageToJpegByteArray(ImageProxy image, int jpegQuality) throws ImageUtil.CodecFailedException {
        boolean shouldCropImage = ImageUtil.shouldCropImage(image);
        int imageFormat = image.getFormat();
        if (imageFormat == 256) {
            if (!shouldCropImage) {
                return ImageUtil.jpegImageToJpegByteArray(image);
            }
            return ImageUtil.jpegImageToJpegByteArray(image, image.getCropRect(), jpegQuality);
        }
        if (imageFormat == 35) {
            return ImageUtil.yuvImageToJpegByteArray(image, shouldCropImage ? image.getCropRect() : null, jpegQuality, 0);
        }
        Logger.w(TAG, "Unrecognized image format: " + imageFormat);
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: copyTempFileToDestination */
    public void m122lambda$run$0$androidxcameracoreImageSaver(File tempFile) {
        ContentValues values;
        Preconditions.checkNotNull(tempFile);
        SaveError saveError = null;
        String errorMessage = null;
        Exception exception = null;
        Uri outputUri = null;
        try {
            try {
                if (isSaveToMediaStore()) {
                    if (this.mOutputFileOptions.getContentValues() != null) {
                        values = new ContentValues(this.mOutputFileOptions.getContentValues());
                    } else {
                        values = new ContentValues();
                    }
                    setContentValuePending(values, 1);
                    outputUri = this.mOutputFileOptions.getContentResolver().insert(this.mOutputFileOptions.getSaveCollection(), values);
                    if (outputUri == null) {
                        saveError = SaveError.FILE_IO_FAILED;
                        errorMessage = "Failed to insert URI.";
                    } else {
                        if (!copyTempFileToUri(tempFile, outputUri)) {
                            saveError = SaveError.FILE_IO_FAILED;
                            errorMessage = "Failed to save to URI.";
                        }
                        setUriNotPending(outputUri);
                    }
                } else if (isSaveToOutputStream()) {
                    copyTempFileToOutputStream(tempFile, this.mOutputFileOptions.getOutputStream());
                } else if (isSaveToFile()) {
                    File targetFile = this.mOutputFileOptions.getFile();
                    if (targetFile.exists()) {
                        targetFile.delete();
                    }
                    if (!tempFile.renameTo(targetFile)) {
                        saveError = SaveError.FILE_IO_FAILED;
                        errorMessage = "Failed to rename file.";
                    }
                    outputUri = Uri.fromFile(targetFile);
                }
            } finally {
                tempFile.delete();
            }
        } catch (IOException | IllegalArgumentException | SecurityException e) {
            saveError = SaveError.FILE_IO_FAILED;
            errorMessage = "Failed to write destination file.";
            exception = e;
        }
        if (saveError != null) {
            postError(saveError, errorMessage, exception);
        } else {
            postSuccess(outputUri);
        }
    }

    private boolean isSaveToMediaStore() {
        return (this.mOutputFileOptions.getSaveCollection() == null || this.mOutputFileOptions.getContentResolver() == null || this.mOutputFileOptions.getContentValues() == null) ? false : true;
    }

    private boolean isSaveToFile() {
        return this.mOutputFileOptions.getFile() != null;
    }

    private boolean isSaveToOutputStream() {
        return this.mOutputFileOptions.getOutputStream() != null;
    }

    private void setUriNotPending(Uri outputUri) {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentValues values = new ContentValues();
            setContentValuePending(values, 0);
            this.mOutputFileOptions.getContentResolver().update(outputUri, values, null, null);
        }
    }

    private void setContentValuePending(ContentValues values, int isPending) {
        if (Build.VERSION.SDK_INT >= 29) {
            values.put("is_pending", Integer.valueOf(isPending));
        }
    }

    private boolean copyTempFileToUri(File tempFile, Uri uri) throws IOException {
        OutputStream outputStream = this.mOutputFileOptions.getContentResolver().openOutputStream(uri);
        if (outputStream != null) {
            try {
                copyTempFileToOutputStream(tempFile, outputStream);
                if (outputStream != null) {
                    outputStream.close();
                    return true;
                }
                return true;
            } catch (Throwable th) {
                if (outputStream != null) {
                    try {
                        outputStream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
                throw th;
            }
        } else if (outputStream != null) {
            outputStream.close();
            return false;
        } else {
            return false;
        }
    }

    private void copyTempFileToOutputStream(File tempFile, OutputStream outputStream) throws IOException {
        InputStream in = new FileInputStream(tempFile);
        try {
            byte[] buf = new byte[1024];
            while (true) {
                int len = in.read(buf);
                if (len > 0) {
                    outputStream.write(buf, 0, len);
                } else {
                    in.close();
                    return;
                }
            }
        } catch (Throwable th) {
            try {
                in.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    private void postSuccess(final Uri outputUri) {
        try {
            this.mUserCallbackExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageSaver$$ExternalSyntheticLambda2
                @Override // java.lang.Runnable
                public final void run() {
                    ImageSaver.this.m121lambda$postSuccess$1$androidxcameracoreImageSaver(outputUri);
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.e(TAG, "Application executor rejected executing OnImageSavedCallback.onImageSaved callback. Skipping.");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$postSuccess$1$androidx-camera-core-ImageSaver  reason: not valid java name */
    public /* synthetic */ void m121lambda$postSuccess$1$androidxcameracoreImageSaver(Uri outputUri) {
        this.mCallback.onImageSaved(new ImageCapture.OutputFileResults(outputUri));
    }

    private void postError(final SaveError saveError, final String message, final Throwable cause) {
        try {
            this.mUserCallbackExecutor.execute(new Runnable() { // from class: androidx.camera.core.ImageSaver$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    ImageSaver.this.m120lambda$postError$2$androidxcameracoreImageSaver(saveError, message, cause);
                }
            });
        } catch (RejectedExecutionException e) {
            Logger.e(TAG, "Application executor rejected executing OnImageSavedCallback.onError callback. Skipping.");
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$postError$2$androidx-camera-core-ImageSaver  reason: not valid java name */
    public /* synthetic */ void m120lambda$postError$2$androidxcameracoreImageSaver(SaveError saveError, String message, Throwable cause) {
        this.mCallback.onError(saveError, message, cause);
    }
}
