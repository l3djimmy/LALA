package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class GenericNameTree implements IPdfNameTreeAccess {
    private static final Logger LOGGER = LoggerFactory.getLogger(GenericNameTree.class);
    private static final int NODE_SIZE = 40;
    private LinkedHashMap<PdfString, PdfObject> items = new LinkedHashMap<>();
    private boolean modified;
    private final PdfDocument pdfDoc;

    /* JADX INFO: Access modifiers changed from: protected */
    public GenericNameTree(PdfDocument pdfDoc) {
        this.pdfDoc = pdfDoc;
    }

    public void addEntry(PdfString key, PdfObject value) {
        addEntry(key, value, null);
    }

    public void addEntry(String key, PdfObject value) {
        addEntry(new PdfString(key, (String) null), value);
    }

    public void removeEntry(PdfString key) {
        PdfObject existingVal = this.items.remove(key);
        if (existingVal != null) {
            this.modified = true;
        }
    }

    @Override // com.itextpdf.kernel.pdf.IPdfNameTreeAccess
    public PdfObject getEntry(PdfString key) {
        return this.items.get(key);
    }

    @Override // com.itextpdf.kernel.pdf.IPdfNameTreeAccess
    public PdfObject getEntry(String key) {
        return getEntry(new PdfString(key));
    }

    @Override // com.itextpdf.kernel.pdf.IPdfNameTreeAccess
    public Set<PdfString> getKeys() {
        return new LinkedHashSet(this.items.keySet());
    }

    public boolean isModified() {
        return this.modified;
    }

    public void setModified() {
        this.modified = true;
    }

    public PdfDictionary buildTree() {
        PdfString[] names = (PdfString[]) this.items.keySet().toArray(new PdfString[0]);
        Arrays.sort(names, new PdfStringComparator());
        if (names.length <= 40) {
            PdfDictionary dic = new PdfDictionary();
            PdfArray ar = new PdfArray();
            for (PdfString name : names) {
                ar.add(name);
                ar.add(this.items.get(name));
            }
            dic.put(PdfName.Names, ar);
            return dic;
        }
        PdfDictionary[] leaves = constructLeafArr(names);
        return reduceTree(names, leaves, leaves.length, 1600);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void addEntry(PdfString key, PdfObject value, Consumer<PdfDocument> onErrorAction) {
        PdfObject existingVal = this.items.get(key);
        if (existingVal != null) {
            PdfIndirectReference valueRef = value.getIndirectReference();
            if (valueRef != null && valueRef.equals(existingVal.getIndirectReference())) {
                return;
            }
            LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.NAME_ALREADY_EXISTS_IN_THE_NAME_TREE, key));
            if (onErrorAction != null) {
                onErrorAction.accept(this.pdfDoc);
            }
        }
        this.modified = true;
        this.items.put(key, value);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void setItems(LinkedHashMap<PdfString, PdfObject> items) {
        this.items = items;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final LinkedHashMap<PdfString, PdfObject> getItems() {
        return this.items;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static LinkedHashMap<PdfString, PdfObject> readTree(PdfDictionary dictionary) {
        LinkedHashMap<PdfString, PdfObject> items = new LinkedHashMap<>();
        if (dictionary != null) {
            iterateItems(dictionary, items, null);
        }
        return items;
    }

    private PdfDictionary formatNodeWithLimits(PdfString[] names, int lower, int upper) {
        PdfDictionary dic = new PdfDictionary();
        dic.makeIndirect(this.pdfDoc);
        PdfArray limitsArr = new PdfArray();
        limitsArr.add(names[lower]);
        limitsArr.add(names[upper]);
        dic.put(PdfName.Limits, limitsArr);
        return dic;
    }

    private PdfDictionary reduceTree(PdfString[] names, PdfDictionary[] topLayer, int topLayerLen, int curNodeSpan) {
        if (topLayerLen <= 40) {
            PdfArray kidsArr = new PdfArray();
            for (int i = 0; i < topLayerLen; i++) {
                kidsArr.add(topLayer[i]);
            }
            PdfDictionary root = new PdfDictionary();
            root.put(PdfName.Kids, kidsArr);
            return root;
        }
        int nextLayerLen = ((names.length + curNodeSpan) - 1) / curNodeSpan;
        for (int i2 = 0; i2 < nextLayerLen; i2++) {
            int lowerLimit = i2 * curNodeSpan;
            int upperLimit = Math.min((i2 + 1) * curNodeSpan, names.length) - 1;
            PdfDictionary dic = formatNodeWithLimits(names, lowerLimit, upperLimit);
            PdfArray kidsArr2 = new PdfArray();
            int offset = i2 * 40;
            int end = Math.min(offset + 40, topLayerLen);
            while (offset < end) {
                kidsArr2.add(topLayer[offset]);
                offset++;
            }
            dic.put(PdfName.Kids, kidsArr2);
            topLayer[i2] = dic;
        }
        int i3 = curNodeSpan * 40;
        return reduceTree(names, topLayer, nextLayerLen, i3);
    }

    private PdfDictionary[] constructLeafArr(PdfString[] names) {
        PdfDictionary[] leaves = new PdfDictionary[((names.length + 40) - 1) / 40];
        for (int k = 0; k < leaves.length; k++) {
            int offset = k * 40;
            int end = Math.min(offset + 40, names.length);
            PdfDictionary dic = formatNodeWithLimits(names, offset, end - 1);
            PdfArray namesArr = new PdfArray();
            while (offset < end) {
                namesArr.add(names[offset]);
                namesArr.add(this.items.get(names[offset]));
                offset++;
            }
            dic.put(PdfName.Names, namesArr);
            dic.makeIndirect(this.pdfDoc);
            leaves[k] = dic;
        }
        return leaves;
    }

    private static PdfString iterateItems(PdfDictionary dictionary, Map<PdfString, PdfObject> items, PdfString leftOver) {
        PdfArray names = dictionary.getAsArray(PdfName.Names);
        PdfArray kids = dictionary.getAsArray(PdfName.Kids);
        boolean isIntermNode = false;
        boolean isLeafNode = names != null && names.size() > 0;
        if (kids != null && kids.size() > 0) {
            isIntermNode = true;
        }
        if (isLeafNode) {
            return iterateLeafNode(names, items, leftOver);
        }
        if (isIntermNode) {
            PdfString curLeftOver = leftOver;
            for (int k = 0; k < kids.size(); k++) {
                PdfDictionary kid = kids.getAsDictionary(k);
                curLeftOver = iterateItems(kid, items, curLeftOver);
            }
            return curLeftOver;
        }
        return leftOver;
    }

    private static PdfString iterateLeafNode(PdfArray names, Map<PdfString, PdfObject> items, PdfString leftOver) {
        int k = 0;
        if (leftOver != null) {
            items.put(leftOver, names.get(0));
            k = 0 + 1;
        }
        while (k < names.size()) {
            PdfString name = names.getAsString(k);
            int k2 = k + 1;
            if (k2 == names.size()) {
                return name;
            }
            if (name != null) {
                items.put(name, names.get(k2));
            }
            k = k2 + 1;
        }
        return null;
    }
}
