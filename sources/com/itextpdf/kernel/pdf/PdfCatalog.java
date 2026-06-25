package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.logs.KernelLogMessageConstant;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.action.PdfAction;
import com.itextpdf.kernel.pdf.collection.PdfCollection;
import com.itextpdf.kernel.pdf.layer.PdfOCProperties;
import com.itextpdf.kernel.pdf.navigation.PdfDestination;
import com.itextpdf.kernel.pdf.navigation.PdfExplicitDestination;
import com.itextpdf.kernel.pdf.navigation.PdfStringDestination;
import com.itextpdf.kernel.utils.NullCopyFilter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfCatalog extends PdfObjectWrapper<PdfDictionary> {
    private static final String ROOT_OUTLINE_TITLE = "Outlines";
    protected Map<PdfName, PdfNameTree> nameTrees;
    protected PdfOCProperties ocProperties;
    private boolean ocgCopied;
    private boolean outlineMode;
    private PdfOutline outlines;
    protected PdfNumTree pageLabels;
    private final PdfPagesTree pageTree;
    private final Map<PdfObject, List<PdfOutline>> pagesWithOutlines;
    private static final Logger LOGGER = LoggerFactory.getLogger(PdfCatalog.class);
    private static final Set<PdfName> PAGE_MODES = Collections.unmodifiableSet(new HashSet(Arrays.asList(PdfName.UseNone, PdfName.UseOutlines, PdfName.UseThumbs, PdfName.FullScreen, PdfName.UseOC, PdfName.UseAttachments)));
    private static final Set<PdfName> PAGE_LAYOUTS = Collections.unmodifiableSet(new HashSet(Arrays.asList(PdfName.SinglePage, PdfName.OneColumn, PdfName.TwoColumnLeft, PdfName.TwoColumnRight, PdfName.TwoPageLeft, PdfName.TwoPageRight)));

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfCatalog(PdfDictionary pdfObject) {
        super(pdfObject);
        this.nameTrees = new LinkedHashMap();
        this.pagesWithOutlines = new HashMap();
        this.ocgCopied = false;
        if (pdfObject == null) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NO_PDF_CATALOG_OBJECT);
        }
        ensureObjectIsAddedToDocument(pdfObject);
        getPdfObject().put(PdfName.Type, PdfName.Catalog);
        setForbidRelease();
        this.pageTree = new PdfPagesTree(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfCatalog(PdfDocument pdfDocument) {
        this((PdfDictionary) new PdfDictionary().makeIndirect(pdfDocument));
    }

    public PdfOCProperties getOCProperties(boolean createIfNotExists) {
        if (this.ocProperties != null) {
            return this.ocProperties;
        }
        PdfDictionary ocPropertiesDict = getPdfObject().getAsDictionary(PdfName.OCProperties);
        if (ocPropertiesDict != null) {
            if (getDocument().getWriter() != null) {
                ocPropertiesDict.makeIndirect(getDocument());
            }
            this.ocProperties = new PdfOCProperties(ocPropertiesDict);
        } else if (createIfNotExists) {
            this.ocProperties = new PdfOCProperties(getDocument());
        }
        return this.ocProperties;
    }

    public PdfDocument getDocument() {
        return getPdfObject().getIndirectReference().getDocument();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    public void flush() {
        Logger logger = LoggerFactory.getLogger(PdfDocument.class);
        logger.warn("PdfCatalog cannot be flushed manually");
    }

    @Override // com.itextpdf.kernel.pdf.PdfObjectWrapper
    protected boolean isWrappedObjectMustBeIndirect() {
        return true;
    }

    public PdfCatalog setOpenAction(PdfDestination destination) {
        return put(PdfName.OpenAction, destination.getPdfObject());
    }

    public PdfCatalog setOpenAction(PdfAction action) {
        return put(PdfName.OpenAction, action.getPdfObject());
    }

    public PdfCatalog setAdditionalAction(PdfName key, PdfAction action) {
        PdfAction.setAdditionalAction(this, key, action);
        return this;
    }

    public PdfName getPageMode() {
        return getPdfObject().getAsName(PdfName.PageMode);
    }

    public PdfCatalog setPageMode(PdfName pageMode) {
        if (PAGE_MODES.contains(pageMode)) {
            return put(PdfName.PageMode, pageMode);
        }
        return this;
    }

    public PdfName getPageLayout() {
        return getPdfObject().getAsName(PdfName.PageLayout);
    }

    public PdfCatalog setPageLayout(PdfName pageLayout) {
        if (PAGE_LAYOUTS.contains(pageLayout)) {
            return put(PdfName.PageLayout, pageLayout);
        }
        return this;
    }

    public PdfViewerPreferences getViewerPreferences() {
        PdfDictionary viewerPreferences = getPdfObject().getAsDictionary(PdfName.ViewerPreferences);
        if (viewerPreferences != null) {
            return new PdfViewerPreferences(viewerPreferences);
        }
        return null;
    }

    public PdfCatalog setViewerPreferences(PdfViewerPreferences preferences) {
        return put(PdfName.ViewerPreferences, preferences.getPdfObject());
    }

    public PdfNameTree getNameTree(PdfName treeType) {
        PdfNameTree tree = this.nameTrees.get(treeType);
        if (tree == null) {
            PdfNameTree tree2 = new PdfNameTree(this, treeType);
            this.nameTrees.put(treeType, tree2);
            return tree2;
        }
        return tree;
    }

    public boolean nameTreeContainsKey(PdfName treeType) {
        return this.nameTrees.containsKey(treeType);
    }

    public PdfNumTree getPageLabelsTree(boolean createIfNotExists) {
        if (this.pageLabels == null && (getPdfObject().containsKey(PdfName.PageLabels) || createIfNotExists)) {
            this.pageLabels = new PdfNumTree(this, PdfName.PageLabels);
        }
        return this.pageLabels;
    }

    public PdfString getLang() {
        return getPdfObject().getAsString(PdfName.Lang);
    }

    public void setLang(PdfString lang) {
        put(PdfName.Lang, lang);
    }

    public void addDeveloperExtension(PdfDeveloperExtension extension) {
        PdfDictionary extensions = ((PdfDictionary) getPdfObject()).getAsDictionary(PdfName.Extensions);
        if (extensions == null) {
            extensions = new PdfDictionary();
            put(PdfName.Extensions, extensions);
        }
        if (extension.isMultiValued()) {
            PdfArray existingExtensionArray = extensions.getAsArray(extension.getPrefix());
            if (existingExtensionArray == null) {
                existingExtensionArray = new PdfArray();
                extensions.put(extension.getPrefix(), existingExtensionArray);
            } else {
                for (int i = 0; i < existingExtensionArray.size(); i++) {
                    PdfDictionary pdfDict = existingExtensionArray.getAsDictionary(i);
                    if (pdfDict.getAsNumber(PdfName.ExtensionLevel).intValue() == extension.getExtensionLevel()) {
                        return;
                    }
                }
            }
            existingExtensionArray.add(extension.getDeveloperExtensions());
            existingExtensionArray.setModified();
            return;
        }
        PdfDictionary existingExtensionDict = extensions.getAsDictionary(extension.getPrefix());
        if (existingExtensionDict != null) {
            int diff = extension.getBaseVersion().compareTo(existingExtensionDict.getAsName(PdfName.BaseVersion));
            if (diff < 0) {
                return;
            }
            int diff2 = extension.getExtensionLevel() - existingExtensionDict.getAsNumber(PdfName.ExtensionLevel).intValue();
            if (diff2 <= 0) {
                return;
            }
        }
        extensions.put(extension.getPrefix(), extension.getDeveloperExtensions());
    }

    public PdfCollection getCollection() {
        PdfDictionary collectionDictionary = getPdfObject().getAsDictionary(PdfName.Collection);
        if (collectionDictionary != null) {
            return new PdfCollection(collectionDictionary);
        }
        return null;
    }

    public PdfCatalog setCollection(PdfCollection collection) {
        put(PdfName.Collection, collection.getPdfObject());
        return this;
    }

    public PdfCatalog put(PdfName key, PdfObject value) {
        getPdfObject().put(key, value);
        setModified();
        return this;
    }

    public PdfCatalog remove(PdfName key) {
        getPdfObject().remove(key);
        setModified();
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isOCPropertiesMayHaveChanged() {
        return this.ocProperties != null || this.ocgCopied;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setOcgCopied(boolean ocgCopied) {
        this.ocgCopied = ocgCopied;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfPagesTree getPageTree() {
        return this.pageTree;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Map<PdfObject, List<PdfOutline>> getPagesWithOutlines() {
        return this.pagesWithOutlines;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addNamedDestination(PdfString key, PdfObject value) {
        addNameToNameTree(key, value, PdfName.Dests);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addNameToNameTree(PdfString key, PdfObject value, PdfName treeType) {
        getNameTree(treeType).addEntry(key, value);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfOutline getOutlines(boolean updateOutlines) {
        if (this.outlines != null && !updateOutlines) {
            return this.outlines;
        }
        if (this.outlines != null) {
            this.outlines.clear();
            this.pagesWithOutlines.clear();
        }
        this.outlineMode = true;
        PdfNameTree destsTree = getNameTree(PdfName.Dests);
        PdfDictionary outlineRoot = getPdfObject().getAsDictionary(PdfName.Outlines);
        if (outlineRoot == null) {
            if (getDocument().getWriter() == null) {
                return null;
            }
            this.outlines = new PdfOutline(getDocument());
        } else {
            constructOutlines(outlineRoot, destsTree);
        }
        return this.outlines;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean hasOutlines() {
        return getPdfObject().containsKey(PdfName.Outlines);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isOutlineMode() {
        return this.outlineMode;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeOutlines(PdfPage page) {
        if (getDocument().getWriter() != null && hasOutlines()) {
            getOutlines(false);
            if (this.pagesWithOutlines.size() > 0 && this.pagesWithOutlines.get(page.getPdfObject()) != null) {
                for (PdfOutline outline : this.pagesWithOutlines.get(page.getPdfObject())) {
                    outline.removeOutline();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addRootOutline(PdfOutline outline) {
        if (this.outlineMode && this.pagesWithOutlines.size() == 0) {
            put(PdfName.Outlines, outline.getContent());
        }
    }

    void constructOutlines(PdfDictionary outlineRoot, IPdfNameTreeAccess names) {
        PdfCatalog pdfCatalog = this;
        if (outlineRoot == null) {
            return;
        }
        PdfReader reader = pdfCatalog.getDocument().getReader();
        boolean isLenientLevel = reader == null || PdfReader.StrictnessLevel.CONSERVATIVE.isStricter(reader.getStrictnessLevel());
        PdfDictionary current = outlineRoot.getAsDictionary(PdfName.First);
        pdfCatalog.outlines = new PdfOutline(ROOT_OUTLINE_TITLE, outlineRoot, pdfCatalog.getDocument());
        PdfOutline parentOutline = pdfCatalog.outlines;
        Map<PdfOutline, PdfDictionary> nextUnprocessedChildForParentMap = new HashMap<>();
        Set<PdfDictionary> alreadyVisitedOutlinesSet = new HashSet<>();
        while (current != null) {
            PdfDictionary parent = current.getAsDictionary(PdfName.Parent);
            if (parent == null && !isLenientLevel) {
                throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.CORRUPTED_OUTLINE_NO_PARENT_ENTRY, current.indirectReference));
            }
            PdfString title = current.getAsString(PdfName.Title);
            if (title == null) {
                throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.CORRUPTED_OUTLINE_NO_TITLE_ENTRY, current.indirectReference));
            }
            PdfOutline currentOutline = new PdfOutline(title.toUnicodeString(), current, parentOutline);
            alreadyVisitedOutlinesSet.add(current);
            pdfCatalog.addOutlineToPage(currentOutline, current, names);
            parentOutline.getAllChildren().add(currentOutline);
            PdfDictionary first = current.getAsDictionary(PdfName.First);
            PdfDictionary next = current.getAsDictionary(PdfName.Next);
            if (first != null) {
                if (alreadyVisitedOutlinesSet.contains(first)) {
                    if (!isLenientLevel) {
                        throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.CORRUPTED_OUTLINE_DICTIONARY_HAS_INFINITE_LOOP, first));
                    }
                    LOGGER.warn(MessageFormatUtil.format(KernelLogMessageConstant.CORRUPTED_OUTLINE_DICTIONARY_HAS_INFINITE_LOOP, first));
                    return;
                }
                nextUnprocessedChildForParentMap.put(parentOutline, next);
                current = first;
                parentOutline = currentOutline;
            } else if (next != null) {
                if (alreadyVisitedOutlinesSet.contains(next)) {
                    if (!isLenientLevel) {
                        throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.CORRUPTED_OUTLINE_DICTIONARY_HAS_INFINITE_LOOP, next));
                    }
                    LOGGER.warn(MessageFormatUtil.format(KernelLogMessageConstant.CORRUPTED_OUTLINE_DICTIONARY_HAS_INFINITE_LOOP, next));
                    return;
                }
                current = next;
            } else {
                PdfDictionary current2 = null;
                while (current2 == null && parentOutline != null) {
                    parentOutline = parentOutline.getParent();
                    if (parentOutline != null) {
                        PdfDictionary current3 = nextUnprocessedChildForParentMap.get(parentOutline);
                        current2 = current3;
                    }
                }
                current = current2;
            }
            pdfCatalog = this;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfDestination copyDestination(PdfObject dest, Map<PdfPage, PdfPage> page2page, PdfDocument toDocument) {
        if (dest == null) {
            return null;
        }
        PdfDestination d = null;
        if (dest.isArray()) {
            PdfObject pageObject = ((PdfArray) dest).get(0);
            Iterator<PdfPage> it = page2page.keySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                } else if (it.next().getPdfObject() == pageObject) {
                    d = new PdfExplicitDestination((PdfArray) dest.copyTo(toDocument, false, NullCopyFilter.getInstance()));
                    break;
                }
            }
        } else if (dest.isString() || dest.isName()) {
            PdfNameTree destsTree = getNameTree(PdfName.Dests);
            Map<PdfString, PdfObject> dests = destsTree.getNames();
            PdfString srcDestName = dest.isString() ? (PdfString) dest : new PdfString(((PdfName) dest).getValue());
            PdfArray srcDestArray = (PdfArray) dests.get(srcDestName);
            if (srcDestArray != null) {
                PdfObject pageObject2 = srcDestArray.get(0);
                if (pageObject2 instanceof PdfNumber) {
                    pageObject2 = getDocument().getPage(((PdfNumber) pageObject2).intValue() + 1).getPdfObject();
                }
                Iterator<PdfPage> it2 = page2page.keySet().iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    PdfPage oldPage = it2.next();
                    if (oldPage.getPdfObject() == pageObject2) {
                        PdfDestination d2 = new PdfStringDestination(srcDestName);
                        d = d2;
                        if (!isEqualSameNameDestExist(page2page, toDocument, srcDestName, srcDestArray, oldPage)) {
                            PdfArray copiedArray = (PdfArray) srcDestArray.copyTo(toDocument, false);
                            copiedArray.set(0, page2page.get(oldPage).getPdfObject());
                            toDocument.addNamedDestination(srcDestName, copiedArray);
                            d = d2;
                        }
                    }
                }
            }
            return d;
        }
        d = d;
        return d;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfDictionary fillAndGetOcPropertiesDictionary() {
        if (this.ocProperties != null) {
            this.ocProperties.fillDictionary(false);
            getPdfObject().put(PdfName.OCProperties, this.ocProperties.getPdfObject());
            this.ocProperties = null;
        }
        if (getPdfObject().getAsDictionary(PdfName.OCProperties) == null) {
            PdfDictionary pdfDictionary = new PdfDictionary();
            pdfDictionary.makeIndirect(getDocument());
            getDocument().getCatalog().getPdfObject().put(PdfName.OCProperties, pdfDictionary);
        }
        return getPdfObject().getAsDictionary(PdfName.OCProperties);
    }

    private boolean isEqualSameNameDestExist(Map<PdfPage, PdfPage> page2page, PdfDocument toDocument, PdfString srcDestName, PdfArray srcDestArray, PdfPage oldPage) {
        PdfArray sameNameDest = (PdfArray) toDocument.getCatalog().getNameTree(PdfName.Dests).getNames().get(srcDestName);
        boolean equalSameNameDestExists = false;
        if (sameNameDest != null && sameNameDest.getAsDictionary(0) != null) {
            PdfIndirectReference existingDestPageRef = sameNameDest.getAsDictionary(0).getIndirectReference();
            PdfIndirectReference newDestPageRef = page2page.get(oldPage).getPdfObject().getIndirectReference();
            boolean z = existingDestPageRef.equals(newDestPageRef) && sameNameDest.size() == srcDestArray.size();
            equalSameNameDestExists = z;
            if (z) {
                for (int i = 1; i < sameNameDest.size(); i++) {
                    equalSameNameDestExists = equalSameNameDestExists && sameNameDest.get(i).equals(srcDestArray.get(i));
                }
            }
        }
        return equalSameNameDestExists;
    }

    private void addOutlineToPage(PdfOutline outline, IPdfNameTreeAccess names) {
        PdfObject pageObj = outline.getDestination().getDestinationPage(names);
        if (pageObj instanceof PdfNumber) {
            int pageNumber = ((PdfNumber) pageObj).intValue() + 1;
            try {
                pageObj = getDocument().getPage(pageNumber).getPdfObject();
            } catch (IndexOutOfBoundsException e) {
                pageObj = null;
                LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.OUTLINE_DESTINATION_PAGE_NUMBER_IS_OUT_OF_BOUNDS, Integer.valueOf(pageNumber)));
            }
        }
        if (pageObj != null) {
            List<PdfOutline> outs = this.pagesWithOutlines.get(pageObj);
            if (outs == null) {
                outs = new ArrayList();
                this.pagesWithOutlines.put(pageObj, outs);
            }
            outs.add(outline);
        }
    }

    private void addOutlineToPage(PdfOutline outline, PdfDictionary item, IPdfNameTreeAccess names) {
        PdfObject destObject;
        PdfObject dest = item.get(PdfName.Dest);
        if (dest != null) {
            PdfDestination destination = PdfDestination.makeDestination(dest);
            outline.setDestination(destination);
            addOutlineToPage(outline, names);
            return;
        }
        PdfDictionary action = item.getAsDictionary(PdfName.A);
        if (action != null) {
            PdfName actionType = action.getAsName(PdfName.S);
            if (PdfName.GoTo.equals(actionType) && (destObject = action.get(PdfName.D)) != null) {
                PdfDestination destination2 = PdfDestination.makeDestination(destObject);
                outline.setDestination(destination2);
                addOutlineToPage(outline, names);
            }
        }
    }
}
