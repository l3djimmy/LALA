package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.source.RASInputStream;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.WindowRandomAccessSource;
import com.itextpdf.kernel.pdf.PdfReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public class PdfRevisionsReader {
    private List<DocumentRevision> documentRevisions = null;
    private final PdfReader reader;

    public PdfRevisionsReader(PdfReader reader) {
        this.reader = reader;
    }

    public List<DocumentRevision> getAllRevisions() throws IOException {
        if (this.documentRevisions == null) {
            RandomAccessFileOrArray raf = this.reader.getSafeFile();
            WindowRandomAccessSource source = new WindowRandomAccessSource(raf.createSourceView(), 0L, raf.length());
            InputStream inputStream = new RASInputStream(source);
            try {
                PdfReader newReader = new PdfReader(inputStream);
                PdfDocument newDocument = new PdfDocument(newReader);
                try {
                    newDocument.getXref().unmarkReadingCompleted();
                    newDocument.getXref().clearAllReferences();
                    RevisionsXrefProcessor xrefProcessor = new RevisionsXrefProcessor();
                    newReader.setXrefProcessor(xrefProcessor);
                    newReader.readXref();
                    this.documentRevisions = xrefProcessor.getDocumentRevisions();
                    newDocument.close();
                    newReader.close();
                    inputStream.close();
                    Collections.reverse(this.documentRevisions);
                } finally {
                }
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    try {
                        inputStream.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        }
        return this.documentRevisions;
    }

    /* loaded from: classes12.dex */
    static class RevisionsXrefProcessor extends PdfReader.XrefProcessor {
        private final List<DocumentRevision> documentRevisions = new ArrayList();

        RevisionsXrefProcessor() {
        }

        @Override // com.itextpdf.kernel.pdf.PdfReader.XrefProcessor
        void processXref(PdfXrefTable xrefTable, PdfTokenizer tokenizer) throws IOException {
            Set<PdfIndirectReference> modifiedObjects = new HashSet<>();
            for (int i = 0; i < xrefTable.size(); i++) {
                if (xrefTable.get(i) != null) {
                    modifiedObjects.add(xrefTable.get(i));
                }
            }
            long eofOffset = tokenizer.getNextEof();
            this.documentRevisions.add(new DocumentRevision(eofOffset, modifiedObjects));
            xrefTable.clearAllReferences();
        }

        List<DocumentRevision> getDocumentRevisions() {
            return this.documentRevisions;
        }
    }
}
