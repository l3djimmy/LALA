package com.itextpdf.kernel.pdf;

import com.itextpdf.io.source.ByteBuffer;
import com.itextpdf.kernel.exceptions.PdfException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class SmartModePdfObjectsSerializer {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    private HashMap<SerializedObjectContent, PdfIndirectReference> serializedContentToObj = new HashMap<>();
    private MessageDigest sha512;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SmartModePdfObjectsSerializer() {
        try {
            this.sha512 = MessageDigest.getInstance("SHA-512");
        } catch (Exception e) {
            throw new PdfException(e);
        }
    }

    public void saveSerializedObject(SerializedObjectContent serializedContent, PdfIndirectReference objectReference) {
        this.serializedContentToObj.put(serializedContent, objectReference);
    }

    public PdfIndirectReference getSavedSerializedObject(SerializedObjectContent serializedContent) {
        if (serializedContent != null) {
            return this.serializedContentToObj.get(serializedContent);
        }
        return null;
    }

    public SerializedObjectContent serializeObject(PdfObject obj) {
        if (obj.isStream() || obj.isDictionary()) {
            PdfIndirectReference indRef = obj.getIndirectReference();
            if (indRef == null) {
                throw new AssertionError();
            }
            Map<PdfIndirectReference, byte[]> serializedCache = indRef.getDocument().serializedObjectsCache;
            byte[] content = serializedCache.get(indRef);
            if (content == null) {
                ByteBuffer bb = new ByteBuffer();
                try {
                    serObject(obj, bb, 100, serializedCache);
                    content = bb.toByteArray();
                } catch (SelfReferenceException e) {
                    return null;
                }
            }
            return new SerializedObjectContent(content);
        }
        return null;
    }

    private void serObject(PdfObject obj, ByteBuffer bb, int level, Map<PdfIndirectReference, byte[]> serializedCache) throws SelfReferenceException {
        if (level <= 0) {
            return;
        }
        if (obj == null) {
            bb.append("$Lnull");
            return;
        }
        PdfIndirectReference reference = null;
        ByteBuffer savedBb = null;
        if (obj.isIndirectReference()) {
            reference = (PdfIndirectReference) obj;
            byte[] cached = serializedCache.get(reference);
            if (cached != null) {
                bb.append(cached);
                return;
            } else if (serializedCache.keySet().contains(reference)) {
                throw new SelfReferenceException();
            } else {
                serializedCache.put(reference, null);
                savedBb = bb;
                bb = new ByteBuffer();
                obj = reference.getRefersTo();
            }
        }
        if (obj.isStream()) {
            serDic((PdfDictionary) obj, bb, level - 1, serializedCache);
            bb.append("$B");
            if (level > 0) {
                bb.append(this.sha512.digest(((PdfStream) obj).getBytes(false)));
            }
        } else if (obj.isDictionary()) {
            serDic((PdfDictionary) obj, bb, level - 1, serializedCache);
        } else if (obj.isArray()) {
            serArray((PdfArray) obj, bb, level - 1, serializedCache);
        } else if (obj.isString()) {
            bb.append("$S").append(obj.toString());
        } else if (obj.isName()) {
            bb.append("$N").append(obj.toString());
        } else {
            bb.append("$L").append(obj.toString());
        }
        if (savedBb != null) {
            serializedCache.put(reference, bb.toByteArray());
            savedBb.append(bb.getInternalBuffer(), 0, bb.size());
        }
    }

    private void serDic(PdfDictionary dic, ByteBuffer bb, int level, Map<PdfIndirectReference, byte[]> serializedCache) throws SelfReferenceException {
        bb.append("$D");
        if (level <= 0) {
            return;
        }
        for (PdfName key : dic.keySet()) {
            if (!isKeyRefersBack(dic, key)) {
                serObject(key, bb, level, serializedCache);
                serObject(dic.get(key, false), bb, level, serializedCache);
            }
        }
        bb.append("$\\D");
    }

    private void serArray(PdfArray array, ByteBuffer bb, int level, Map<PdfIndirectReference, byte[]> serializedCache) throws SelfReferenceException {
        bb.append("$A");
        if (level <= 0) {
            return;
        }
        for (int k = 0; k < array.size(); k++) {
            serObject(array.get(k, false), bb, level, serializedCache);
        }
        bb.append("$\\A");
    }

    private boolean isKeyRefersBack(PdfDictionary dic, PdfName key) {
        return (key.equals(PdfName.P) && (dic.get(key).isIndirectReference() || dic.get(key).isDictionary())) || key.equals(PdfName.Parent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public static class SelfReferenceException extends Exception {
        private SelfReferenceException() {
        }
    }
}
