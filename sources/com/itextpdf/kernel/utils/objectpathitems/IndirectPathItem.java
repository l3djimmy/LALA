package com.itextpdf.kernel.utils.objectpathitems;

import com.itextpdf.kernel.pdf.PdfIndirectReference;
/* loaded from: classes12.dex */
public final class IndirectPathItem {
    private final PdfIndirectReference cmpObject;
    private final PdfIndirectReference outObject;

    public IndirectPathItem(PdfIndirectReference cmpObject, PdfIndirectReference outObject) {
        this.cmpObject = cmpObject;
        this.outObject = outObject;
    }

    public PdfIndirectReference getCmpObject() {
        return this.cmpObject;
    }

    public PdfIndirectReference getOutObject() {
        return this.outObject;
    }

    public int hashCode() {
        return (this.cmpObject.hashCode() * 31) + this.outObject.hashCode();
    }

    public boolean equals(Object obj) {
        return obj != null && obj.getClass() == getClass() && this.cmpObject.equals(((IndirectPathItem) obj).cmpObject) && this.outObject.equals(((IndirectPathItem) obj).outObject);
    }
}
