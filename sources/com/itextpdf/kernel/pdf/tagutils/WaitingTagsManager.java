package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.tagging.IStructureNode;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public class WaitingTagsManager {
    private Map<Object, PdfStructElem> associatedObjToWaitingTag = new HashMap();
    private Map<PdfDictionary, Object> waitingTagToAssociatedObj = new HashMap();

    public Object assignWaitingState(TagTreePointer pointerToTag, Object associatedObj) {
        if (associatedObj == null) {
            throw new IllegalArgumentException("Passed associated object can not be null.");
        }
        return saveAssociatedObjectForWaitingTag(associatedObj, pointerToTag.getCurrentStructElem());
    }

    public boolean isObjectAssociatedWithWaitingTag(Object obj) {
        if (obj == null) {
            throw new IllegalArgumentException("Passed associated object can not be null.");
        }
        return this.associatedObjToWaitingTag.containsKey(obj);
    }

    public boolean tryMovePointerToWaitingTag(TagTreePointer tagPointer, Object associatedObject) {
        PdfStructElem waitingStructElem;
        if (associatedObject == null || (waitingStructElem = this.associatedObjToWaitingTag.get(associatedObject)) == null) {
            return false;
        }
        tagPointer.setCurrentStructElem(waitingStructElem);
        return true;
    }

    public boolean removeWaitingState(Object associatedObject) {
        if (associatedObject == null) {
            return false;
        }
        PdfStructElem structElem = this.associatedObjToWaitingTag.remove(associatedObject);
        removeWaitingStateAndFlushIfParentFlushed(structElem);
        return structElem != null;
    }

    public void removeAllWaitingStates() {
        for (PdfStructElem structElem : this.associatedObjToWaitingTag.values()) {
            removeWaitingStateAndFlushIfParentFlushed(structElem);
        }
        this.associatedObjToWaitingTag.clear();
    }

    PdfStructElem getStructForObj(Object associatedObj) {
        return this.associatedObjToWaitingTag.get(associatedObj);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Object getObjForStructDict(PdfDictionary structDict) {
        return this.waitingTagToAssociatedObj.get(structDict);
    }

    Object saveAssociatedObjectForWaitingTag(Object associatedObj, PdfStructElem structElem) {
        this.associatedObjToWaitingTag.put(associatedObj, structElem);
        return this.waitingTagToAssociatedObj.put(structElem.getPdfObject(), associatedObj);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IStructureNode flushTag(PdfStructElem tagStruct) {
        Object associatedObj = this.waitingTagToAssociatedObj.remove(tagStruct.getPdfObject());
        if (associatedObj != null) {
            this.associatedObjToWaitingTag.remove(associatedObj);
        }
        IStructureNode parent = tagStruct.getParent();
        flushStructElementAndItKids(tagStruct);
        return parent;
    }

    private void flushStructElementAndItKids(PdfStructElem elem) {
        if (this.waitingTagToAssociatedObj.containsKey(elem.getPdfObject())) {
            return;
        }
        for (IStructureNode kid : elem.getKids()) {
            if (kid instanceof PdfStructElem) {
                flushStructElementAndItKids((PdfStructElem) kid);
            }
        }
        elem.flush();
    }

    private void removeWaitingStateAndFlushIfParentFlushed(PdfStructElem structElem) {
        if (structElem != null) {
            this.waitingTagToAssociatedObj.remove(structElem.getPdfObject());
            IStructureNode parent = structElem.getParent();
            if ((parent instanceof PdfStructElem) && ((PdfStructElem) parent).isFlushed()) {
                flushStructElementAndItKids(structElem);
            }
        }
    }
}
