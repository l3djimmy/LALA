package com.itextpdf.kernel.pdf;

import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.utils.ICopyFilter;
import com.itextpdf.kernel.utils.NullCopyFilter;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
/* loaded from: classes12.dex */
public class PdfDictionary extends PdfObject {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private Map<PdfName, PdfObject> map = new TreeMap();

    public PdfDictionary() {
    }

    public PdfDictionary(Map<PdfName, PdfObject> map) {
        this.map.putAll(map);
    }

    public PdfDictionary(Set<Map.Entry<PdfName, PdfObject>> entrySet) {
        for (Map.Entry<PdfName, PdfObject> entry : entrySet) {
            this.map.put(entry.getKey(), entry.getValue());
        }
    }

    public PdfDictionary(PdfDictionary dictionary) {
        this.map.putAll(dictionary.map);
    }

    public int size() {
        return this.map.size();
    }

    public boolean isEmpty() {
        return this.map.size() == 0;
    }

    public boolean containsKey(PdfName key) {
        return this.map.containsKey(key);
    }

    public boolean containsValue(PdfObject value) {
        return this.map.values().contains(value);
    }

    public PdfObject get(PdfName key) {
        return get(key, true);
    }

    public PdfArray getAsArray(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 1) {
            return (PdfArray) direct;
        }
        return null;
    }

    public PdfDictionary getAsDictionary(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 3) {
            return (PdfDictionary) direct;
        }
        return null;
    }

    public PdfStream getAsStream(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 9) {
            return (PdfStream) direct;
        }
        return null;
    }

    public PdfNumber getAsNumber(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 8) {
            return (PdfNumber) direct;
        }
        return null;
    }

    public PdfName getAsName(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 6) {
            return (PdfName) direct;
        }
        return null;
    }

    public PdfString getAsString(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 10) {
            return (PdfString) direct;
        }
        return null;
    }

    public PdfBoolean getAsBoolean(PdfName key) {
        PdfObject direct = get(key, true);
        if (direct != null && direct.getType() == 2) {
            return (PdfBoolean) direct;
        }
        return null;
    }

    public Rectangle getAsRectangle(PdfName key) {
        PdfArray a = getAsArray(key);
        if (a == null) {
            return null;
        }
        return a.toRectangle();
    }

    public Float getAsFloat(PdfName key) {
        PdfNumber number = getAsNumber(key);
        if (number == null) {
            return null;
        }
        Float floatNumber = Float.valueOf(number.floatValue());
        return floatNumber;
    }

    public Integer getAsInt(PdfName key) {
        PdfNumber number = getAsNumber(key);
        if (number == null) {
            return null;
        }
        Integer intNumber = Integer.valueOf(number.intValue());
        return intNumber;
    }

    public Boolean getAsBool(PdfName key) {
        PdfBoolean b = getAsBoolean(key);
        if (b == null) {
            return null;
        }
        Boolean booleanValue = Boolean.valueOf(b.getValue());
        return booleanValue;
    }

    public PdfObject put(PdfName key, PdfObject value) {
        if (value == null) {
            throw new AssertionError();
        }
        return this.map.put(key, value);
    }

    public PdfObject remove(PdfName key) {
        return this.map.remove(key);
    }

    public void putAll(PdfDictionary d) {
        this.map.putAll(d.map);
    }

    public void clear() {
        this.map.clear();
    }

    public Set<PdfName> keySet() {
        return this.map.keySet();
    }

    public Collection<PdfObject> values(boolean asDirects) {
        if (asDirects) {
            return values();
        }
        return this.map.values();
    }

    public Collection<PdfObject> values() {
        return new PdfDictionaryValues(this.map.values());
    }

    public Set<Map.Entry<PdfName, PdfObject>> entrySet() {
        return new PdfDictionaryEntrySet(this.map.entrySet());
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    public byte getType() {
        return (byte) 3;
    }

    public String toString() {
        if (!isFlushed()) {
            String string = "<<";
            for (Map.Entry<PdfName, PdfObject> entry : this.map.entrySet()) {
                PdfIndirectReference indirectReference = entry.getValue().getIndirectReference();
                string = string + entry.getKey().toString() + " " + (indirectReference == null ? entry.getValue().toString() : indirectReference.toString()) + " ";
            }
            return string + ">>";
        }
        return this.indirectReference.toString();
    }

    public PdfDictionary clone(List<PdfName> excludeKeys) {
        Map<PdfName, PdfObject> excluded = new TreeMap<>();
        for (PdfName key : excludeKeys) {
            PdfObject obj = this.map.get(key);
            if (obj != null) {
                excluded.put(key, this.map.remove(key));
            }
        }
        PdfDictionary dictionary = (PdfDictionary) m7331clone();
        this.map.putAll(excluded);
        return dictionary;
    }

    public PdfDictionary copyTo(PdfDocument document, List<PdfName> excludeKeys, boolean allowDuplicating) {
        return copyTo(document, excludeKeys, allowDuplicating, NullCopyFilter.getInstance());
    }

    public PdfDictionary copyTo(PdfDocument document, List<PdfName> excludeKeys, boolean allowDuplicating, ICopyFilter copyFilter) {
        Map<PdfName, PdfObject> excluded = new TreeMap<>();
        for (PdfName key : excludeKeys) {
            PdfObject obj = this.map.get(key);
            if (obj != null) {
                excluded.put(key, this.map.remove(key));
            }
        }
        PdfDictionary dictionary = (PdfDictionary) copyTo(document, allowDuplicating, copyFilter);
        this.map.putAll(excluded);
        return dictionary;
    }

    public PdfObject get(PdfName key, boolean asDirect) {
        Map<PdfName, PdfObject> map = this.map;
        if (!asDirect) {
            return map.get(key);
        }
        PdfObject obj = map.get(key);
        if (obj != null && obj.getType() == 5) {
            return ((PdfIndirectReference) obj).getRefersTo(true);
        }
        return obj;
    }

    public void mergeDifferent(PdfDictionary other) {
        for (PdfName key : other.keySet()) {
            if (!containsKey(key)) {
                put(key, other.get(key));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public PdfObject newInstance() {
        return new PdfDictionary();
    }

    @Override // com.itextpdf.kernel.pdf.PdfObject
    protected void copyContent(PdfObject from, PdfDocument document) {
        copyContent(from, document, NullCopyFilter.getInstance());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.itextpdf.kernel.pdf.PdfObject
    public void copyContent(PdfObject from, PdfDocument document, ICopyFilter copyFilter) {
        super.copyContent(from, document, copyFilter);
        PdfDictionary dictionary = (PdfDictionary) from;
        for (Map.Entry<PdfName, PdfObject> entry : dictionary.map.entrySet()) {
            if (copyFilter.shouldProcess(this, entry.getKey(), entry.getValue())) {
                this.map.put(entry.getKey(), entry.getValue().processCopying(document, false, copyFilter));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void releaseContent() {
        this.map = null;
    }
}
