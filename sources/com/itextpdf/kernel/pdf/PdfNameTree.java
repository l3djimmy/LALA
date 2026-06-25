package com.itextpdf.kernel.pdf;

import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
/* loaded from: classes12.dex */
public class PdfNameTree extends GenericNameTree {
    private final PdfCatalog catalog;
    private final PdfName treeType;

    public PdfNameTree(PdfCatalog catalog, PdfName treeType) {
        super(catalog.getDocument());
        this.treeType = treeType;
        this.catalog = catalog;
        setItems(readFromCatalog());
    }

    public Map<PdfString, PdfObject> getNames() {
        return getItems();
    }

    private LinkedHashMap<PdfString, PdfObject> readFromCatalog() {
        LinkedHashMap<PdfString, PdfObject> items;
        PdfDictionary namesDict = this.catalog.getPdfObject().getAsDictionary(PdfName.Names);
        PdfDictionary treeRoot = namesDict == null ? null : namesDict.getAsDictionary(this.treeType);
        if (treeRoot == null) {
            items = new LinkedHashMap<>();
        } else {
            items = readTree(treeRoot);
        }
        if (this.treeType.equals(PdfName.Dests)) {
            normalizeDestinations(items);
            insertDestsEntriesFromCatalog(items);
        }
        return items;
    }

    private static void normalizeDestinations(Map<PdfString, PdfObject> items) {
        Set<PdfString> keys = new HashSet<>(items.keySet());
        for (PdfString key : keys) {
            PdfArray arr = getDestArray(items.get(key));
            if (arr == null) {
                items.remove(key);
            } else {
                items.put(key, arr);
            }
        }
    }

    private void insertDestsEntriesFromCatalog(Map<PdfString, PdfObject> items) {
        PdfDictionary destinations = this.catalog.getPdfObject().getAsDictionary(PdfName.Dests);
        if (destinations != null) {
            Set<PdfName> keys = destinations.keySet();
            for (PdfName key : keys) {
                PdfArray array = getDestArray(destinations.get(key));
                if (array != null) {
                    items.put(new PdfString(key.getValue()), array);
                }
            }
        }
    }

    private static PdfArray getDestArray(PdfObject obj) {
        if (obj == null) {
            return null;
        }
        if (obj.isArray()) {
            return (PdfArray) obj;
        }
        if (!obj.isDictionary()) {
            return null;
        }
        return ((PdfDictionary) obj).getAsArray(PdfName.D);
    }
}
