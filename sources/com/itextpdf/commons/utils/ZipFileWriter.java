package com.itextpdf.commons.utils;

import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import java.io.Closeable;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
/* loaded from: classes12.dex */
public class ZipFileWriter implements Closeable {
    private final ZipOutputStream outputStream;

    /* JADX INFO: Access modifiers changed from: private */
    @FunctionalInterface
    /* loaded from: classes12.dex */
    public interface ZipWriter {
        void write(ZipOutputStream zipOutputStream) throws IOException;
    }

    public ZipFileWriter(String archivePath) throws IOException {
        if (archivePath == null) {
            throw new IOException(CommonsExceptionMessageConstant.FILE_NAME_CAN_NOT_BE_NULL);
        }
        if (FileUtil.isFileNotEmpty(archivePath) || FileUtil.directoryExists(archivePath)) {
            throw new IOException(MessageFormatUtil.format(CommonsExceptionMessageConstant.FILE_NAME_ALREADY_EXIST, archivePath));
        }
        this.outputStream = new ZipOutputStream(FileUtil.getFileOutputStream(archivePath), StandardCharsets.UTF_8);
        this.outputStream.setMethod(8);
        this.outputStream.setLevel(9);
    }

    public void addEntry(String fileName, File file) throws IOException {
        if (file == null) {
            throw new IOException(CommonsExceptionMessageConstant.FILE_SHOULD_EXIST);
        }
        addEntry(fileName, Files.newInputStream(file.toPath(), new OpenOption[0]));
    }

    public void addEntry(String fileName, final InputStream inputStream) throws IOException {
        if (inputStream == null) {
            throw new IOException(CommonsExceptionMessageConstant.STREAM_CAN_NOT_BE_NULL);
        }
        addEntryToZip(fileName, new ZipWriter() { // from class: com.itextpdf.commons.utils.ZipFileWriter$$ExternalSyntheticLambda1
            @Override // com.itextpdf.commons.utils.ZipFileWriter.ZipWriter
            public final void write(ZipOutputStream zipOutputStream) {
                ZipFileWriter.lambda$addEntry$0(inputStream, zipOutputStream);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$addEntry$0(InputStream inputStream, ZipOutputStream zos) throws IOException {
        byte[] bytes = new byte[1024];
        while (true) {
            int length = inputStream.read(bytes);
            if (length > 0) {
                zos.write(bytes, 0, length);
            } else {
                return;
            }
        }
    }

    public void addJsonEntry(String fileName, final Object objectToAdd) throws IOException {
        if (objectToAdd == null) {
            throw new IOException(CommonsExceptionMessageConstant.JSON_OBJECT_CAN_NOT_BE_NULL);
        }
        addEntryToZip(fileName, new ZipWriter() { // from class: com.itextpdf.commons.utils.ZipFileWriter$$ExternalSyntheticLambda0
            @Override // com.itextpdf.commons.utils.ZipFileWriter.ZipWriter
            public final void write(ZipOutputStream zipOutputStream) {
                JsonUtil.serializeToStream(zipOutputStream, objectToAdd);
            }
        });
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.outputStream.close();
    }

    private void addEntryToZip(String fileName, ZipWriter writer) throws IOException {
        if (fileName == null) {
            throw new IOException(CommonsExceptionMessageConstant.FILE_NAME_SHOULD_BE_UNIQUE);
        }
        ZipEntry zipEntry = new ZipEntry(fileName);
        this.outputStream.putNextEntry(zipEntry);
        writer.write(this.outputStream);
    }
}
