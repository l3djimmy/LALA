package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.kernel.actions.data.ITextCoreProductData;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfXrefTable {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private static final int INITIAL_CAPACITY = 32;
    private static final int MAX_GENERATION = 65535;
    private static final long MAX_OFFSET_IN_CROSS_REFERENCE_STREAM = 9999999999L;
    private static final byte[] freeXRefEntry = ByteUtils.getIsoBytes("f \n");
    private static final byte[] inUseXRefEntry = ByteUtils.getIsoBytes("n \n");
    private int count;
    private final TreeMap<Integer, PdfIndirectReference> freeReferencesLinkedList;
    private MemoryLimitsAwareHandler memoryLimitsAwareHandler;
    private boolean readingCompleted;
    private PdfIndirectReference[] xref;

    public PdfXrefTable() {
        this(32);
    }

    public PdfXrefTable(int capacity) {
        this(capacity, null);
    }

    public PdfXrefTable(MemoryLimitsAwareHandler memoryLimitsAwareHandler) {
        this(32, memoryLimitsAwareHandler);
    }

    public PdfXrefTable(int capacity, MemoryLimitsAwareHandler memoryLimitsAwareHandler) {
        this.count = 0;
        if (capacity < 1) {
            capacity = memoryLimitsAwareHandler != null ? Math.min(32, memoryLimitsAwareHandler.getMaxNumberOfElementsInXrefStructure()) : 32;
        }
        this.memoryLimitsAwareHandler = memoryLimitsAwareHandler;
        if (this.memoryLimitsAwareHandler != null) {
            this.memoryLimitsAwareHandler.checkIfXrefStructureExceedsTheLimit(capacity);
        }
        this.xref = new PdfIndirectReference[capacity];
        this.freeReferencesLinkedList = new TreeMap<>();
        add((PdfIndirectReference) new PdfIndirectReference(null, 0, 65535, 0L).setState((short) 2));
    }

    public void setMemoryLimitsAwareHandler(MemoryLimitsAwareHandler memoryLimitsAwareHandler) {
        this.memoryLimitsAwareHandler = memoryLimitsAwareHandler;
    }

    public PdfIndirectReference add(PdfIndirectReference reference) {
        if (reference == null) {
            return null;
        }
        int objNr = reference.getObjNumber();
        this.count = Math.max(this.count, objNr);
        ensureCount(objNr);
        this.xref[objNr] = reference;
        return reference;
    }

    public int size() {
        return this.count + 1;
    }

    public int getCountOfIndirectObjects() {
        PdfIndirectReference[] pdfIndirectReferenceArr;
        int countOfIndirectObjects = 0;
        for (PdfIndirectReference ref : this.xref) {
            if (ref != null && !ref.isFree()) {
                countOfIndirectObjects++;
            }
        }
        return countOfIndirectObjects;
    }

    public PdfIndirectReference get(int index) {
        if (index > this.count) {
            return null;
        }
        return this.xref[index];
    }

    protected static void writeKeyInfo(PdfDocument document) {
        PdfWriter writer = document.getWriter();
        Collection<ProductData> products = document.getFingerPrint().getProducts();
        if (products.isEmpty()) {
            writer.writeString(MessageFormatUtil.format("%iText-{0}-no-registered-products\n", ITextCoreProductData.getInstance().getVersion()));
            return;
        }
        for (ProductData productData : products) {
            writer.writeString(MessageFormatUtil.format("%iText-{0}-{1}\n", productData.getPublicProductName(), productData.getVersion()));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfIndirectReference createNextIndirectReference(PdfDocument document) {
        int i = this.count + 1;
        this.count = i;
        PdfIndirectReference reference = new PdfIndirectReference(document, i);
        add(reference);
        return (PdfIndirectReference) reference.setState((short) 8);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void freeReference(PdfIndirectReference reference) {
        if (reference.isFree()) {
            return;
        }
        if (reference.checkState((short) 32)) {
            Logger logger = LoggerFactory.getLogger(PdfXrefTable.class);
            logger.error(IoLogMessageConstant.INDIRECT_REFERENCE_USED_IN_FLUSHED_OBJECT_MADE_FREE);
        } else if (reference.checkState((short) 1)) {
            Logger logger2 = LoggerFactory.getLogger(PdfXrefTable.class);
            logger2.error(IoLogMessageConstant.ALREADY_FLUSHED_INDIRECT_OBJECT_MADE_FREE);
        } else {
            reference.setState((short) 2).setState((short) 8);
            appendNewRefToFreeList(reference);
            if (reference.getGenNumber() < 65535) {
                reference.genNr++;
            }
        }
    }

    protected int getCapacity() {
        return this.xref.length;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCapacity(int capacity) {
        if (capacity > this.xref.length) {
            extendXref(capacity);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void writeXrefTableAndTrailer(PdfDocument document, PdfObject fileId, PdfObject crypto) throws IOException {
        int i;
        List<Integer> sections;
        long xRefStmPos;
        List<Integer> sections2;
        PdfArray index;
        int i2;
        PdfXrefTable xrefTable;
        int i3;
        List<Integer> sections3;
        PdfWriter writer = document.getWriter();
        if (!document.properties.appendMode) {
            for (int i4 = this.count; i4 > 0; i4--) {
                PdfIndirectReference lastRef = this.xref[i4];
                if (lastRef != null && !lastRef.isFree()) {
                    break;
                }
                removeFreeRefFromList(i4);
                this.count--;
            }
        }
        PdfStream xrefStream = null;
        if (writer.isFullCompression()) {
            xrefStream = new PdfStream();
            xrefStream.makeIndirect(document);
        }
        List<Integer> sections4 = createSections(document, false);
        boolean noModifiedObjects = sections4.size() == 0 || (xrefStream != null && sections4.size() == 2 && sections4.get(0).intValue() == this.count && sections4.get(1).intValue() == 1);
        if (!document.properties.appendMode || !noModifiedObjects) {
            document.checkIsoConformance(this, IsoKey.XREF_TABLE);
            long startxref = writer.getCurrentPos();
            if (xrefStream == null) {
                i = 0;
                sections = sections4;
                xRefStmPos = -1;
            } else {
                xrefStream.put(PdfName.Type, PdfName.XRef);
                xrefStream.put(PdfName.ID, fileId);
                if (crypto != null) {
                    xrefStream.put(PdfName.Encrypt, crypto);
                }
                int i5 = 0;
                xrefStream.put(PdfName.Size, new PdfNumber(size()));
                int offsetSize = getOffsetSize(Math.max(startxref, size()));
                xrefStream.put(PdfName.W, new PdfArray(Arrays.asList(new PdfNumber(1), new PdfNumber(offsetSize), new PdfNumber(2))));
                xrefStream.put(PdfName.Info, document.getDocumentInfo().getPdfObject());
                xrefStream.put(PdfName.Root, document.getCatalog().getPdfObject());
                PdfArray index2 = new PdfArray();
                for (Integer section : sections4) {
                    index2.add(new PdfNumber(section.intValue()));
                }
                if (document.properties.appendMode && !document.reader.hybridXref) {
                    PdfNumber lastXref = new PdfNumber(document.reader.getLastXref());
                    xrefStream.put(PdfName.Prev, lastXref);
                }
                xrefStream.put(PdfName.Index, index2);
                xrefStream.getIndirectReference().setOffset(startxref);
                PdfXrefTable xrefTable2 = document.getXref();
                int k = 0;
                while (k < sections4.size()) {
                    int first = sections4.get(k).intValue();
                    int len = sections4.get(k + 1).intValue();
                    PdfStream xrefStream2 = xrefStream;
                    int i6 = first;
                    while (true) {
                        index = index2;
                        if (i6 < first + len) {
                            PdfIndirectReference reference = xrefTable2.get(i6);
                            if (reference.isFree()) {
                                i2 = i6;
                                i3 = i5;
                                xrefStream2.getOutputStream().write(i3);
                                sections3 = sections4;
                                xrefTable = xrefTable2;
                                xrefStream2.getOutputStream().write(reference.getOffset(), offsetSize);
                                xrefStream2.getOutputStream().write(reference.getGenNumber(), 2);
                            } else {
                                i2 = i6;
                                xrefTable = xrefTable2;
                                i3 = i5;
                                sections3 = sections4;
                                int i7 = reference.getObjStreamNumber();
                                if (i7 == 0) {
                                    xrefStream2.getOutputStream().write(1);
                                    xrefStream2.getOutputStream().write(reference.getOffset(), offsetSize);
                                    xrefStream2.getOutputStream().write(reference.getGenNumber(), 2);
                                } else {
                                    xrefStream2.getOutputStream().write(2);
                                    xrefStream2.getOutputStream().write(reference.getObjStreamNumber(), offsetSize);
                                    xrefStream2.getOutputStream().write(reference.getIndex(), 2);
                                }
                            }
                            i6 = i2 + 1;
                            sections4 = sections3;
                            xrefTable2 = xrefTable;
                            i5 = i3;
                            index2 = index;
                        }
                    }
                    k += 2;
                    xrefStream = xrefStream2;
                    xrefTable2 = xrefTable2;
                    i5 = i5;
                    index2 = index;
                }
                i = i5;
                sections = sections4;
                xrefStream.flush();
                xRefStmPos = startxref;
            }
            if (!writer.isFullCompression() || (document.properties.appendMode && document.reader.hybridXref)) {
                i = 1;
            }
            if (i != 0) {
                startxref = writer.getCurrentPos();
                writer.writeString("xref\n");
                PdfXrefTable xrefTable3 = document.getXref();
                long j = -1;
                if (xRefStmPos != -1) {
                    sections2 = createSections(document, true);
                } else {
                    sections2 = sections;
                }
                int k2 = 0;
                while (true) {
                    long j2 = j;
                    if (k2 < sections2.size()) {
                        int first2 = sections2.get(k2).intValue();
                        int len2 = sections2.get(k2 + 1).intValue();
                        int i8 = i;
                        writer.writeInteger(first2).writeSpace().writeInteger(len2).writeByte((byte) 10);
                        int i9 = first2;
                        while (i9 < first2 + len2) {
                            PdfIndirectReference reference2 = xrefTable3.get(i9);
                            if (reference2.getOffset() > MAX_OFFSET_IN_CROSS_REFERENCE_STREAM) {
                                throw new PdfException(KernelExceptionMessageConstant.XREF_HAS_AN_ENTRY_WITH_TOO_BIG_OFFSET);
                            }
                            PdfXrefTable xrefTable4 = xrefTable3;
                            int i10 = i9;
                            int first3 = first2;
                            StringBuilder off = new StringBuilder("0000000000").append(reference2.getOffset());
                            StringBuilder gen = new StringBuilder("00000").append(reference2.getGenNumber());
                            writer.writeString(off.substring(off.length() - 10, off.length())).writeSpace().writeString(gen.substring(gen.length() - 5, gen.length())).writeSpace();
                            if (reference2.isFree()) {
                                writer.writeBytes(freeXRefEntry);
                            } else {
                                writer.writeBytes(inUseXRefEntry);
                            }
                            i9 = i10 + 1;
                            xrefTable3 = xrefTable4;
                            first2 = first3;
                        }
                        k2 += 2;
                        i = i8;
                        j = j2;
                    } else {
                        PdfDictionary trailer = document.getTrailer();
                        trailer.remove(PdfName.W);
                        trailer.remove(PdfName.Index);
                        trailer.remove(PdfName.Type);
                        trailer.remove(PdfName.Length);
                        trailer.put(PdfName.Size, new PdfNumber(size()));
                        trailer.put(PdfName.ID, fileId);
                        if (xRefStmPos != j2) {
                            trailer.put(PdfName.XRefStm, new PdfNumber(xRefStmPos));
                        }
                        if (crypto != null) {
                            trailer.put(PdfName.Encrypt, crypto);
                        }
                        writer.writeString("trailer\n");
                        if (document.properties.appendMode) {
                            PdfNumber lastXref2 = new PdfNumber(document.reader.getLastXref());
                            trailer.put(PdfName.Prev, lastXref2);
                        }
                        writer.write((PdfObject) document.getTrailer());
                        writer.write(10);
                    }
                }
            }
            writeKeyInfo(document);
            writer.writeString("startxref\n").writeLong(startxref).writeString("\n%%EOF\n");
            this.xref = null;
            this.freeReferencesLinkedList.clear();
            return;
        }
        this.xref = null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void markReadingCompleted() {
        this.readingCompleted = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unmarkReadingCompleted() {
        this.readingCompleted = false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isReadingCompleted() {
        return this.readingCompleted;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void initFreeReferencesList(com.itextpdf.kernel.pdf.PdfDocument r11) {
        /*
            Method dump skipped, instructions count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.PdfXrefTable.initFreeReferencesList(com.itextpdf.kernel.pdf.PdfDocument):void");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PdfIndirectReference createNewIndirectReference(PdfDocument document) {
        int i = this.count + 1;
        this.count = i;
        PdfIndirectReference reference = new PdfIndirectReference(document, i);
        add(reference);
        return (PdfIndirectReference) reference.setState((short) 8);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear() {
        for (int i = 1; i <= this.count; i++) {
            if (this.xref[i] == null || !this.xref[i].isFree()) {
                this.xref[i] = null;
            }
        }
        this.count = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clearAllReferences() {
        for (int i = 1; i <= this.count; i++) {
            this.xref[i] = null;
        }
        this.count = 1;
    }

    private List<Integer> createSections(PdfDocument document, boolean dropObjectsFromObjectStream) {
        List<Integer> sections = new ArrayList<>();
        int first = 0;
        int len = 0;
        for (int i = 0; i < size(); i++) {
            PdfIndirectReference reference = this.xref[i];
            if (document.properties.appendMode && reference != null && (!reference.checkState((short) 8) || (dropObjectsFromObjectStream && reference.getObjStreamNumber() != 0))) {
                reference = null;
            }
            if (reference == null) {
                if (len > 0) {
                    sections.add(Integer.valueOf(first));
                    sections.add(Integer.valueOf(len));
                }
                len = 0;
            } else if (len > 0) {
                len++;
            } else {
                first = i;
                len = 1;
            }
        }
        if (len > 0) {
            sections.add(Integer.valueOf(first));
            sections.add(Integer.valueOf(len));
        }
        return sections;
    }

    private int getOffsetSize(long startxref) {
        if (startxref < 0 || startxref >= 1099511627776L) {
            throw new AssertionError();
        }
        int size = 5;
        long mask = 1095216660480L;
        while (size > 1 && (mask & startxref) == 0) {
            mask >>= 8;
            size--;
        }
        return size;
    }

    private void appendNewRefToFreeList(PdfIndirectReference reference) {
        reference.setOffset(0L);
        if (this.freeReferencesLinkedList.isEmpty()) {
            throw new AssertionError();
        }
        PdfIndirectReference lastFreeRef = this.freeReferencesLinkedList.get(0);
        ((PdfIndirectReference) lastFreeRef.setState((short) 8)).setOffset(reference.getObjNumber());
        this.freeReferencesLinkedList.put(Integer.valueOf(reference.getObjNumber()), lastFreeRef);
        this.freeReferencesLinkedList.put(0, reference);
    }

    private PdfIndirectReference removeFreeRefFromList(int freeRefObjNr) {
        if (this.freeReferencesLinkedList.isEmpty()) {
            throw new AssertionError();
        }
        if (freeRefObjNr == 0) {
            return null;
        }
        if (freeRefObjNr < 0) {
            Integer leastFreeRefObjNum = null;
            Iterator<Map.Entry<Integer, PdfIndirectReference>> it = this.freeReferencesLinkedList.entrySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Map.Entry<Integer, PdfIndirectReference> entry = it.next();
                if (entry.getKey().intValue() > 0 && this.xref[entry.getKey().intValue()].getGenNumber() < 65535) {
                    Integer leastFreeRefObjNum2 = entry.getKey();
                    leastFreeRefObjNum = leastFreeRefObjNum2;
                    break;
                }
            }
            if (leastFreeRefObjNum == null) {
                return null;
            }
            freeRefObjNr = leastFreeRefObjNum.intValue();
        }
        PdfIndirectReference freeRef = this.xref[freeRefObjNr];
        if (!freeRef.isFree()) {
            return null;
        }
        PdfIndirectReference prevFreeRef = this.freeReferencesLinkedList.remove(Integer.valueOf(freeRef.getObjNumber()));
        if (prevFreeRef != null) {
            this.freeReferencesLinkedList.put(Integer.valueOf((int) freeRef.getOffset()), prevFreeRef);
            ((PdfIndirectReference) prevFreeRef.setState((short) 8)).setOffset(freeRef.getOffset());
        }
        return freeRef;
    }

    private void ensureCount(int count) {
        if (count >= this.xref.length) {
            extendXref(count << 1);
        }
    }

    private void extendXref(int capacity) {
        if (this.memoryLimitsAwareHandler != null) {
            this.memoryLimitsAwareHandler.checkIfXrefStructureExceedsTheLimit(capacity);
        }
        PdfIndirectReference[] newXref = new PdfIndirectReference[capacity];
        System.arraycopy(this.xref, 0, newXref, 0, this.xref.length);
        this.xref = newXref;
    }
}
