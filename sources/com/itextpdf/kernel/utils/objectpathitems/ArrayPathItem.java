package com.itextpdf.kernel.utils.objectpathitems;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public final class ArrayPathItem extends LocalPathItem {
    private final int index;

    public ArrayPathItem(int index) {
        this.index = index;
    }

    public String toString() {
        return "Array index: " + this.index;
    }

    public int hashCode() {
        return this.index;
    }

    public boolean equals(Object obj) {
        return obj != null && obj.getClass() == getClass() && this.index == ((ArrayPathItem) obj).index;
    }

    public int getIndex() {
        return this.index;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.objectpathitems.LocalPathItem
    public Node toXmlNode(Document document) {
        Element element = document.createElement("arrayIndex");
        element.appendChild(document.createTextNode(String.valueOf(this.index)));
        return element;
    }
}
