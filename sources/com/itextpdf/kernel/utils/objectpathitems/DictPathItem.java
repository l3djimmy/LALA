package com.itextpdf.kernel.utils.objectpathitems;

import com.itextpdf.kernel.pdf.PdfName;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public final class DictPathItem extends LocalPathItem {
    private final PdfName key;

    public DictPathItem(PdfName key) {
        this.key = key;
    }

    public String toString() {
        return "Dict key: " + this.key;
    }

    public int hashCode() {
        return this.key.hashCode();
    }

    public boolean equals(Object obj) {
        return obj != null && obj.getClass() == getClass() && this.key.equals(((DictPathItem) obj).key);
    }

    public PdfName getKey() {
        return this.key;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.objectpathitems.LocalPathItem
    public Node toXmlNode(Document document) {
        Element element = document.createElement("dictKey");
        element.appendChild(document.createTextNode(this.key.toString()));
        return element;
    }
}
