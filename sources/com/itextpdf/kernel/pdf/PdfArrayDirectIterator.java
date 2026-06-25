package com.itextpdf.kernel.pdf;

import java.util.Iterator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PdfArrayDirectIterator implements Iterator<PdfObject> {
    Iterator<PdfObject> array;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfArrayDirectIterator(List<PdfObject> array) {
        this.array = array.iterator();
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        return this.array.hasNext();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // java.util.Iterator
    public PdfObject next() {
        PdfObject obj = this.array.next();
        if (obj.isIndirectReference()) {
            return ((PdfIndirectReference) obj).getRefersTo(true);
        }
        return obj;
    }

    @Override // java.util.Iterator
    public void remove() {
        this.array.remove();
    }
}
