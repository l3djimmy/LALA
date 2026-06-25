package com.itextpdf.kernel.utils;

import com.itextpdf.kernel.pdf.IPdfPageExtraCopier;
import com.itextpdf.kernel.pdf.PdfDocument;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfMerger {
    private PdfDocument pdfDocument;
    private PdfMergerProperties properties;

    public PdfMerger(PdfDocument pdfDocument) {
        this(pdfDocument, true, true);
    }

    @Deprecated
    public PdfMerger(PdfDocument pdfDocument, boolean mergeTags, boolean mergeOutlines) {
        this.pdfDocument = pdfDocument;
        this.properties = new PdfMergerProperties();
        this.properties.setMergeTags(mergeTags).setMergeOutlines(mergeOutlines);
    }

    public PdfMerger(PdfDocument pdfDocument, PdfMergerProperties properties) {
        this.pdfDocument = pdfDocument;
        this.properties = properties != null ? properties : new PdfMergerProperties();
    }

    public PdfMerger setCloseSourceDocuments(boolean closeSourceDocuments) {
        this.properties.setCloseSrcDocuments(closeSourceDocuments);
        return this;
    }

    public PdfMerger merge(PdfDocument from, int fromPage, int toPage) {
        List<Integer> pages = new ArrayList<>(toPage - fromPage);
        for (int pageNum = fromPage; pageNum <= toPage; pageNum++) {
            pages.add(Integer.valueOf(pageNum));
        }
        return merge(from, pages);
    }

    public PdfMerger merge(PdfDocument from, List<Integer> pages) {
        return merge(from, pages, (IPdfPageExtraCopier) null);
    }

    public PdfMerger merge(PdfDocument from, List<Integer> pages, IPdfPageExtraCopier copier) {
        if (this.properties.isMergeTags() && from.isTagged()) {
            this.pdfDocument.setTagged();
        }
        if (this.properties.isMergeOutlines() && from.hasOutlines()) {
            this.pdfDocument.initializeOutlines();
        }
        if (this.properties.isMergeScripts()) {
            PdfScriptMerger.mergeScripts(from, this.pdfDocument);
        }
        from.copyPagesTo(pages, this.pdfDocument, copier);
        if (this.properties.isCloseSrcDocuments()) {
            from.close();
        }
        return this;
    }

    public void close() {
        this.pdfDocument.close();
    }
}
