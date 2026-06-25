package com.itextpdf.kernel.utils.objectpathitems;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
/* loaded from: classes12.dex */
public class ObjectPath {
    private PdfIndirectReference baseCmpObject;
    private PdfIndirectReference baseOutObject;
    private Stack<IndirectPathItem> indirects;
    protected Stack<LocalPathItem> path;

    public ObjectPath() {
        this.path = new Stack<>();
        this.indirects = new Stack<>();
    }

    public ObjectPath(ObjectPath objectPath) {
        this.path = new Stack<>();
        this.indirects = new Stack<>();
        this.baseCmpObject = objectPath.getBaseCmpObject();
        this.baseOutObject = objectPath.getBaseOutObject();
        this.path = objectPath.getLocalPath();
        this.indirects = objectPath.getIndirectPath();
    }

    public ObjectPath(PdfIndirectReference baseCmpObject, PdfIndirectReference baseOutObject) {
        this.path = new Stack<>();
        this.indirects = new Stack<>();
        this.baseCmpObject = baseCmpObject;
        this.baseOutObject = baseOutObject;
        this.indirects.push(new IndirectPathItem(baseCmpObject, baseOutObject));
    }

    public ObjectPath(PdfIndirectReference baseCmpObject, PdfIndirectReference baseOutObject, Stack<LocalPathItem> path, Stack<IndirectPathItem> indirects) {
        this.path = new Stack<>();
        this.indirects = new Stack<>();
        this.baseCmpObject = baseCmpObject;
        this.baseOutObject = baseOutObject;
        this.path = (Stack) path.clone();
        this.indirects = (Stack) indirects.clone();
    }

    public ObjectPath resetDirectPath(PdfIndirectReference baseCmpObject, PdfIndirectReference baseOutObject) {
        ObjectPath newPath = new ObjectPath(baseCmpObject, baseOutObject, new Stack(), (Stack) this.indirects.clone());
        newPath.indirects.push(new IndirectPathItem(baseCmpObject, baseOutObject));
        return newPath;
    }

    public boolean isComparing(PdfIndirectReference cmpObject, PdfIndirectReference outObject) {
        return this.indirects.contains(new IndirectPathItem(cmpObject, outObject));
    }

    public void pushArrayItemToPath(int index) {
        this.path.push(new ArrayPathItem(index));
    }

    public void pushDictItemToPath(PdfName key) {
        this.path.push(new DictPathItem(key));
    }

    public void pushOffsetToPath(int offset) {
        this.path.push(new OffsetPathItem(offset));
    }

    public void pop() {
        this.path.pop();
    }

    public Stack<LocalPathItem> getLocalPath() {
        return (Stack) this.path.clone();
    }

    public Stack<IndirectPathItem> getIndirectPath() {
        return (Stack) this.indirects.clone();
    }

    public PdfIndirectReference getBaseCmpObject() {
        return this.baseCmpObject;
    }

    public PdfIndirectReference getBaseOutObject() {
        return this.baseOutObject;
    }

    public Node toXmlNode(Document document) {
        Element element = document.createElement("path");
        Element baseNode = document.createElement("base");
        baseNode.setAttribute("cmp", MessageFormatUtil.format("{0} {1} obj", Integer.valueOf(this.baseCmpObject.getObjNumber()), Integer.valueOf(this.baseCmpObject.getGenNumber())));
        baseNode.setAttribute("out", MessageFormatUtil.format("{0} {1} obj", Integer.valueOf(this.baseOutObject.getObjNumber()), Integer.valueOf(this.baseOutObject.getGenNumber())));
        element.appendChild(baseNode);
        Stack<LocalPathItem> pathClone = (Stack) this.path.clone();
        List<LocalPathItem> localPathItems = new ArrayList<>(this.path.size());
        for (int i = 0; i < this.path.size(); i++) {
            localPathItems.add(pathClone.pop());
        }
        int i2 = localPathItems.size();
        for (int i3 = i2 - 1; i3 >= 0; i3--) {
            element.appendChild(localPathItems.get(i3).toXmlNode(document));
        }
        return element;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(MessageFormatUtil.format("Base cmp object: {0} obj. Base out object: {1} obj", this.baseCmpObject, this.baseOutObject));
        Stack<LocalPathItem> pathClone = (Stack) this.path.clone();
        List<LocalPathItem> localPathItems = new ArrayList<>(this.path.size());
        for (int i = 0; i < this.path.size(); i++) {
            localPathItems.add(pathClone.pop());
        }
        int i2 = localPathItems.size();
        for (int i3 = i2 - 1; i3 >= 0; i3--) {
            sb.append('\n');
            sb.append(localPathItems.get(i3).toString());
        }
        return sb.toString();
    }

    public int hashCode() {
        int baseCmpObjectHashCode = 0;
        if (this.baseCmpObject != null) {
            baseCmpObjectHashCode = (this.baseCmpObject.getObjNumber() * 31) + this.baseCmpObject.getGenNumber();
        }
        int baseOutObjectHashCode = 0;
        if (this.baseOutObject != null) {
            baseOutObjectHashCode = (this.baseOutObject.getObjNumber() * 31) + this.baseOutObject.getGenNumber();
        }
        int hashCode = (baseCmpObjectHashCode * 31) + baseOutObjectHashCode;
        Iterator<LocalPathItem> it = this.path.iterator();
        while (it.hasNext()) {
            LocalPathItem pathItem = it.next();
            hashCode = (hashCode * 31) + pathItem.hashCode();
        }
        return hashCode;
    }

    public boolean equals(Object obj) {
        boolean isBaseCmpObjectEqual;
        boolean isBaseOutObjectEqual;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ObjectPath that = (ObjectPath) obj;
        if (this.baseCmpObject == that.baseCmpObject) {
            isBaseCmpObjectEqual = true;
        } else if (this.baseCmpObject == null || that.baseCmpObject == null || this.baseCmpObject.getClass() != that.baseCmpObject.getClass()) {
            isBaseCmpObjectEqual = false;
        } else if (this.baseCmpObject.getObjNumber() == that.baseCmpObject.getObjNumber() && this.baseCmpObject.getGenNumber() == that.baseCmpObject.getGenNumber()) {
            isBaseCmpObjectEqual = true;
        } else {
            isBaseCmpObjectEqual = false;
        }
        if (this.baseOutObject == that.baseOutObject) {
            isBaseOutObjectEqual = true;
        } else if (this.baseOutObject == null || that.baseOutObject == null || this.baseOutObject.getClass() != that.baseOutObject.getClass()) {
            isBaseOutObjectEqual = false;
        } else if (this.baseOutObject.getObjNumber() == that.baseOutObject.getObjNumber() && this.baseOutObject.getGenNumber() == that.baseOutObject.getGenNumber()) {
            isBaseOutObjectEqual = true;
        } else {
            isBaseOutObjectEqual = false;
        }
        if (isBaseCmpObjectEqual && isBaseOutObjectEqual && this.path.equals(((ObjectPath) obj).path)) {
            return true;
        }
        return false;
    }
}
