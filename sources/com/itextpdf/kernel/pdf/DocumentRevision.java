package com.itextpdf.kernel.pdf;

import java.util.Set;
/* loaded from: classes12.dex */
public class DocumentRevision {
    private final long eofOffset;
    private final Set<PdfIndirectReference> modifiedObjects;

    public DocumentRevision(long eofOffset, Set<PdfIndirectReference> modifiedObjects) {
        this.eofOffset = eofOffset;
        this.modifiedObjects = modifiedObjects;
    }

    public long getEofOffset() {
        return this.eofOffset;
    }

    public Set<PdfIndirectReference> getModifiedObjects() {
        return this.modifiedObjects;
    }
}
