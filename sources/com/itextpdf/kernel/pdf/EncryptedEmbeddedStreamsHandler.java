package com.itextpdf.kernel.pdf;

import java.util.HashSet;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class EncryptedEmbeddedStreamsHandler {
    private final PdfDocument document;
    private final Set<PdfStream> embeddedStreams = new HashSet();

    /* JADX INFO: Access modifiers changed from: package-private */
    public EncryptedEmbeddedStreamsHandler(PdfDocument document) {
        this.document = document;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void storeAllEmbeddedStreams() {
        PdfStream embeddedStream;
        for (int i = 0; i < this.document.getNumberOfPdfObjects(); i++) {
            PdfObject indirectObject = this.document.getPdfObject(i);
            if ((indirectObject instanceof PdfDictionary) && (embeddedStream = getEmbeddedFileStreamFromDictionary((PdfDictionary) indirectObject)) != null) {
                storeEmbeddedStream(embeddedStream);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void storeEmbeddedStream(PdfStream embeddedStream) {
        this.embeddedStreams.add(embeddedStream);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isStreamStoredAsEmbedded(PdfStream stream) {
        return this.embeddedStreams.contains(stream);
    }

    private static PdfStream getEmbeddedFileStreamFromDictionary(PdfDictionary dictionary) {
        PdfDictionary embeddedFileDictionary = dictionary.getAsDictionary(PdfName.EF);
        if (PdfName.Filespec.equals(dictionary.getAsName(PdfName.Type)) && embeddedFileDictionary != null) {
            return embeddedFileDictionary.getAsStream(PdfName.F);
        }
        return null;
    }
}
