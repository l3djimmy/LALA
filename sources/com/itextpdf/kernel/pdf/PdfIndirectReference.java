package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.utils.ICopyFilter;
/* loaded from: classes12.dex */
public class PdfIndirectReference extends PdfObject implements Comparable<PdfIndirectReference> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int LENGTH_OF_INDIRECTS_CHAIN = 31;
    protected int genNr;
    protected final int objNr;
    protected int objectStreamNumber;
    protected long offsetOrIndex;
    protected PdfDocument pdfDocument;
    protected PdfObject refersTo;

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfIndirectReference(PdfDocument doc, int objNr) {
        this(doc, objNr, 0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfIndirectReference(PdfDocument doc, int objNr, int genNr) {
        this.refersTo = null;
        this.objectStreamNumber = 0;
        this.offsetOrIndex = 0L;
        this.pdfDocument = null;
        this.pdfDocument = doc;
        this.objNr = objNr;
        this.genNr = genNr;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfIndirectReference(PdfDocument doc, int objNr, int genNr, long offset) {
        this.refersTo = null;
        this.objectStreamNumber = 0;
        this.offsetOrIndex = 0L;
        this.pdfDocument = null;
        this.pdfDocument = doc;
        this.objNr = objNr;
        this.genNr = genNr;
        this.offsetOrIndex = offset;
        if (offset < 0) {
            throw new AssertionError();
        }
    }

    public int getObjNumber() {
        return this.objNr;
    }

    public int getGenNumber() {
        return this.genNr;
    }

    public PdfObject getRefersTo() {
        return getRefersTo(true);
    }

    public PdfObject getRefersTo(boolean recursively) {
        if (!recursively) {
            if (this.refersTo == null && !checkState((short) 1) && !checkState((short) 8) && !checkState((short) 2) && getReader() != null) {
                this.refersTo = getReader().readObject(this);
            }
            return this.refersTo;
        }
        PdfObject currentRefersTo = getRefersTo(false);
        for (int i = 0; i < 31 && (currentRefersTo instanceof PdfIndirectReference); i++) {
            currentRefersTo = ((PdfIndirectReference) currentRefersTo).getRefersTo(false);
        }
        return currentRefersTo;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setRefersTo(PdfObject refersTo) {
        this.refersTo = refersTo;
    }

    public int getObjStreamNumber() {
        return this.objectStreamNumber;
    }

    public long getOffset() {
        if (this.objectStreamNumber == 0) {
            return this.offsetOrIndex;
        }
        return -1L;
    }

    public int getIndex() {
        if (this.objectStreamNumber == 0) {
            return -1;
        }
        return (int) this.offsetOrIndex;
    }

    public boolean equals(Object o) {
        boolean documentsEquals;
        boolean z;
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        PdfIndirectReference that = (PdfIndirectReference) o;
        if (this.pdfDocument == that.pdfDocument) {
            documentsEquals = true;
        } else {
            documentsEquals = false;
        }
        if (!documentsEquals) {
            if (this.pdfDocument != null && that.pdfDocument != null && this.pdfDocument.getDocumentId() == that.pdfDocument.getDocumentId()) {
                z = true;
            } else {
                z = false;
            }
            documentsEquals = z;
        }
        if (this.objNr == that.objNr && this.genNr == that.genNr && documentsEquals) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        int result = (this.objNr * 31) + this.genNr;
        if (this.pdfDocument != null) {
            return (result * 31) + ((int) this.pdfDocument.getDocumentId());
        }
        return result;
    }

    @Override // java.lang.Comparable
    public int compareTo(PdfIndirectReference o) {
        if (this.objNr != o.objNr) {
            return this.objNr > o.objNr ? 1 : -1;
        } else if (this.genNr == o.genNr) {
            return comparePdfDocumentLinks(o);
        } else {
            return this.genNr > o.genNr ? 1 : -1;
        }
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 5;
    }

    public PdfDocument getDocument() {
        return this.pdfDocument;
    }

    public void setFree() {
        getDocument().getXref().freeReference(this);
    }

    public boolean isFree() {
        return checkState((short) 2);
    }

    public String toString() {
        StringBuilder states = new StringBuilder(" ");
        if (checkState((short) 2)) {
            states.append("Free; ");
        }
        if (checkState((short) 8)) {
            states.append("Modified; ");
        }
        if (checkState((short) 32)) {
            states.append("MustBeFlushed; ");
        }
        if (checkState((short) 4)) {
            states.append("Reading; ");
        }
        if (checkState((short) 1)) {
            states.append("Flushed; ");
        }
        if (checkState((short) 16)) {
            states.append("OriginalObjectStream; ");
        }
        if (checkState((short) 128)) {
            states.append("ForbidRelease; ");
        }
        if (checkState((short) 256)) {
            states.append("ReadOnly; ");
        }
        return MessageFormatUtil.format("{0} {1} R{2}", Integer.toString(getObjNumber()), Integer.toString(getGenNumber()), states.substring(0, states.length() - 1));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfWriter getWriter() {
        if (getDocument() != null) {
            return getDocument().getWriter();
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfReader getReader() {
        if (getDocument() != null) {
            return getDocument().getReader();
        }
        return null;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected PdfObject newInstance() {
        return PdfNull.PDF_NULL;
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject setState(short state) {
        return super.setState(state);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setObjStreamNumber(int objectStreamNumber) {
        this.objectStreamNumber = objectStreamNumber;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setIndex(long index) {
        this.offsetOrIndex = index;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOffset(long offset) {
        this.offsetOrIndex = offset;
        this.objectStreamNumber = 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void fixOffset(long offset) {
        if (!isFree()) {
            this.offsetOrIndex = offset;
        }
    }

    private int comparePdfDocumentLinks(PdfIndirectReference toCompare) {
        if (this.pdfDocument == toCompare.pdfDocument) {
            return 0;
        }
        if (this.pdfDocument == null) {
            return -1;
        }
        if (toCompare.pdfDocument == null) {
            return 1;
        }
        long thisDocumentId = this.pdfDocument.getDocumentId();
        long documentIdToCompare = toCompare.pdfDocument.getDocumentId();
        if (thisDocumentId == documentIdToCompare) {
            return 0;
        }
        return thisDocumentId > documentIdToCompare ? 1 : -1;
    }
}
