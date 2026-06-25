package com.itextpdf.kernel.pdf.tagging;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.IsoKey;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfIndirectReference;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNull;
import com.itextpdf.kernel.pdf.PdfNumTree;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class ParentTreeHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger(ParentTreeHandler.class);
    private Map<PdfIndirectReference, PageMcrsContainer> pageToPageMcrs;
    private Map<PdfIndirectReference, Integer> pageToStructParentsInd;
    private PdfNumTree parentTree;
    private PdfStructTreeRoot structTreeRoot;
    private int maxStructParentIndex = -1;
    private Map<PdfIndirectReference, Integer> xObjectToStructParentsInd = new HashMap();

    /* JADX INFO: Access modifiers changed from: package-private */
    public ParentTreeHandler(PdfStructTreeRoot structTreeRoot) {
        this.structTreeRoot = structTreeRoot;
        this.parentTree = new PdfNumTree(structTreeRoot.getDocument().getCatalog(), PdfName.ParentTree);
        registerAllMcrs();
        this.pageToStructParentsInd = new HashMap();
    }

    public PageMcrsContainer getPageMarkedContentReferences(PdfPage page) {
        return this.pageToPageMcrs.get(page.getPdfObject().getIndirectReference());
    }

    public PdfMcr findMcrByMcid(PdfDictionary pageDict, int mcid) {
        PageMcrsContainer pageMcrs = this.pageToPageMcrs.get(pageDict.getIndirectReference());
        if (pageMcrs != null) {
            return (PdfMcr) pageMcrs.getPageContentStreamsMcrs().get(Integer.valueOf(mcid));
        }
        return null;
    }

    public PdfObjRef findObjRefByStructParentIndex(PdfDictionary pageDict, int structParentIndex) {
        PageMcrsContainer pageMcrs = this.pageToPageMcrs.get(pageDict.getIndirectReference());
        if (pageMcrs != null) {
            return (PdfObjRef) pageMcrs.getObjRefs().get(Integer.valueOf(structParentIndex));
        }
        return null;
    }

    public int getNextMcidForPage(PdfPage page) {
        PageMcrsContainer pageMcrs = getPageMarkedContentReferences(page);
        if (pageMcrs == null || pageMcrs.getPageContentStreamsMcrs().size() == 0) {
            return 0;
        }
        return pageMcrs.getPageContentStreamsMcrs().lastEntry().getKey().intValue() + 1;
    }

    public void createParentTreeEntryForPage(PdfPage page) {
        PageMcrsContainer mcrs = getPageMarkedContentReferences(page);
        if (mcrs == null) {
            return;
        }
        this.pageToPageMcrs.remove(page.getPdfObject().getIndirectReference());
        if (updateStructParentTreeEntries(page, mcrs)) {
            this.structTreeRoot.setModified();
        }
    }

    public void savePageStructParentIndexIfNeeded(PdfPage page) {
        PdfIndirectReference indRef = page.getPdfObject().getIndirectReference();
        if (page.isFlushed() || this.pageToPageMcrs.get(indRef) == null) {
            return;
        }
        boolean hasNonObjRefMcr = this.pageToPageMcrs.get(indRef).getPageContentStreamsMcrs().size() > 0 || this.pageToPageMcrs.get(indRef).getPageResourceXObjects().size() > 0;
        if (hasNonObjRefMcr) {
            this.pageToStructParentsInd.put(indRef, Integer.valueOf(getOrCreatePageStructParentIndex(page)));
        }
    }

    public PdfDictionary buildParentTree() {
        return (PdfDictionary) this.parentTree.buildTree().makeIndirect(this.structTreeRoot.getDocument());
    }

    public void registerMcr(PdfMcr mcr) {
        registerMcr(mcr, false);
    }

    private void registerMcr(PdfMcr mcr, boolean registeringOnInit) {
        PdfIndirectReference stmIndRef;
        PdfStream xObjectStream;
        PdfIndirectReference mcrPageIndRef = mcr.getPageIndirectReference();
        if (mcrPageIndRef == null || (!(mcr instanceof PdfObjRef) && mcr.getMcid() < 0)) {
            LOGGER.error(IoLogMessageConstant.ENCOUNTERED_INVALID_MCR);
            return;
        }
        PageMcrsContainer pageMcrs = this.pageToPageMcrs.get(mcrPageIndRef);
        if (pageMcrs == null) {
            pageMcrs = new PageMcrsContainer();
            this.pageToPageMcrs.put(mcrPageIndRef, pageMcrs);
        }
        PdfObject stm = getStm(mcr);
        if (stm != null) {
            if (stm instanceof PdfIndirectReference) {
                stmIndRef = (PdfIndirectReference) stm;
                xObjectStream = (PdfStream) stmIndRef.getRefersTo();
            } else {
                PdfIndirectReference stmIndRef2 = stm.getIndirectReference();
                if (stmIndRef2 == null) {
                    stm.makeIndirect(this.structTreeRoot.getDocument());
                }
                stmIndRef = stm.getIndirectReference();
                xObjectStream = (PdfStream) stm;
            }
            Integer structParent = xObjectStream.getAsInt(PdfName.StructParents);
            if (structParent != null) {
                this.xObjectToStructParentsInd.put(stmIndRef, structParent);
                if (registeringOnInit) {
                    xObjectStream.release();
                }
            } else {
                this.maxStructParentIndex++;
                this.xObjectToStructParentsInd.put(stmIndRef, Integer.valueOf(this.maxStructParentIndex));
                xObjectStream.put(PdfName.StructParents, new PdfNumber(this.maxStructParentIndex));
                this.structTreeRoot.getPdfObject().put(PdfName.ParentTreeNextKey, new PdfNumber(this.maxStructParentIndex + 1));
                LOGGER.warn(KernelLogMessageConstant.XOBJECT_STRUCT_PARENT_INDEX_MISSED_AND_RECREATED);
            }
            pageMcrs.putXObjectMcr(stmIndRef, mcr);
        } else if (mcr instanceof PdfObjRef) {
            PdfDictionary obj = ((PdfDictionary) mcr.getPdfObject()).getAsDictionary(PdfName.Obj);
            if (obj == null || obj.isFlushed()) {
                throw new PdfException(KernelExceptionMessageConstant.WHEN_ADDING_OBJECT_REFERENCE_TO_THE_TAG_TREE_IT_MUST_BE_CONNECTED_TO_NOT_FLUSHED_OBJECT);
            }
            PdfNumber n = obj.getAsNumber(PdfName.StructParent);
            if (n != null) {
                pageMcrs.putObjectReferenceMcr(n.intValue(), mcr);
            } else {
                this.maxStructParentIndex++;
                pageMcrs.putObjectReferenceMcr(this.maxStructParentIndex, mcr);
                obj.put(PdfName.StructParent, new PdfNumber(this.maxStructParentIndex));
                this.structTreeRoot.getPdfObject().put(PdfName.ParentTreeNextKey, new PdfNumber(this.maxStructParentIndex + 1));
                LOGGER.warn(KernelLogMessageConstant.STRUCT_PARENT_INDEX_MISSED_AND_RECREATED);
            }
        } else {
            pageMcrs.putPageContentStreamMcr(mcr.getMcid(), mcr);
        }
        if (!registeringOnInit) {
            this.structTreeRoot.setModified();
        }
    }

    public void unregisterMcr(PdfMcr mcrToUnregister) {
        PdfNumber n;
        PdfDictionary pageDict = mcrToUnregister.getPageObject();
        if (pageDict == null) {
            return;
        }
        if (pageDict.isFlushed()) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_REMOVE_MARKED_CONTENT_REFERENCE_BECAUSE_ITS_PAGE_WAS_ALREADY_FLUSHED);
        }
        PageMcrsContainer pageMcrs = this.pageToPageMcrs.get(pageDict.getIndirectReference());
        if (pageMcrs != null) {
            PdfObject stm = getStm(mcrToUnregister);
            if (stm != null) {
                PdfIndirectReference xObjectReference = stm instanceof PdfIndirectReference ? (PdfIndirectReference) stm : stm.getIndirectReference();
                pageMcrs.getPageResourceXObjects().get(xObjectReference).remove(Integer.valueOf(mcrToUnregister.getMcid()));
                if (pageMcrs.getPageResourceXObjects().get(xObjectReference).isEmpty()) {
                    pageMcrs.getPageResourceXObjects().remove(xObjectReference);
                    this.xObjectToStructParentsInd.remove(xObjectReference);
                }
                this.structTreeRoot.setModified();
            } else if (mcrToUnregister instanceof PdfObjRef) {
                PdfDictionary obj = ((PdfDictionary) mcrToUnregister.getPdfObject()).getAsDictionary(PdfName.Obj);
                if (obj != null && !obj.isFlushed() && (n = obj.getAsNumber(PdfName.StructParent)) != null) {
                    pageMcrs.getObjRefs().remove(Integer.valueOf(n.intValue()));
                    this.structTreeRoot.setModified();
                    return;
                }
                for (Map.Entry<Integer, PdfMcr> entry : pageMcrs.getObjRefs().entrySet()) {
                    if (entry.getValue().getPdfObject() == mcrToUnregister.getPdfObject()) {
                        pageMcrs.getObjRefs().remove(entry.getKey());
                        this.structTreeRoot.setModified();
                        return;
                    }
                }
            } else {
                pageMcrs.getPageContentStreamsMcrs().remove(Integer.valueOf(mcrToUnregister.getMcid()));
                this.structTreeRoot.setModified();
            }
        }
    }

    private void registerAllMcrs() {
        this.pageToPageMcrs = new HashMap();
        Map<Integer, PdfObject> parentTreeEntries = new PdfNumTree(this.structTreeRoot.getDocument().getCatalog(), PdfName.ParentTree).getNumbers();
        Set<PdfDictionary> mcrParents = new LinkedHashSet<>();
        for (Map.Entry<Integer, PdfObject> entry : parentTreeEntries.entrySet()) {
            if (entry.getKey().intValue() > this.maxStructParentIndex) {
                this.maxStructParentIndex = entry.getKey().intValue();
            }
            PdfObject entryValue = entry.getValue();
            if (entryValue.isDictionary()) {
                mcrParents.add((PdfDictionary) entryValue);
            } else if (entryValue.isArray()) {
                PdfArray parentsArray = (PdfArray) entryValue;
                for (int i = 0; i < parentsArray.size(); i++) {
                    PdfDictionary parent = parentsArray.getAsDictionary(i);
                    if (parent != null) {
                        mcrParents.add(parent);
                    }
                }
            }
        }
        this.structTreeRoot.getPdfObject().put(PdfName.ParentTreeNextKey, new PdfNumber(this.maxStructParentIndex + 1));
        for (PdfDictionary mcrParent : mcrParents) {
            PdfStructElem mcrParentStructElem = new PdfStructElem(mcrParent);
            for (IStructureNode kid : mcrParentStructElem.getKids()) {
                if (kid instanceof PdfMcr) {
                    registerMcr((PdfMcr) kid, true);
                }
            }
        }
    }

    private boolean updateStructParentTreeEntries(PdfPage page, PageMcrsContainer mcrs) {
        int pageStructParentIndex;
        boolean res = false;
        for (Map.Entry<Integer, PdfMcr> entry : mcrs.getObjRefs().entrySet()) {
            PdfMcr mcr = entry.getValue();
            PdfDictionary parentObj = ((PdfStructElem) mcr.getParent()).getPdfObject();
            if (parentObj.isIndirect()) {
                int structParent = entry.getKey().intValue();
                this.parentTree.addEntry(structParent, parentObj);
                res = true;
            }
        }
        for (Map.Entry<PdfIndirectReference, TreeMap<Integer, PdfMcr>> entry2 : mcrs.getPageResourceXObjects().entrySet()) {
            PdfIndirectReference xObjectRef = entry2.getKey();
            if (this.xObjectToStructParentsInd.containsKey(xObjectRef)) {
                int pageStructParentIndex2 = this.xObjectToStructParentsInd.remove(xObjectRef).intValue();
                if (updateStructParentTreeForContentStreamEntries(entry2.getValue(), pageStructParentIndex2)) {
                    res = true;
                }
            }
        }
        if (page.isFlushed()) {
            PdfIndirectReference pageRef = page.getPdfObject().getIndirectReference();
            if (!this.pageToStructParentsInd.containsKey(pageRef)) {
                return res;
            }
            pageStructParentIndex = this.pageToStructParentsInd.remove(pageRef).intValue();
        } else {
            pageStructParentIndex = getOrCreatePageStructParentIndex(page);
        }
        if (updateStructParentTreeForContentStreamEntries(mcrs.getPageContentStreamsMcrs(), pageStructParentIndex)) {
            return true;
        }
        return res;
    }

    private boolean updateStructParentTreeForContentStreamEntries(Map<Integer, PdfMcr> mcrsOfContentStream, int pageStructParentIndex) {
        int currentMcid;
        PdfArray parentsOfMcrs = new PdfArray();
        int currentMcid2 = 0;
        for (Map.Entry<Integer, PdfMcr> entry : mcrsOfContentStream.entrySet()) {
            PdfMcr mcr = entry.getValue();
            PdfDictionary parentObj = ((PdfStructElem) mcr.getParent()).getPdfObject();
            if (parentObj.isIndirect()) {
                while (true) {
                    currentMcid = currentMcid2 + 1;
                    if (currentMcid2 >= mcr.getMcid()) {
                        break;
                    }
                    parentsOfMcrs.add(PdfNull.PDF_NULL);
                    currentMcid2 = currentMcid;
                }
                parentsOfMcrs.add(parentObj);
                currentMcid2 = currentMcid;
            }
        }
        if (!parentsOfMcrs.isEmpty()) {
            parentsOfMcrs.makeIndirect(this.structTreeRoot.getDocument());
            this.parentTree.addEntry(pageStructParentIndex, parentsOfMcrs);
            this.structTreeRoot.getDocument().checkIsoConformance(parentsOfMcrs, IsoKey.TAG_STRUCTURE_ELEMENT);
            parentsOfMcrs.flush();
            return true;
        }
        return false;
    }

    private int getOrCreatePageStructParentIndex(PdfPage page) {
        int structParentIndex = page.getStructParentIndex();
        if (structParentIndex < 0) {
            int structParentIndex2 = page.getDocument().getNextStructParentIndex();
            page.getPdfObject().put(PdfName.StructParents, new PdfNumber(structParentIndex2));
            return structParentIndex2;
        }
        return structParentIndex;
    }

    private static PdfObject getStm(PdfMcr mcr) {
        if (mcr instanceof PdfMcrDictionary) {
            return ((PdfDictionary) mcr.getPdfObject()).get(PdfName.Stm, false);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class PageMcrsContainer {
        Map<Integer, PdfMcr> objRefs = new LinkedHashMap();
        NavigableMap<Integer, PdfMcr> pageContentStreams = new TreeMap();
        Map<PdfIndirectReference, TreeMap<Integer, PdfMcr>> pageResourceXObjects = new LinkedHashMap();

        PageMcrsContainer() {
        }

        void putObjectReferenceMcr(int structParentIndex, PdfMcr mcr) {
            this.objRefs.put(Integer.valueOf(structParentIndex), mcr);
        }

        void putPageContentStreamMcr(int mcid, PdfMcr mcr) {
            this.pageContentStreams.put(Integer.valueOf(mcid), mcr);
        }

        void putXObjectMcr(PdfIndirectReference xObjectIndRef, PdfMcr mcr) {
            TreeMap<Integer, PdfMcr> xObjectMcrs = this.pageResourceXObjects.get(xObjectIndRef);
            if (xObjectMcrs == null) {
                TreeMap<Integer, PdfMcr> xObjectMcrs2 = new TreeMap<>();
                this.pageResourceXObjects.put(xObjectIndRef, xObjectMcrs2);
            }
            this.pageResourceXObjects.get(xObjectIndRef).put(Integer.valueOf(mcr.getMcid()), mcr);
        }

        NavigableMap<Integer, PdfMcr> getPageContentStreamsMcrs() {
            return this.pageContentStreams;
        }

        Map<Integer, PdfMcr> getObjRefs() {
            return this.objRefs;
        }

        Map<PdfIndirectReference, TreeMap<Integer, PdfMcr>> getPageResourceXObjects() {
            return this.pageResourceXObjects;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public Collection<PdfMcr> getAllMcrsAsCollection() {
            Collection<PdfMcr> collection = new ArrayList<>();
            collection.addAll(this.objRefs.values());
            collection.addAll(this.pageContentStreams.values());
            for (Map.Entry<PdfIndirectReference, TreeMap<Integer, PdfMcr>> entry : this.pageResourceXObjects.entrySet()) {
                collection.addAll(entry.getValue().values());
            }
            return collection;
        }
    }
}
