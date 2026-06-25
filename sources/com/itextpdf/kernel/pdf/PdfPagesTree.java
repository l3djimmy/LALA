package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class PdfPagesTree {
    static final int DEFAULT_LEAF_SIZE = 10;
    private static final Logger LOGGER = LoggerFactory.getLogger(PdfPagesTree.class);
    private PdfDocument document;
    private PdfPages root;
    private final int leafSize = 10;
    private boolean generated = false;
    private NullUnlimitedList<PdfIndirectReference> pageRefs = new NullUnlimitedList<>();
    private List<PdfPages> parents = new ArrayList();
    private NullUnlimitedList<PdfPage> pages = new NullUnlimitedList<>();

    public PdfPagesTree(PdfCatalog pdfCatalog) {
        this.document = pdfCatalog.getDocument();
        if (pdfCatalog.getPdfObject().containsKey(PdfName.Pages)) {
            PdfDictionary pages = pdfCatalog.getPdfObject().getAsDictionary(PdfName.Pages);
            if (pages == null) {
                throw new PdfException(KernelExceptionMessageConstant.INVALID_PAGE_STRUCTURE_PAGES_MUST_BE_PDF_DICTIONARY);
            }
            this.root = new PdfPages(0, Integer.MAX_VALUE, pages, null);
            this.parents.add(this.root);
            for (int i = 0; i < this.root.getCount(); i++) {
                this.pageRefs.add(null);
                this.pages.add(null);
            }
            return;
        }
        this.root = null;
        this.parents.add(new PdfPages(0, this.document));
    }

    public PdfPage getPage(int pageNum) {
        if (pageNum < 1 || pageNum > getNumberOfPages()) {
            throw new IndexOutOfBoundsException(MessageFormatUtil.format(KernelExceptionMessageConstant.REQUESTED_PAGE_NUMBER_IS_OUT_OF_BOUNDS, Integer.valueOf(pageNum)));
        }
        int pageNum2 = pageNum - 1;
        PdfPage pdfPage = this.pages.get(pageNum2);
        if (pdfPage == null) {
            loadPage(pageNum2);
            if (this.pageRefs.get(pageNum2) != null) {
                int parentIndex = findPageParent(pageNum2);
                PdfObject pageObject = this.pageRefs.get(pageNum2).getRefersTo();
                if (pageObject instanceof PdfDictionary) {
                    pdfPage = this.document.getPageFactory().createPdfPage((PdfDictionary) pageObject);
                    pdfPage.parentPages = this.parents.get(parentIndex);
                } else {
                    LOGGER.error(MessageFormatUtil.format(IoLogMessageConstant.PAGE_TREE_IS_BROKEN_FAILED_TO_RETRIEVE_PAGE, Integer.valueOf(pageNum2 + 1)));
                }
            } else {
                LOGGER.error(MessageFormatUtil.format(IoLogMessageConstant.PAGE_TREE_IS_BROKEN_FAILED_TO_RETRIEVE_PAGE, Integer.valueOf(pageNum2 + 1)));
            }
            this.pages.set(pageNum2, pdfPage);
        }
        if (pdfPage == null) {
            throw new PdfException(MessageFormatUtil.format(IoLogMessageConstant.PAGE_TREE_IS_BROKEN_FAILED_TO_RETRIEVE_PAGE, Integer.valueOf(pageNum2 + 1)));
        }
        return pdfPage;
    }

    public PdfPage getPage(PdfDictionary pageDictionary) {
        int pageNum = getPageNumber(pageDictionary);
        if (pageNum > 0) {
            return getPage(pageNum);
        }
        return null;
    }

    public int getNumberOfPages() {
        return this.pageRefs.size();
    }

    public int getPageNumber(PdfPage page) {
        return this.pages.indexOf(page) + 1;
    }

    public int getPageNumber(PdfDictionary pageDictionary) {
        int pageNum = this.pageRefs.indexOf(pageDictionary.getIndirectReference());
        if (pageNum >= 0) {
            return pageNum + 1;
        }
        for (int i = 0; i < this.pageRefs.size(); i++) {
            if (this.pageRefs.get(i) == null) {
                loadPage(i);
            }
            if (this.pageRefs.get(i).equals(pageDictionary.getIndirectReference())) {
                return i + 1;
            }
        }
        return 0;
    }

    public void addPage(PdfPage pdfPage) {
        PdfPages pdfPages;
        if (this.root != null) {
            if (this.pageRefs.size() == 0) {
                pdfPages = this.root;
            } else {
                loadPage(this.pageRefs.size() - 1);
                pdfPages = this.parents.get(this.parents.size() - 1);
            }
        } else {
            pdfPages = this.parents.get(this.parents.size() - 1);
            if (pdfPages.getCount() % 10 == 0 && this.pageRefs.size() > 0) {
                pdfPages = new PdfPages(pdfPages.getFrom() + pdfPages.getCount(), this.document);
                this.parents.add(pdfPages);
            }
        }
        pdfPage.makeIndirect(this.document);
        pdfPages.addPage(pdfPage.getPdfObject());
        pdfPage.parentPages = pdfPages;
        this.pageRefs.add(pdfPage.getPdfObject().getIndirectReference());
        this.pages.add(pdfPage);
    }

    public void addPage(int index, PdfPage pdfPage) {
        int index2 = index - 1;
        if (index2 > this.pageRefs.size()) {
            throw new IndexOutOfBoundsException("index");
        }
        if (index2 == this.pageRefs.size()) {
            addPage(pdfPage);
            return;
        }
        loadPage(index2);
        pdfPage.makeIndirect(this.document);
        int parentIndex = findPageParent(index2);
        PdfPages parentPages = this.parents.get(parentIndex);
        parentPages.addPage(index2, pdfPage);
        pdfPage.parentPages = parentPages;
        correctPdfPagesFromProperty(parentIndex + 1, 1);
        this.pageRefs.add(index2, pdfPage.getPdfObject().getIndirectReference());
        this.pages.add(index2, pdfPage);
    }

    public PdfPage removePage(int pageNum) {
        PdfPage pdfPage = getPage(pageNum);
        if (pdfPage.isFlushed()) {
            LOGGER.warn(IoLogMessageConstant.REMOVING_PAGE_HAS_ALREADY_BEEN_FLUSHED);
        }
        if (internalRemovePage(pageNum - 1)) {
            return pdfPage;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void releasePage(int pageNumber) {
        int pageNumber2 = pageNumber - 1;
        if (this.pageRefs.get(pageNumber2) != null && !this.pageRefs.get(pageNumber2).checkState((short) 1) && !this.pageRefs.get(pageNumber2).checkState((short) 8)) {
            if (this.pageRefs.get(pageNumber2).getOffset() > 0 || this.pageRefs.get(pageNumber2).getIndex() >= 0) {
                this.pages.set(pageNumber2, null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject generateTree() {
        if (this.pageRefs.size() == 0) {
            LOGGER.info(IoLogMessageConstant.ATTEMPT_TO_GENERATE_PDF_PAGES_TREE_WITHOUT_ANY_PAGES);
            this.document.addNewPage();
        }
        if (this.generated) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_PAGES_TREE_COULD_BE_GENERATED_ONLY_ONCE);
        }
        if (this.root == null) {
            while (this.parents.size() != 1) {
                List<PdfPages> nextParents = new ArrayList<>();
                int dynamicLeafSize = 10;
                PdfPages current = null;
                for (int i = 0; i < this.parents.size(); i++) {
                    PdfPages pages = this.parents.get(i);
                    int pageCount = pages.getCount();
                    if (i % dynamicLeafSize == 0) {
                        if (pageCount <= 1) {
                            dynamicLeafSize++;
                        } else {
                            PdfPages current2 = new PdfPages(-1, this.document);
                            nextParents.add(current2);
                            dynamicLeafSize = 10;
                            current = current2;
                        }
                    }
                    current.addPages(pages);
                }
                this.parents = nextParents;
            }
            this.root = this.parents.get(0);
        }
        this.generated = true;
        return this.root.getPdfObject();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void clearPageRefs() {
        this.pageRefs = null;
        this.pages = null;
    }

    protected List<PdfPages> getParents() {
        return this.parents;
    }

    protected PdfPages getRoot() {
        return this.root;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfPages findPageParent(PdfPage pdfPage) {
        int pageNum = getPageNumber(pdfPage) - 1;
        int parentIndex = findPageParent(pageNum);
        return this.parents.get(parentIndex);
    }

    private void loadPage(int pageNum) {
        loadPage(pageNum, new HashSet());
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void loadPage(int pageNum, Set<PdfIndirectReference> processedParents) {
        int from;
        PdfIndirectReference targetPage = this.pageRefs.get(pageNum);
        if (targetPage != null) {
            return;
        }
        int parentIndex = findPageParent(pageNum);
        PdfPages parent = this.parents.get(parentIndex);
        PdfIndirectReference parentIndirectReference = parent.getPdfObject().getIndirectReference();
        if (parentIndirectReference != null) {
            if (processedParents.contains(parentIndirectReference)) {
                throw new PdfException(KernelExceptionMessageConstant.INVALID_PAGE_STRUCTURE).setMessageParams(Integer.valueOf(pageNum + 1));
            }
            processedParents.add(parentIndirectReference);
        }
        PdfArray kids = parent.getKids();
        if (kids == null) {
            throw new PdfException(KernelExceptionMessageConstant.INVALID_PAGE_STRUCTURE).setMessageParams(Integer.valueOf(pageNum + 1));
        }
        int kidsCount = parent.getCount();
        boolean findPdfPages = false;
        for (int i = 0; i < kids.size(); i++) {
            PdfDictionary page = kids.getAsDictionary(i);
            if (page == null) {
                throw new PdfException(KernelExceptionMessageConstant.INVALID_PAGE_STRUCTURE).setMessageParams(Integer.valueOf(pageNum + 1));
            }
            PdfObject pageKids = page.get(PdfName.Kids);
            if (pageKids != null) {
                if (pageKids.isArray()) {
                    findPdfPages = true;
                } else {
                    throw new PdfException(KernelExceptionMessageConstant.INVALID_PAGE_STRUCTURE).setMessageParams(Integer.valueOf(pageNum + 1));
                }
            }
            if (this.document.getReader().isMemorySavingMode() && !findPdfPages && parent.getFrom() + i != pageNum) {
                page.release();
            }
        }
        if (findPdfPages) {
            List<PdfPages> newParents = new ArrayList<>(kids.size());
            PdfPages lastPdfPages = null;
            int i2 = 0;
            while (i2 < kids.size() && kidsCount > 0) {
                PdfDictionary pdfPagesObject = kids.getAsDictionary(i2);
                if (pdfPagesObject.getAsArray(PdfName.Kids) == null) {
                    if (lastPdfPages == null) {
                        lastPdfPages = new PdfPages(parent.getFrom(), this.document, parent);
                        kids.set(i2, lastPdfPages.getPdfObject());
                        newParents.add(lastPdfPages);
                    } else {
                        kids.remove(i2);
                        i2--;
                    }
                    parent.decrementCount();
                    lastPdfPages.addPage(pdfPagesObject);
                    kidsCount--;
                } else {
                    if (lastPdfPages == null) {
                        from = parent.getFrom();
                    } else {
                        from = lastPdfPages.getFrom() + lastPdfPages.getCount();
                    }
                    PdfPages lastPdfPages2 = new PdfPages(from, kidsCount, pdfPagesObject, parent);
                    newParents.add(lastPdfPages2);
                    kidsCount -= lastPdfPages2.getCount();
                    lastPdfPages = lastPdfPages2;
                }
                i2++;
            }
            this.parents.remove(parentIndex);
            for (int i3 = newParents.size() - 1; i3 >= 0; i3--) {
                this.parents.add(parentIndex, newParents.get(i3));
            }
            loadPage(pageNum, processedParents);
            return;
        }
        int from2 = parent.getFrom();
        int pageCount = Math.min(parent.getCount(), kids.size());
        for (int i4 = 0; i4 < pageCount; i4++) {
            PdfObject kid = kids.get(i4, false);
            boolean z = kid instanceof PdfIndirectReference;
            NullUnlimitedList<PdfIndirectReference> nullUnlimitedList = this.pageRefs;
            if (z) {
                nullUnlimitedList.set(from2 + i4, (PdfIndirectReference) kid);
            } else {
                nullUnlimitedList.set(from2 + i4, kid.getIndirectReference());
            }
        }
    }

    private boolean internalRemovePage(int pageNum) {
        int parentIndex = findPageParent(pageNum);
        PdfPages pdfPages = this.parents.get(parentIndex);
        if (pdfPages.removePage(pageNum)) {
            if (pdfPages.getCount() == 0) {
                this.parents.remove(parentIndex);
                pdfPages.removeFromParent();
                parentIndex--;
            }
            if (this.parents.size() == 0) {
                this.root = null;
                this.parents.add(new PdfPages(0, this.document));
            } else {
                correctPdfPagesFromProperty(parentIndex + 1, -1);
            }
            this.pageRefs.remove(pageNum);
            this.pages.remove(pageNum);
            return true;
        }
        return false;
    }

    private int findPageParent(int pageNum) {
        int low = 0;
        int high = this.parents.size() - 1;
        while (low != high) {
            int middle = ((low + high) + 1) / 2;
            if (this.parents.get(middle).compareTo(pageNum) > 0) {
                high = middle - 1;
            } else {
                low = middle;
            }
        }
        return low;
    }

    private void correctPdfPagesFromProperty(int index, int correction) {
        for (int i = index; i < this.parents.size(); i++) {
            if (this.parents.get(i) != null) {
                this.parents.get(i).correctFrom(correction);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static final class NullUnlimitedList<T> {
        private final Map<Integer, T> map = new HashMap();
        private int size = 0;

        NullUnlimitedList() {
        }

        public void add(T element) {
            if (element == null) {
                this.size++;
                return;
            }
            Map<Integer, T> map = this.map;
            int i = this.size;
            this.size = i + 1;
            map.put(Integer.valueOf(i), element);
        }

        public void add(int index, T element) {
            if (index < 0 || index > this.size) {
                return;
            }
            this.size++;
            T previous = this.map.get(Integer.valueOf(index));
            for (int i = index + 1; i < this.size; i++) {
                T currentToAdd = previous;
                previous = this.map.get(Integer.valueOf(i));
                set(i, currentToAdd);
            }
            set(index, element);
        }

        public T get(int index) {
            return this.map.get(Integer.valueOf(index));
        }

        public void set(int index, T element) {
            Map<Integer, T> map = this.map;
            if (element == null) {
                map.remove(Integer.valueOf(index));
            } else {
                map.put(Integer.valueOf(index), element);
            }
        }

        public int indexOf(T element) {
            if (element == null) {
                for (int i = 0; i < this.size; i++) {
                    if (!this.map.containsKey(Integer.valueOf(i))) {
                        return i;
                    }
                }
                return -1;
            }
            for (Map.Entry<Integer, T> entry : this.map.entrySet()) {
                if (element.equals(entry.getValue())) {
                    return entry.getKey().intValue();
                }
            }
            return -1;
        }

        public void remove(int index) {
            if (index < 0 || index >= this.size) {
                return;
            }
            this.map.remove(Integer.valueOf(index));
            T previous = this.map.get(Integer.valueOf(this.size - 1));
            int i = this.size - 2;
            while (true) {
                Map<Integer, T> map = this.map;
                if (i >= index) {
                    T current = previous;
                    previous = map.get(Integer.valueOf(i));
                    set(i, current);
                    i--;
                } else {
                    int i2 = this.size;
                    int i3 = i2 - 1;
                    this.size = i3;
                    map.remove(Integer.valueOf(i3));
                    return;
                }
            }
        }

        public int size() {
            return this.size;
        }
    }
}
