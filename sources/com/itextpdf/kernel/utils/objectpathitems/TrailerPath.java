package com.itextpdf.kernel.utils.objectpathitems;

import com.itextpdf.kernel.pdf.PdfDocument;
import java.util.Iterator;
import java.util.Stack;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public final class TrailerPath extends ObjectPath {
    private static final String INITIAL_LINE = "Base cmp object: trailer. Base out object: trailer";
    private final PdfDocument cmpDocument;
    private final PdfDocument outDocument;

    public TrailerPath(PdfDocument cmpDoc, PdfDocument outDoc) {
        this.outDocument = outDoc;
        this.cmpDocument = cmpDoc;
    }

    public TrailerPath(TrailerPath trailerPath) {
        this.outDocument = trailerPath.getOutDocument();
        this.cmpDocument = trailerPath.getCmpDocument();
        this.path = trailerPath.getLocalPath();
    }

    public TrailerPath(PdfDocument cmpDoc, PdfDocument outDoc, Stack<LocalPathItem> path) {
        this.outDocument = outDoc;
        this.cmpDocument = cmpDoc;
        this.path = path;
    }

    public PdfDocument getOutDocument() {
        return this.outDocument;
    }

    public PdfDocument getCmpDocument() {
        return this.cmpDocument;
    }

    @Override // com.itextpdf.kernel.utils.objectpathitems.ObjectPath
    public Node toXmlNode(Document document) {
        Element element = document.createElement("path");
        Element baseNode = document.createElement("base");
        baseNode.setAttribute("cmp", "trailer");
        baseNode.setAttribute("out", "trailer");
        element.appendChild(baseNode);
        Iterator<LocalPathItem> it = this.path.iterator();
        while (it.hasNext()) {
            LocalPathItem pathItem = it.next();
            element.appendChild(pathItem.toXmlNode(document));
        }
        return element;
    }

    @Override // com.itextpdf.kernel.utils.objectpathitems.ObjectPath
    public String toString() {
        StringBuilder sb = new StringBuilder(INITIAL_LINE.length());
        sb.append(INITIAL_LINE);
        Iterator<LocalPathItem> it = this.path.iterator();
        while (it.hasNext()) {
            LocalPathItem pathItem = it.next();
            sb.append('\n');
            sb.append(pathItem.toString());
        }
        return sb.toString();
    }

    @Override // com.itextpdf.kernel.utils.objectpathitems.ObjectPath
    public int hashCode() {
        int hashCode = (this.outDocument.hashCode() * 31) + this.cmpDocument.hashCode();
        Iterator<LocalPathItem> it = this.path.iterator();
        while (it.hasNext()) {
            LocalPathItem pathItem = it.next();
            hashCode = (hashCode * 31) + pathItem.hashCode();
        }
        return hashCode;
    }

    @Override // com.itextpdf.kernel.utils.objectpathitems.ObjectPath
    public boolean equals(Object obj) {
        return obj != null && obj.getClass() == getClass() && this.outDocument.equals(((TrailerPath) obj).outDocument) && this.cmpDocument.equals(((TrailerPath) obj).cmpDocument) && this.path.equals(((ObjectPath) obj).path);
    }
}
