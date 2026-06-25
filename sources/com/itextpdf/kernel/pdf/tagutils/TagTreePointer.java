package com.itextpdf.kernel.pdf.tagutils;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfStream;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.tagging.IStructureNode;
import com.itextpdf.kernel.pdf.tagging.PdfMcr;
import com.itextpdf.kernel.pdf.tagging.PdfMcrDictionary;
import com.itextpdf.kernel.pdf.tagging.PdfMcrNumber;
import com.itextpdf.kernel.pdf.tagging.PdfNamespace;
import com.itextpdf.kernel.pdf.tagging.PdfObjRef;
import com.itextpdf.kernel.pdf.tagging.PdfStructElem;
import com.itextpdf.kernel.pdf.tagging.PdfStructTreeRoot;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class TagTreePointer {
    private static final String MCR_MARKER = "MCR";
    private PdfStream contentStream;
    private PdfNamespace currentNamespace;
    private PdfPage currentPage;
    private PdfStructElem currentStructElem;
    private int nextNewKidIndex = -1;
    private TagStructureContext tagStructureContext;

    public TagTreePointer(PdfDocument document) {
        this.tagStructureContext = document.getTagStructureContext();
        setCurrentStructElem(this.tagStructureContext.getRootTag());
        setNamespaceForNewTags(this.tagStructureContext.getDocumentDefaultNamespace());
    }

    public TagTreePointer(TagTreePointer tagPointer) {
        this.tagStructureContext = tagPointer.tagStructureContext;
        setCurrentStructElem(tagPointer.getCurrentStructElem());
        this.currentPage = tagPointer.currentPage;
        this.contentStream = tagPointer.contentStream;
        this.currentNamespace = tagPointer.currentNamespace;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TagTreePointer(PdfStructElem structElem, PdfDocument document) {
        this.tagStructureContext = document.getTagStructureContext();
        setCurrentStructElem(structElem);
    }

    public TagTreePointer setPageForTagging(PdfPage page) {
        if (page.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.PAGE_ALREADY_FLUSHED);
        }
        this.currentPage = page;
        return this;
    }

    public PdfPage getCurrentPage() {
        return this.currentPage;
    }

    public TagTreePointer setContentStreamForTagging(PdfStream contentStream) {
        this.contentStream = contentStream;
        return this;
    }

    public PdfStream getCurrentContentStream() {
        return this.contentStream;
    }

    public TagStructureContext getContext() {
        return this.tagStructureContext;
    }

    public PdfDocument getDocument() {
        return this.tagStructureContext.getDocument();
    }

    public TagTreePointer setNamespaceForNewTags(PdfNamespace namespace) {
        this.currentNamespace = namespace;
        return this;
    }

    public PdfNamespace getNamespaceForNewTags() {
        return this.currentNamespace;
    }

    public TagTreePointer addTag(String role) {
        addTag(-1, role);
        return this;
    }

    public TagTreePointer addTag(int index, String role) {
        this.tagStructureContext.throwExceptionIfRoleIsInvalid(role, this.currentNamespace);
        setNextNewKidIndex(index);
        setCurrentStructElem(addNewKid(role));
        return this;
    }

    public TagTreePointer addTag(AccessibilityProperties properties) {
        addTag(-1, properties);
        return this;
    }

    public TagTreePointer addTag(int index, AccessibilityProperties properties) {
        this.tagStructureContext.throwExceptionIfRoleIsInvalid(properties, this.currentNamespace);
        setNextNewKidIndex(index);
        setCurrentStructElem(addNewKid(properties));
        return this;
    }

    public TagTreePointer addAnnotationTag(PdfAnnotation annotation) {
        int nextStructParentIndex;
        throwExceptionIfCurrentPageIsNotInited();
        PdfNumber structParentIndex = annotation.getPdfObject().getAsNumber(PdfName.StructParent);
        PdfStructElem currentStructElem = getCurrentStructElem();
        if (structParentIndex != null) {
            nextStructParentIndex = structParentIndex.intValue();
        } else {
            nextStructParentIndex = getDocument().getNextStructParentIndex();
        }
        PdfObjRef kid = new PdfObjRef(annotation, currentStructElem, nextStructParentIndex);
        if (!ensureElementPageEqualsKidPage(getCurrentStructElem(), this.currentPage.getPdfObject())) {
            ((PdfDictionary) kid.getPdfObject()).put(PdfName.Pg, this.currentPage.getPdfObject().getIndirectReference());
        }
        addNewKid(kid);
        return this;
    }

    public TagTreePointer setNextNewKidIndex(int nextNewKidIndex) {
        if (nextNewKidIndex > -1) {
            this.nextNewKidIndex = nextNewKidIndex;
        }
        return this;
    }

    public TagTreePointer removeTag() {
        PdfStructElem currentStructElem = getCurrentStructElem();
        IStructureNode parentElem = currentStructElem.getParent();
        if (parentElem instanceof PdfStructTreeRoot) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_REMOVE_DOCUMENT_ROOT_TAG);
        }
        List<IStructureNode> kids = currentStructElem.getKids();
        PdfStructElem parent = (PdfStructElem) parentElem;
        if (parent.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_REMOVE_TAG_BECAUSE_ITS_PARENT_IS_FLUSHED);
        }
        Object objForStructDict = this.tagStructureContext.getWaitingTagsManager().getObjForStructDict(currentStructElem.getPdfObject());
        this.tagStructureContext.getWaitingTagsManager().removeWaitingState(objForStructDict);
        int removedKidIndex = parent.removeKid(currentStructElem);
        PdfIndirectReference indRef = currentStructElem.getPdfObject().getIndirectReference();
        if (indRef != null) {
            indRef.setFree();
        }
        for (IStructureNode kid : kids) {
            if (kid instanceof PdfStructElem) {
                parent.addKid(removedKidIndex, (PdfStructElem) kid);
                removedKidIndex++;
            } else {
                PdfMcr mcr = prepareMcrForMovingToNewParent((PdfMcr) kid, parent);
                parent.addKid(removedKidIndex, mcr);
                removedKidIndex++;
            }
        }
        currentStructElem.getPdfObject().clear();
        setCurrentStructElem(parent);
        return this;
    }

    public TagTreePointer relocateKid(int kidIndex, TagTreePointer pointerToNewParent) {
        if (getDocument() != pointerToNewParent.getDocument()) {
            throw new PdfException(KernelExceptionMessageConstant.TAG_CANNOT_BE_MOVED_TO_THE_ANOTHER_DOCUMENTS_TAG_STRUCTURE);
        }
        if (getCurrentStructElem().isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RELOCATE_TAG_WHICH_PARENT_IS_ALREADY_FLUSHED);
        }
        if (isPointingToSameTag(pointerToNewParent)) {
            if (kidIndex == pointerToNewParent.nextNewKidIndex) {
                return this;
            }
            if (kidIndex < pointerToNewParent.nextNewKidIndex) {
                pointerToNewParent.setNextNewKidIndex(pointerToNewParent.nextNewKidIndex - 1);
            }
        }
        if (getCurrentStructElem().getKids().get(kidIndex) == null) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RELOCATE_TAG_WHICH_IS_ALREADY_FLUSHED);
        }
        IStructureNode removedKid = getCurrentStructElem().removeKid(kidIndex, true);
        if (removedKid instanceof PdfStructElem) {
            pointerToNewParent.addNewKid((PdfStructElem) removedKid);
        } else if (removedKid instanceof PdfMcr) {
            PdfMcr mcrKid = prepareMcrForMovingToNewParent((PdfMcr) removedKid, pointerToNewParent.getCurrentStructElem());
            pointerToNewParent.addNewKid(mcrKid);
        }
        return this;
    }

    public TagTreePointer relocate(TagTreePointer pointerToNewParent) {
        if (getCurrentStructElem().getPdfObject() == this.tagStructureContext.getRootTag().getPdfObject()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RELOCATE_ROOT_TAG);
        }
        if (getCurrentStructElem().isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RELOCATE_TAG_WHICH_IS_ALREADY_FLUSHED);
        }
        int i = getIndexInParentKidsList();
        if (i < 0) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_RELOCATE_TAG_WHICH_PARENT_IS_ALREADY_FLUSHED);
        }
        new TagTreePointer(this).moveToParent().relocateKid(i, pointerToNewParent);
        return this;
    }

    public TagReference getTagReference() {
        return getTagReference(-1);
    }

    public TagReference getTagReference(int index) {
        return new TagReference(getCurrentElemEnsureIndirect(), this, index);
    }

    public TagTreePointer moveToRoot() {
        setCurrentStructElem(this.tagStructureContext.getRootTag());
        return this;
    }

    public TagTreePointer moveToParent() {
        if (getCurrentStructElem().getPdfObject() == this.tagStructureContext.getRootTag().getPdfObject()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_MOVE_TO_PARENT_CURRENT_ELEMENT_IS_ROOT);
        }
        PdfStructElem parent = (PdfStructElem) getCurrentStructElem().getParent();
        if (parent.isFlushed()) {
            Logger logger = LoggerFactory.getLogger(TagTreePointer.class);
            logger.warn(IoLogMessageConstant.ATTEMPT_TO_MOVE_TO_FLUSHED_PARENT);
            moveToRoot();
        } else {
            setCurrentStructElem(parent);
        }
        return this;
    }

    public TagTreePointer moveToKid(int kidIndex) {
        IStructureNode kid = getCurrentStructElem().getKids().get(kidIndex);
        if (kid instanceof PdfStructElem) {
            setCurrentStructElem((PdfStructElem) kid);
            return this;
        } else if (kid instanceof PdfMcr) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_MOVE_TO_MARKED_CONTENT_REFERENCE);
        } else {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_MOVE_TO_FLUSHED_KID);
        }
    }

    public TagTreePointer moveToKid(String role) {
        moveToKid(0, role);
        return this;
    }

    public TagTreePointer moveToKid(int n, String role) {
        if (MCR_MARKER.equals(role)) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_MOVE_TO_MARKED_CONTENT_REFERENCE);
        }
        List<IStructureNode> descendants = new ArrayList<>(getCurrentStructElem().getKids());
        int k = 0;
        for (int i = 0; i < descendants.size(); i++) {
            if (descendants.get(i) != null && !(descendants.get(i) instanceof PdfMcr)) {
                String descendantRole = descendants.get(i).getRole().getValue();
                if (descendantRole.equals(role)) {
                    int k2 = k + 1;
                    if (k != n) {
                        k = k2;
                    } else {
                        setCurrentStructElem((PdfStructElem) descendants.get(i));
                        return this;
                    }
                }
                descendants.addAll(descendants.get(i).getKids());
            }
        }
        throw new PdfException(KernelExceptionMessageConstant.NO_KID_WITH_SUCH_ROLE);
    }

    public List<String> getKidsRoles() {
        List<String> roles = new ArrayList<>();
        List<IStructureNode> kids = getCurrentStructElem().getKids();
        for (IStructureNode kid : kids) {
            if (kid == null) {
                roles.add(null);
            } else if (kid instanceof PdfStructElem) {
                roles.add(kid.getRole().getValue());
            } else {
                roles.add(MCR_MARKER);
            }
        }
        return roles;
    }

    public TagTreePointer flushTag() {
        if (getCurrentStructElem().getPdfObject() == this.tagStructureContext.getRootTag().getPdfObject()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_FLUSH_DOCUMENT_ROOT_TAG_BEFORE_DOCUMENT_IS_CLOSED);
        }
        IStructureNode parent = this.tagStructureContext.getWaitingTagsManager().flushTag(getCurrentStructElem());
        if (parent != null) {
            setCurrentStructElem((PdfStructElem) parent);
        } else {
            setCurrentStructElem(this.tagStructureContext.getRootTag());
        }
        return this;
    }

    public TagTreePointer flushParentsIfAllKidsFlushed() {
        getContext().flushParentIfBelongsToPage(getCurrentStructElem(), null);
        return this;
    }

    public AccessibilityProperties getProperties() {
        return new BackedAccessibilityProperties(this);
    }

    public String getRole() {
        return getCurrentStructElem().getRole().getValue();
    }

    public TagTreePointer setRole(String role) {
        getCurrentStructElem().setRole(PdfStructTreeRoot.convertRoleToPdfName(role));
        return this;
    }

    public int getIndexInParentKidsList() {
        if (getCurrentStructElem().getPdfObject() == this.tagStructureContext.getRootTag().getPdfObject()) {
            return -1;
        }
        PdfStructElem parent = (PdfStructElem) getCurrentStructElem().getParent();
        if (parent.isFlushed()) {
            return -1;
        }
        PdfObject k = parent.getK();
        if (k == getCurrentStructElem().getPdfObject()) {
            return 0;
        }
        if (k.isArray()) {
            PdfArray kidsArr = (PdfArray) k;
            return kidsArr.indexOf(getCurrentStructElem().getPdfObject());
        }
        return -1;
    }

    public TagTreePointer moveToPointer(TagTreePointer tagTreePointer) {
        this.currentStructElem = tagTreePointer.currentStructElem;
        return this;
    }

    public boolean isPointingToSameTag(TagTreePointer otherPointer) {
        return getCurrentStructElem().getPdfObject().equals(otherPointer.getCurrentStructElem().getPdfObject());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int createNextMcidForStructElem(PdfStructElem elem, int index) {
        PdfMcr mcr;
        throwExceptionIfCurrentPageIsNotInited();
        if (!markedContentNotInPageStream() && ensureElementPageEqualsKidPage(elem, this.currentPage.getPdfObject())) {
            mcr = new PdfMcrNumber(this.currentPage, elem);
        } else {
            mcr = new PdfMcrDictionary(this.currentPage, elem);
            if (markedContentNotInPageStream()) {
                ((PdfDictionary) mcr.getPdfObject()).put(PdfName.Stm, this.contentStream);
            }
        }
        elem.addKid(index, mcr);
        return mcr.getMcid();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TagTreePointer setCurrentStructElem(PdfStructElem structElem) {
        if (structElem.getParent() == null) {
            throw new PdfException(KernelExceptionMessageConstant.STRUCTURE_ELEMENT_SHALL_CONTAIN_PARENT_OBJECT);
        }
        this.currentStructElem = structElem;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfStructElem getCurrentStructElem() {
        if (this.currentStructElem.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.TAG_TREE_POINTER_IS_IN_INVALID_STATE_IT_POINTS_AT_FLUSHED_ELEMENT_USE_MOVE_TO_ROOT);
        }
        PdfIndirectReference indRef = this.currentStructElem.getPdfObject().getIndirectReference();
        if (indRef != null && indRef.isFree()) {
            throw new PdfException(KernelExceptionMessageConstant.TAG_TREE_POINTER_IS_IN_INVALID_STATE_IT_POINTS_AT_REMOVED_ELEMENT_USE_MOVE_TO_ROOT);
        }
        return this.currentStructElem;
    }

    public void applyProperties(AccessibilityProperties properties) {
        AccessibilityPropertiesToStructElem.apply(properties, getCurrentStructElem());
    }

    private int getNextNewKidPosition() {
        int nextPos = this.nextNewKidIndex;
        this.nextNewKidIndex = -1;
        return nextPos;
    }

    private PdfStructElem addNewKid(String role) {
        PdfStructElem kid = new PdfStructElem(getDocument(), PdfStructTreeRoot.convertRoleToPdfName(role));
        processKidNamespace(kid);
        return addNewKid(kid);
    }

    private PdfStructElem addNewKid(AccessibilityProperties properties) {
        PdfStructElem kid = new PdfStructElem(getDocument(), PdfStructTreeRoot.convertRoleToPdfName(properties.getRole()));
        AccessibilityPropertiesToStructElem.apply(properties, kid);
        processKidNamespace(kid);
        return addNewKid(kid);
    }

    private void processKidNamespace(PdfStructElem kid) {
        PdfNamespace kidNamespace = kid.getNamespace();
        if (this.currentNamespace != null && kidNamespace == null) {
            kid.setNamespace(this.currentNamespace);
            kidNamespace = this.currentNamespace;
        }
        this.tagStructureContext.ensureNamespaceRegistered(kidNamespace);
    }

    private PdfStructElem addNewKid(PdfStructElem kid) {
        return getCurrentElemEnsureIndirect().addKid(getNextNewKidPosition(), kid);
    }

    private PdfMcr addNewKid(PdfMcr kid) {
        return getCurrentElemEnsureIndirect().addKid(getNextNewKidPosition(), kid);
    }

    private PdfStructElem getCurrentElemEnsureIndirect() {
        PdfStructElem currentStructElem = getCurrentStructElem();
        if (currentStructElem.getPdfObject().getIndirectReference() == null) {
            currentStructElem.makeIndirect(getDocument());
        }
        return currentStructElem;
    }

    private PdfMcr prepareMcrForMovingToNewParent(PdfMcr mcrKid, PdfStructElem newParent) {
        PdfObject mcrObject = mcrKid.getPdfObject();
        PdfDictionary mcrPage = mcrKid.getPageObject();
        PdfDictionary mcrDict = null;
        if (!mcrObject.isNumber()) {
            mcrDict = (PdfDictionary) mcrObject;
        }
        if ((mcrDict == null || !mcrDict.containsKey(PdfName.Pg)) && !ensureElementPageEqualsKidPage(newParent, mcrPage)) {
            if (mcrDict == null) {
                PdfDictionary mcrDict2 = new PdfDictionary();
                mcrDict2.put(PdfName.Type, PdfName.MCR);
                mcrDict2.put(PdfName.MCID, mcrKid.getPdfObject());
                mcrDict = mcrDict2;
            }
            mcrDict.put(PdfName.Pg, mcrPage.getIndirectReference());
        }
        if (mcrDict != null) {
            if (PdfName.MCR.equals(mcrDict.get(PdfName.Type))) {
                return new PdfMcrDictionary(mcrDict, newParent);
            }
            if (PdfName.OBJR.equals(mcrDict.get(PdfName.Type))) {
                return new PdfObjRef(mcrDict, newParent);
            }
            return mcrKid;
        }
        return new PdfMcrNumber((PdfNumber) mcrObject, newParent);
    }

    private boolean ensureElementPageEqualsKidPage(PdfStructElem elem, PdfDictionary kidPage) {
        PdfObject pageObject = elem.getPdfObject().get(PdfName.Pg);
        if (pageObject == null) {
            pageObject = kidPage;
            elem.put(PdfName.Pg, kidPage.getIndirectReference());
        }
        return kidPage.equals(pageObject);
    }

    private boolean markedContentNotInPageStream() {
        return this.contentStream != null;
    }

    private void throwExceptionIfCurrentPageIsNotInited() {
        if (this.currentPage == null) {
            throw new PdfException(KernelExceptionMessageConstant.PAGE_IS_NOT_SET_FOR_THE_PDF_TAG_STRUCTURE);
        }
    }
}
