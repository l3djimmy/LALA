package com.itextpdf.kernel.utils.objectpathitems;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public final class OffsetPathItem extends LocalPathItem {
    private final int offset;

    public OffsetPathItem(int offset) {
        this.offset = offset;
    }

    public int getOffset() {
        return this.offset;
    }

    public String toString() {
        return "Offset: " + this.offset;
    }

    public int hashCode() {
        return this.offset;
    }

    public boolean equals(Object obj) {
        return obj != null && obj.getClass() == getClass() && this.offset == ((OffsetPathItem) obj).offset;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.utils.objectpathitems.LocalPathItem
    public Node toXmlNode(Document document) {
        Element element = document.createElement(TypedValues.CycleType.S_WAVE_OFFSET);
        element.appendChild(document.createTextNode(String.valueOf(this.offset)));
        return element;
    }
}
