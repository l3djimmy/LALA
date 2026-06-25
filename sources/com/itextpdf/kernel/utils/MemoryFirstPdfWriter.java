package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.WriterProperties;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes12.dex */
class MemoryFirstPdfWriter extends PdfWriter {
    private static final int MAX_ALLOWED_STREAMS = 100;
    private static Map<String, MemoryFirstPdfWriter> waitingStreams = new ConcurrentHashMap();
    private String filePath;
    private ByteArrayOutputStream outStream;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MemoryFirstPdfWriter(String filename, WriterProperties properties) throws FileNotFoundException {
        this(filename, createBAOutputStream(), properties);
    }

    private MemoryFirstPdfWriter(String filename, ByteArrayOutputStream outputStream, WriterProperties properties) {
        super(outputStream, properties);
        setCloseStream(false);
        this.filePath = filename;
        this.outStream = outputStream;
        if (waitingStreams.size() >= 100) {
            throw new RuntimeException("Too many PdfWriter's have been created. Verify that you call CompareTool.cleanup where necessary");
        }
        waitingStreams.put(filename, this);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static MemoryFirstPdfWriter get(String filename) {
        return waitingStreams.get(filename);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void cleanup(String path) {
        if (path == null) {
            throw new IllegalArgumentException("Provided path is null");
        }
        for (String filePath : waitingStreams.keySet()) {
            if (filePath.startsWith(path)) {
                waitingStreams.remove(filePath);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void dump() throws IOException {
        FileOutputStream fos = new FileOutputStream(this.filePath);
        this.outStream.writeTo(fos);
        fos.close();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ByteArrayOutputStream getBAOutputStream() {
        return this.outStream;
    }

    private static ByteArrayOutputStream createBAOutputStream() {
        return new ByteArrayOutputStream();
    }
}
