package com.itextpdf.kernel.utils;
/* loaded from: classes12.dex */
public class PdfMergerProperties {
    private boolean closeSrcDocuments = false;
    private boolean mergeTags = true;
    private boolean mergeOutlines = true;
    private boolean mergeScripts = false;

    public boolean isCloseSrcDocuments() {
        return this.closeSrcDocuments;
    }

    public boolean isMergeTags() {
        return this.mergeTags;
    }

    public boolean isMergeOutlines() {
        return this.mergeOutlines;
    }

    public boolean isMergeScripts() {
        return this.mergeScripts;
    }

    public PdfMergerProperties setCloseSrcDocuments(boolean closeSrcDocuments) {
        this.closeSrcDocuments = closeSrcDocuments;
        return this;
    }

    public PdfMergerProperties setMergeTags(boolean mergeTags) {
        this.mergeTags = mergeTags;
        return this;
    }

    public PdfMergerProperties setMergeOutlines(boolean mergeOutlines) {
        this.mergeOutlines = mergeOutlines;
        return this;
    }

    public PdfMergerProperties setMergeScripts(boolean mergeNames) {
        this.mergeScripts = mergeNames;
        return this;
    }
}
