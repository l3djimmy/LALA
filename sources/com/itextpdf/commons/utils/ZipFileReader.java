package com.itextpdf.commons.utils;

import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.logs.CommonsLogMessageConstant;
import java.io.BufferedInputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class ZipFileReader implements Closeable {
    private static final Logger LOGGER = LoggerFactory.getLogger(ZipFileReader.class);
    private final ZipFile zipFile;
    private int thresholdSize = 1000000000;
    private int thresholdEntries = 10000;
    private double thresholdRatio = 10.0d;

    public ZipFileReader(String archivePath) throws IOException {
        if (archivePath == null) {
            throw new IOException(CommonsExceptionMessageConstant.FILE_NAME_CAN_NOT_BE_NULL);
        }
        this.zipFile = new ZipFile(archivePath, StandardCharsets.UTF_8);
    }

    public Set<String> getFileNames() throws IOException {
        Set<String> fileNames = new HashSet<>();
        Enumeration<? extends ZipEntry> entries = this.zipFile.entries();
        int totalSizeArchive = 0;
        int totalEntryArchive = 0;
        while (entries.hasMoreElements()) {
            ZipEntry entry = entries.nextElement();
            boolean zipBombSuspicious = false;
            InputStream in = new BufferedInputStream(this.zipFile.getInputStream(entry));
            totalEntryArchive++;
            try {
                byte[] buffer = new byte[2048];
                int totalSizeEntry = 0;
                while (true) {
                    int nBytes = in.read(buffer);
                    if (nBytes <= 0) {
                        break;
                    }
                    totalSizeEntry += nBytes;
                    totalSizeArchive += nBytes;
                    double compressionRatio = totalSizeEntry / entry.getCompressedSize();
                    if (compressionRatio > this.thresholdRatio) {
                        zipBombSuspicious = true;
                        break;
                    }
                }
                if (zipBombSuspicious) {
                    LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.RATIO_IS_HIGHLY_SUSPICIOUS, Double.valueOf(this.thresholdRatio)));
                } else if (totalSizeArchive > this.thresholdSize) {
                    LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.UNCOMPRESSED_DATA_SIZE_IS_TOO_MUCH, Integer.valueOf(this.thresholdSize)));
                } else if (totalEntryArchive > this.thresholdEntries) {
                    LOGGER.warn(MessageFormatUtil.format(CommonsLogMessageConstant.TOO_MUCH_ENTRIES_IN_ARCHIVE, Integer.valueOf(this.thresholdEntries)));
                } else {
                    in.close();
                    if (!entry.isDirectory()) {
                        fileNames.add(entry.getName());
                    }
                }
                in.close();
                break;
            } finally {
            }
        }
        return fileNames;
    }

    public InputStream readFromZip(String fileName) throws IOException {
        if (fileName == null) {
            throw new IOException(CommonsExceptionMessageConstant.FILE_NAME_CAN_NOT_BE_NULL);
        }
        ZipEntry entry = this.zipFile.getEntry(fileName);
        if (entry == null || entry.isDirectory()) {
            throw new IOException(MessageFormatUtil.format(CommonsExceptionMessageConstant.ZIP_ENTRY_NOT_FOUND, fileName));
        }
        return this.zipFile.getInputStream(entry);
    }

    public void setThresholdSize(int thresholdSize) {
        this.thresholdSize = thresholdSize;
    }

    public void setThresholdEntries(int thresholdEntries) {
        this.thresholdEntries = thresholdEntries;
    }

    public void setThresholdRatio(double thresholdRatio) {
        this.thresholdRatio = thresholdRatio;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.zipFile.close();
    }
}
