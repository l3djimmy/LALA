package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.pdf.filters.IFilterHandler;
import java.io.ByteArrayOutputStream;
/* loaded from: classes12.dex */
public abstract class MemoryLimitsAwareFilter implements IFilterHandler {
    public ByteArrayOutputStream enableMemoryLimitsAwareHandler(PdfDictionary streamDictionary) {
        MemoryLimitsAwareHandler memoryLimitsAwareHandler;
        MemoryLimitsAwareOutputStream outputStream = new MemoryLimitsAwareOutputStream();
        if (streamDictionary.getIndirectReference() != null) {
            memoryLimitsAwareHandler = streamDictionary.getIndirectReference().getDocument().memoryLimitsAwareHandler;
        } else {
            memoryLimitsAwareHandler = new MemoryLimitsAwareHandler();
        }
        if (memoryLimitsAwareHandler != null && memoryLimitsAwareHandler.considerCurrentPdfStream) {
            outputStream.setMaxStreamSize(memoryLimitsAwareHandler.getMaxSizeOfSingleDecompressedPdfStream());
        }
        return outputStream;
    }
}
