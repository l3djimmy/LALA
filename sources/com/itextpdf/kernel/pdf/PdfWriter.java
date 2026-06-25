package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.FileUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.kernel.utils.ICopyFilter;
import com.itextpdf.kernel.utils.NullCopyFilter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfWriter extends PdfOutputStream {
    private Map<PdfIndirectReference, PdfIndirectReference> copiedObjects;
    protected boolean isUserWarnedAboutAcroFormCopying;
    PdfObjectStream objectStream;
    protected WriterProperties properties;
    private SmartModePdfObjectsSerializer smartModeSerializer;
    private static final byte[] obj = ByteUtils.getIsoBytes(" obj\n");
    private static final byte[] endobj = ByteUtils.getIsoBytes("\nendobj\n");

    public PdfWriter(File file) throws FileNotFoundException {
        this(file.getAbsolutePath());
    }

    public PdfWriter(OutputStream os) {
        this(os, new WriterProperties());
    }

    public PdfWriter(OutputStream os, WriterProperties properties) {
        super(new CountOutputStream(FileUtil.wrapWithBufferedOutputStream(os)));
        this.objectStream = null;
        this.copiedObjects = new LinkedHashMap();
        this.smartModeSerializer = new SmartModePdfObjectsSerializer();
        this.properties = properties;
    }

    public PdfWriter(String filename) throws FileNotFoundException {
        this(filename, new WriterProperties());
    }

    public PdfWriter(String filename, WriterProperties properties) throws FileNotFoundException {
        this(FileUtil.getBufferedOutputStream(filename), properties);
    }

    public boolean isFullCompression() {
        if (this.properties.isFullCompression != null) {
            return this.properties.isFullCompression.booleanValue();
        }
        return false;
    }

    public int getCompressionLevel() {
        return this.properties.compressionLevel;
    }

    public PdfWriter setCompressionLevel(int compressionLevel) {
        this.properties.setCompressionLevel(compressionLevel);
        return this;
    }

    public WriterProperties getProperties() {
        return this.properties;
    }

    public PdfWriter setSmartMode(boolean smartMode) {
        this.properties.smartMode = smartMode;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void initCryptoIfSpecified(PdfVersion version) {
        EncryptionProperties encryptProps = this.properties.encryptionProperties;
        if (this.properties.isStandardEncryptionUsed()) {
            this.crypto = new PdfEncryption(encryptProps.userPassword, encryptProps.ownerPassword, encryptProps.standardEncryptPermissions, encryptProps.encryptionAlgorithm, ByteUtils.getIsoBytes(this.document.getOriginalDocumentId().getValue()), version);
        } else if (this.properties.isPublicKeyEncryptionUsed()) {
            this.crypto = new PdfEncryption(encryptProps.publicCertificates, encryptProps.publicKeyEncryptPermissions, encryptProps.encryptionAlgorithm, version);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void flushObject(PdfObject pdfObject, boolean canBeInObjStm) {
        PdfIndirectReference indirectReference = pdfObject.getIndirectReference();
        if (isFullCompression() && canBeInObjStm) {
            PdfObjectStream objectStream = getObjectStream();
            objectStream.addObject(pdfObject);
        } else {
            indirectReference.setOffset(getCurrentPos());
            writeToBody(pdfObject);
        }
        indirectReference.setState((short) 1).clearState((short) 32);
        switch (pdfObject.getType()) {
            case 1:
                PdfArray array = (PdfArray) pdfObject;
                markArrayContentToFlush(array);
                array.releaseContent();
                return;
            case 2:
            case 6:
            case 7:
            case 8:
            case 10:
                ((PdfPrimitiveObject) pdfObject).content = null;
                return;
            case 3:
            case 9:
                PdfDictionary dictionary = (PdfDictionary) pdfObject;
                markDictionaryContentToFlush(dictionary);
                dictionary.releaseContent();
                return;
            case 4:
            default:
                return;
            case 5:
                markObjectToFlush(((PdfIndirectReference) pdfObject).getRefersTo(false));
                return;
        }
    }

    protected PdfObject copyObject(PdfObject obj2, PdfDocument documentTo, boolean allowDuplicating) {
        return copyObject(obj2, documentTo, allowDuplicating, NullCopyFilter.getInstance());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject copyObject(PdfObject obj2, PdfDocument documentTo, boolean allowDuplicating, ICopyFilter copyFilter) {
        PdfIndirectReference objectRef;
        PdfIndirectReference copiedIndirectReference;
        if (obj2 instanceof PdfIndirectReference) {
            obj2 = ((PdfIndirectReference) obj2).getRefersTo();
        }
        if (obj2 == null) {
            obj2 = PdfNull.PDF_NULL;
        }
        if (checkTypeOfPdfDictionary(obj2, PdfName.Catalog)) {
            Logger logger = LoggerFactory.getLogger(PdfReader.class);
            logger.warn(IoLogMessageConstant.MAKE_COPY_OF_CATALOG_DICTIONARY_IS_FORBIDDEN);
            obj2 = PdfNull.PDF_NULL;
        }
        PdfIndirectReference indirectReference = obj2.getIndirectReference();
        boolean tryToFindDuplicate = (allowDuplicating || indirectReference == null) ? false : true;
        if (tryToFindDuplicate && (copiedIndirectReference = this.copiedObjects.get(indirectReference)) != null) {
            return copiedIndirectReference.getRefersTo();
        }
        SerializedObjectContent serializedContent = null;
        if (this.properties.smartMode && tryToFindDuplicate && !checkTypeOfPdfDictionary(obj2, PdfName.Page) && !checkTypeOfPdfDictionary(obj2, PdfName.OCG) && !checkTypeOfPdfDictionary(obj2, PdfName.OCMD) && (objectRef = this.smartModeSerializer.getSavedSerializedObject((serializedContent = this.smartModeSerializer.serializeObject(obj2)))) != null) {
            this.copiedObjects.put(indirectReference, objectRef);
            return objectRef.refersTo;
        }
        PdfObject newObject = obj2.newInstance();
        if (indirectReference != null) {
            PdfIndirectReference indRef = newObject.makeIndirect(documentTo).getIndirectReference();
            if (serializedContent != null) {
                this.smartModeSerializer.saveSerializedObject(serializedContent, indRef);
            }
            this.copiedObjects.put(indirectReference, indRef);
        }
        newObject.copyContent(obj2, documentTo, copyFilter);
        return newObject;
    }

    protected void writeToBody(PdfObject pdfObj) {
        if (this.crypto != null) {
            this.crypto.setHashKeyForNextObject(pdfObj.getIndirectReference().getObjNumber(), pdfObj.getIndirectReference().getGenNumber());
        }
        writeInteger(pdfObj.getIndirectReference().getObjNumber()).writeSpace().writeInteger(pdfObj.getIndirectReference().getGenNumber()).writeBytes(obj);
        write(pdfObj);
        writeBytes(endobj);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void writeHeader() {
        writeByte(37).writeString(this.document.getPdfVersion().toString()).writeString("\n%âãÏÓ\n");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void flushWaitingObjects(Set<PdfIndirectReference> forbiddenToFlush) {
        PdfObject obj2;
        PdfXrefTable xref = this.document.getXref();
        boolean needFlush = true;
        while (needFlush) {
            needFlush = false;
            for (int i = 1; i < xref.size(); i++) {
                PdfIndirectReference indirectReference = xref.get(i);
                if (indirectReference != null && !indirectReference.isFree() && indirectReference.checkState((short) 32) && !forbiddenToFlush.contains(indirectReference) && (obj2 = indirectReference.getRefersTo(false)) != null) {
                    obj2.flush();
                    needFlush = true;
                }
            }
        }
        if (this.objectStream != null && this.objectStream.getSize() > 0) {
            this.objectStream.flush();
            this.objectStream = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void flushModifiedWaitingObjects(Set<PdfIndirectReference> forbiddenToFlush) {
        PdfObject obj2;
        PdfXrefTable xref = this.document.getXref();
        for (int i = 1; i < xref.size(); i++) {
            PdfIndirectReference indirectReference = xref.get(i);
            if (indirectReference != null && !indirectReference.isFree() && !forbiddenToFlush.contains(indirectReference)) {
                boolean isModified = indirectReference.checkState((short) 8);
                if (isModified && (obj2 = indirectReference.getRefersTo(false)) != null && !obj2.equals(this.objectStream)) {
                    obj2.flush();
                }
            }
        }
        if (this.objectStream != null && this.objectStream.getSize() > 0) {
            this.objectStream.flush();
            this.objectStream = null;
        }
    }

    PdfObjectStream getObjectStream() {
        if (!isFullCompression()) {
            return null;
        }
        if (this.objectStream == null) {
            this.objectStream = new PdfObjectStream(this.document);
        } else if (this.objectStream.getSize() == 200) {
            this.objectStream.flush();
            this.objectStream = new PdfObjectStream(this.objectStream);
        }
        return this.objectStream;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void flushCopiedObjects(long docId) {
        List<PdfIndirectReference> remove = new ArrayList<>();
        for (Map.Entry<PdfIndirectReference, PdfIndirectReference> copiedObject : this.copiedObjects.entrySet()) {
            PdfDocument document = copiedObject.getKey().getDocument();
            if (document != null && document.getDocumentId() == docId && copiedObject.getValue().refersTo != null) {
                copiedObject.getValue().refersTo.flush();
                remove.add(copiedObject.getKey());
            }
        }
        for (PdfIndirectReference ird : remove) {
            this.copiedObjects.remove(ird);
        }
    }

    private void markArrayContentToFlush(PdfArray array) {
        for (int i = 0; i < array.size(); i++) {
            markObjectToFlush(array.get(i, false));
        }
    }

    private void markDictionaryContentToFlush(PdfDictionary dictionary) {
        for (PdfObject item : dictionary.values(false)) {
            markObjectToFlush(item);
        }
    }

    private void markObjectToFlush(PdfObject pdfObject) {
        if (pdfObject != null) {
            PdfIndirectReference indirectReference = pdfObject.getIndirectReference();
            if (indirectReference != null) {
                if (!indirectReference.checkState((short) 1)) {
                    indirectReference.setState((short) 32);
                }
            } else if (pdfObject.getType() == 5) {
                if (!pdfObject.checkState((short) 1)) {
                    pdfObject.setState((short) 32);
                }
            } else if (pdfObject.getType() == 1) {
                markArrayContentToFlush((PdfArray) pdfObject);
            } else if (pdfObject.getType() == 3) {
                markDictionaryContentToFlush((PdfDictionary) pdfObject);
            }
        }
    }

    private static boolean checkTypeOfPdfDictionary(PdfObject dictionary, PdfName expectedType) {
        return dictionary.isDictionary() && expectedType.equals(((PdfDictionary) dictionary).getAsName(PdfName.Type));
    }
}
