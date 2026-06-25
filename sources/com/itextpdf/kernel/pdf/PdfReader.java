package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.exceptions.IoExceptionMessageConstant;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteBuffer;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.io.source.IRandomAccessSource;
import com.itextpdf.io.source.PdfTokenizer;
import com.itextpdf.io.source.RandomAccessFileOrArray;
import com.itextpdf.io.source.RandomAccessSourceFactory;
import com.itextpdf.io.source.WindowRandomAccessSource;
import com.itextpdf.kernel.crypto.securityhandler.UnsupportedSecurityHandlerException;
import com.itextpdf.kernel.exceptions.InvalidXRefPrevException;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.MemoryLimitsAwareException;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.exceptions.XrefCycledReferencesException;
import com.itextpdf.kernel.pdf.filters.FilterHandlers;
import com.itextpdf.kernel.pdf.filters.IFilterHandler;
import com.itextpdf.kernel.xmp.XMPException;
import com.itextpdf.kernel.xmp.XMPMeta;
import com.itextpdf.kernel.xmp.XMPMetaFactory;
import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import kotlin.UByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfReader implements Closeable {
    private static final String endstream2 = "\nendstream";
    private static final String endstream3 = "\r\nendstream";
    private static final String endstream4 = "\rendstream";
    private PdfIndirectReference currentIndirectReference;
    protected PdfEncryption decrypt;
    protected boolean encrypted;
    protected long eofPos;
    protected boolean fixedXref;
    protected PdfVersion headerPdfVersion;
    protected boolean hybridXref;
    protected long lastXref;
    private boolean memorySavingMode;
    protected PdfAConformanceLevel pdfAConformanceLevel;
    protected PdfDocument pdfDocument;
    protected ReaderProperties properties;
    protected boolean rebuiltXref;
    private StrictnessLevel strictnessLevel;
    protected PdfTokenizer tokens;
    protected PdfDictionary trailer;
    private boolean unethicalReading;
    private XMPMeta xmpMeta;
    private XrefProcessor xrefProcessor;
    protected boolean xrefStm;
    public static final StrictnessLevel DEFAULT_STRICTNESS_LEVEL = StrictnessLevel.LENIENT;
    private static final String endstream1 = "endstream";
    private static final byte[] endstream = ByteUtils.getIsoBytes(endstream1);
    private static final byte[] endobj = ByteUtils.getIsoBytes("endobj");
    protected static boolean correctStreamLength = true;

    public PdfReader(IRandomAccessSource byteSource, ReaderProperties properties) throws IOException {
        this(byteSource, properties, false);
    }

    public PdfReader(InputStream is, ReaderProperties properties) throws IOException {
        this(new RandomAccessSourceFactory().extractOrCreateSource(is), properties, true);
    }

    public PdfReader(File file) throws FileNotFoundException, IOException {
        this(file.getAbsolutePath());
    }

    public PdfReader(InputStream is) throws IOException {
        this(is, new ReaderProperties());
    }

    public PdfReader(String filename, ReaderProperties properties) throws IOException {
        this(new RandomAccessSourceFactory().setForceRead(false).createBestSource(filename), properties, true);
    }

    public PdfReader(String filename) throws IOException {
        this(filename, new ReaderProperties());
    }

    public PdfReader(File file, ReaderProperties properties) throws IOException {
        this(file.getAbsolutePath(), properties);
    }

    PdfReader(IRandomAccessSource byteSource, ReaderProperties properties, boolean closeStream) throws IOException {
        this.strictnessLevel = DEFAULT_STRICTNESS_LEVEL;
        this.xrefProcessor = new XrefProcessor();
        this.encrypted = false;
        this.rebuiltXref = false;
        this.hybridXref = false;
        this.fixedXref = false;
        this.xrefStm = false;
        this.properties = properties;
        this.tokens = getOffsetTokeniser(byteSource, closeStream);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.tokens.close();
    }

    public PdfReader setUnethicalReading(boolean unethicalReading) {
        this.unethicalReading = unethicalReading;
        return this;
    }

    public PdfReader setMemorySavingMode(boolean memorySavingMode) {
        this.memorySavingMode = memorySavingMode;
        return this;
    }

    public StrictnessLevel getStrictnessLevel() {
        return this.strictnessLevel;
    }

    public PdfReader setStrictnessLevel(StrictnessLevel strictnessLevel) {
        this.strictnessLevel = strictnessLevel == null ? DEFAULT_STRICTNESS_LEVEL : strictnessLevel;
        return this;
    }

    public boolean isCloseStream() {
        return this.tokens.isCloseStream();
    }

    public void setCloseStream(boolean closeStream) {
        this.tokens.setCloseStream(closeStream);
    }

    public boolean hasRebuiltXref() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.rebuiltXref;
    }

    public boolean hasHybridXref() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.hybridXref;
    }

    public boolean hasXrefStm() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.xrefStm;
    }

    public boolean hasFixedXref() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.fixedXref;
    }

    public long getLastXref() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.lastXref;
    }

    public byte[] readStreamBytes(PdfStream stream, boolean decode) throws IOException {
        byte[] b = readStreamBytesRaw(stream);
        if (decode && b != null) {
            return decodeBytes(b, stream);
        }
        return b;
    }

    public byte[] readStreamBytesRaw(PdfStream stream) throws IOException {
        PdfName type = stream.getAsName(PdfName.Type);
        if (!PdfName.XRef.equals(type) && !PdfName.ObjStm.equals(type)) {
            checkPdfStreamLength(stream);
        }
        long offset = stream.getOffset();
        if (offset <= 0) {
            return null;
        }
        int length = stream.getLength();
        if (length <= 0) {
            return new byte[0];
        }
        RandomAccessFileOrArray file = this.tokens.getSafeFile();
        try {
            file.seek(offset);
            byte[] bytes = new byte[length];
            file.readFully(bytes);
            boolean embeddedStream = this.pdfDocument.doesStreamBelongToEmbeddedFile(stream);
            if (this.decrypt != null && (!this.decrypt.isEmbeddedFilesOnly() || embeddedStream)) {
                PdfObject filter = stream.get(PdfName.Filter, true);
                boolean skip = false;
                if (filter != null) {
                    if (filter.isFlushed()) {
                        IndirectFilterUtils.throwFlushedFilterException(stream);
                    }
                    if (PdfName.Crypt.equals(filter)) {
                        skip = true;
                    } else if (filter.getType() == 1) {
                        PdfArray filters = (PdfArray) filter;
                        int k = 0;
                        while (true) {
                            if (k < filters.size()) {
                                if (filters.get(k).isFlushed()) {
                                    IndirectFilterUtils.throwFlushedFilterException(stream);
                                }
                                if (filters.isEmpty() || !PdfName.Crypt.equals(filters.get(k, true))) {
                                    k++;
                                } else {
                                    skip = true;
                                    break;
                                }
                            } else {
                                break;
                            }
                        }
                    }
                    filter.release();
                }
                if (!skip) {
                    this.decrypt.setHashKeyForNextObject(stream.getIndirectReference().getObjNumber(), stream.getIndirectReference().getGenNumber());
                    bytes = this.decrypt.decryptByteArray(bytes);
                }
            }
            return bytes;
        } finally {
            try {
                file.close();
            } catch (Exception e) {
            }
        }
    }

    public InputStream readStream(PdfStream stream, boolean decode) throws IOException {
        byte[] bytes = readStreamBytes(stream, decode);
        if (bytes != null) {
            return new ByteArrayInputStream(bytes);
        }
        return null;
    }

    public static byte[] decodeBytes(byte[] b, PdfDictionary streamDictionary) {
        return decodeBytes(b, streamDictionary, FilterHandlers.getDefaultFilterHandlers());
    }

    public static byte[] decodeBytes(byte[] b, PdfDictionary streamDictionary, Map<PdfName, IFilterHandler> filterHandlers) {
        PdfDictionary decodeParams;
        if (b != null) {
            PdfObject filter = streamDictionary.get(PdfName.Filter);
            PdfArray filters = new PdfArray();
            boolean z = true;
            if (filter != null) {
                if (filter.getType() != 6) {
                    if (filter.getType() == 1) {
                        filters = (PdfArray) filter;
                    }
                } else {
                    filters.add(filter);
                }
            }
            MemoryLimitsAwareHandler memoryLimitsAwareHandler = null;
            if (streamDictionary.getIndirectReference() != null) {
                memoryLimitsAwareHandler = streamDictionary.getIndirectReference().getDocument().memoryLimitsAwareHandler;
            }
            boolean memoryLimitsAwarenessRequired = memoryLimitsAwareHandler != null && memoryLimitsAwareHandler.isMemoryLimitsAwarenessRequiredOnDecompression(filters);
            if (memoryLimitsAwarenessRequired) {
                memoryLimitsAwareHandler.beginDecompressedPdfStreamProcessing();
            }
            PdfArray dp = new PdfArray();
            PdfObject dpo = streamDictionary.get(PdfName.DecodeParms);
            if (dpo == null || (dpo.getType() != 3 && dpo.getType() != 1)) {
                if (dpo != null) {
                    dpo.release();
                }
                dpo = streamDictionary.get(PdfName.DP);
            }
            if (dpo != null) {
                if (dpo.getType() != 3) {
                    if (dpo.getType() == 1) {
                        dp = (PdfArray) dpo;
                    }
                } else {
                    dp.add(dpo);
                }
                dpo.release();
            }
            int j = 0;
            byte[] b2 = b;
            while (j < filters.size()) {
                PdfName filterName = (PdfName) filters.get(j);
                IFilterHandler filterHandler = filterHandlers.get(filterName);
                if (filterHandler == null) {
                    throw new PdfException(KernelExceptionMessageConstant.THIS_FILTER_IS_NOT_SUPPORTED).setMessageParams(filterName);
                }
                if (j < dp.size()) {
                    PdfObject dpEntry = dp.get(j, z);
                    if (dpEntry != null && dpEntry.getType() != 7) {
                        if (dpEntry.getType() == 3) {
                            decodeParams = (PdfDictionary) dpEntry;
                        } else {
                            throw new PdfException(KernelExceptionMessageConstant.THIS_DECODE_PARAMETER_TYPE_IS_NOT_SUPPORTED).setMessageParams(dpEntry.getClass().toString());
                        }
                    } else {
                        decodeParams = null;
                    }
                } else {
                    decodeParams = null;
                }
                b2 = filterHandler.decode(b2, filterName, decodeParams, streamDictionary);
                if (memoryLimitsAwarenessRequired) {
                    memoryLimitsAwareHandler.considerBytesOccupiedByDecompressedPdfStream(b2.length);
                }
                j++;
                z = true;
            }
            if (memoryLimitsAwarenessRequired) {
                memoryLimitsAwareHandler.endDecompressedPdfStreamProcessing();
            }
            return b2;
        }
        return null;
    }

    public RandomAccessFileOrArray getSafeFile() {
        return this.tokens.getSafeFile();
    }

    public long getFileLength() {
        return this.tokens.getSafeFile().length();
    }

    public boolean isOpenedWithFullPermission() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return !this.encrypted || this.decrypt.isOpenedWithFullPermission() || this.unethicalReading;
    }

    public long getPermissions() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        if (!this.encrypted || this.decrypt.getPermissions() == null) {
            return 0L;
        }
        long perm = this.decrypt.getPermissions().longValue();
        return perm;
    }

    public int getCryptoMode() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        if (this.decrypt == null) {
            return -1;
        }
        return this.decrypt.getCryptoMode();
    }

    public PdfAConformanceLevel getPdfAConformanceLevel() {
        if (this.pdfAConformanceLevel == null) {
            if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
                throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
            }
            try {
                if (this.xmpMeta == null && this.pdfDocument.getXmpMetadata() != null) {
                    this.xmpMeta = XMPMetaFactory.parseFromBuffer(this.pdfDocument.getXmpMetadata());
                }
                if (this.xmpMeta != null) {
                    this.pdfAConformanceLevel = PdfAConformanceLevel.getConformanceLevel(this.xmpMeta);
                }
            } catch (XMPException e) {
            }
        }
        return this.pdfAConformanceLevel;
    }

    public byte[] computeUserPassword() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        if (!this.encrypted || !this.decrypt.isOpenedWithFullPermission()) {
            return null;
        }
        return this.decrypt.computeUserPassword(this.properties.password);
    }

    public byte[] getOriginalFileId() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        PdfArray id = this.trailer.getAsArray(PdfName.ID);
        if (id != null && id.size() == 2) {
            return ByteUtils.getIsoBytes(id.getAsString(0).getValue());
        }
        return new byte[0];
    }

    public byte[] getModifiedFileId() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        PdfArray id = this.trailer.getAsArray(PdfName.ID);
        if (id != null && id.size() == 2) {
            return ByteUtils.getIsoBytes(id.getAsString(1).getValue());
        }
        return new byte[0];
    }

    public boolean isEncrypted() {
        if (this.pdfDocument == null || !this.pdfDocument.getXref().isReadingCompleted()) {
            throw new PdfException(KernelExceptionMessageConstant.DOCUMENT_HAS_NOT_BEEN_READ_YET);
        }
        return this.encrypted;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void readPdf() throws IOException {
        String version = this.tokens.checkPdfHeader();
        try {
            this.headerPdfVersion = PdfVersion.fromString(version);
            try {
                readXref();
            } catch (InvalidXRefPrevException ex) {
                throw ex;
            } catch (MemoryLimitsAwareException ex2) {
                throw ex2;
            } catch (XrefCycledReferencesException ex3) {
                throw ex3;
            } catch (RuntimeException ex4) {
                if (StrictnessLevel.CONSERVATIVE.isStricter(getStrictnessLevel())) {
                    Logger logger = LoggerFactory.getLogger(PdfReader.class);
                    logger.error(IoLogMessageConstant.XREF_ERROR_WHILE_READING_TABLE_WILL_BE_REBUILT, (Throwable) ex4);
                    rebuildXref();
                } else {
                    throw ex4;
                }
            }
            this.pdfDocument.getXref().markReadingCompleted();
            readDecryptObj();
        } catch (IllegalArgumentException e) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_VERSION_IS_NOT_VALID, version);
        }
    }

    protected void readObjectStream(PdfStream objectStream) throws IOException {
        PdfObject obj;
        int objectStreamNumber = objectStream.getIndirectReference().getObjNumber();
        int first = objectStream.getAsNumber(PdfName.First).intValue();
        int n = objectStream.getAsNumber(PdfName.N).intValue();
        byte[] bytes = readStreamBytes(objectStream, true);
        PdfTokenizer saveTokens = this.tokens;
        try {
            this.tokens = new PdfTokenizer(new RandomAccessFileOrArray(new RandomAccessSourceFactory().createSource(bytes)));
            int[] address = new int[n];
            int[] objNumber = new int[n];
            boolean ok = true;
            int k = 0;
            while (true) {
                if (k >= n) {
                    break;
                }
                ok = this.tokens.nextToken();
                if (!ok) {
                    break;
                } else if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Number) {
                    ok = false;
                    break;
                } else {
                    objNumber[k] = this.tokens.getIntValue();
                    ok = this.tokens.nextToken();
                    if (!ok) {
                        break;
                    } else if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Number) {
                        ok = false;
                        break;
                    } else {
                        address[k] = this.tokens.getIntValue() + first;
                        k++;
                    }
                }
            }
            if (!ok) {
                throw new PdfException(KernelExceptionMessageConstant.ERROR_WHILE_READING_OBJECT_STREAM);
            }
            for (int k2 = 0; k2 < n; k2++) {
                this.tokens.seek(address[k2]);
                this.tokens.nextToken();
                PdfIndirectReference reference = this.pdfDocument.getXref().get(objNumber[k2]);
                if (reference.refersTo == null && reference.getObjStreamNumber() == objectStreamNumber) {
                    if (this.tokens.getTokenType() == PdfTokenizer.TokenType.Number) {
                        obj = new PdfNumber(this.tokens.getByteContent());
                    } else {
                        this.tokens.seek(address[k2]);
                        obj = readObject(false, true);
                    }
                    reference.setRefersTo(obj);
                    obj.setIndirectReference(reference);
                }
            }
            objectStream.getIndirectReference().setState((short) 16);
        } finally {
            this.tokens = saveTokens;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PdfObject readObject(PdfIndirectReference reference) {
        return readObject(reference, true);
    }

    protected PdfObject readObject(boolean readAsDirect) throws IOException {
        return readObject(readAsDirect, false);
    }

    protected PdfObject readReference(boolean readAsDirect) {
        int num = this.tokens.getObjNr();
        if (num < 0) {
            return createPdfNullInstance(readAsDirect);
        }
        PdfXrefTable table = this.pdfDocument.getXref();
        PdfIndirectReference reference = table.get(num);
        if (reference != null) {
            if (reference.isFree()) {
                Logger logger = LoggerFactory.getLogger(PdfReader.class);
                logger.warn(MessageFormatUtil.format(IoLogMessageConstant.INVALID_INDIRECT_REFERENCE, Integer.valueOf(this.tokens.getObjNr()), Integer.valueOf(this.tokens.getGenNr())));
                return createPdfNullInstance(readAsDirect);
            } else if (reference.getGenNumber() != this.tokens.getGenNr()) {
                if (this.fixedXref) {
                    Logger logger2 = LoggerFactory.getLogger(PdfReader.class);
                    logger2.warn(MessageFormatUtil.format(IoLogMessageConstant.INVALID_INDIRECT_REFERENCE, Integer.valueOf(this.tokens.getObjNr()), Integer.valueOf(this.tokens.getGenNr())));
                    return createPdfNullInstance(readAsDirect);
                }
                throw new PdfException(KernelExceptionMessageConstant.INVALID_INDIRECT_REFERENCE, MessageFormatUtil.format("{0} {1} R", Integer.valueOf(reference.getObjNumber()), Integer.valueOf(reference.getGenNumber())));
            } else {
                return reference;
            }
        } else if (table.isReadingCompleted()) {
            Logger logger3 = LoggerFactory.getLogger(PdfReader.class);
            logger3.warn(MessageFormatUtil.format(IoLogMessageConstant.INVALID_INDIRECT_REFERENCE, Integer.valueOf(this.tokens.getObjNr()), Integer.valueOf(this.tokens.getGenNr())));
            return createPdfNullInstance(readAsDirect);
        } else {
            return table.add((PdfIndirectReference) new PdfIndirectReference(this.pdfDocument, num, this.tokens.getGenNr(), 0L).setState((short) 4));
        }
    }

    protected PdfObject readObject(boolean readAsDirect, boolean objStm) throws IOException {
        boolean hasNext;
        this.tokens.nextValidToken();
        PdfTokenizer.TokenType type = this.tokens.getTokenType();
        switch (type) {
            case StartDic:
                PdfDictionary dict = readDictionary(objStm);
                long pos = this.tokens.getPosition();
                do {
                    hasNext = this.tokens.nextToken();
                    if (hasNext) {
                    }
                    if (hasNext || !this.tokens.tokenValueEqualsTo(PdfTokenizer.Stream)) {
                        this.tokens.seek(pos);
                        return dict;
                    }
                    while (true) {
                        int ch = this.tokens.read();
                        if (ch != 32 && ch != 9 && ch != 0 && ch != 12) {
                            if (ch != 10) {
                                ch = this.tokens.read();
                            }
                            if (ch != 10) {
                                this.tokens.backOnePosition(ch);
                            }
                            PdfStream pdfStream = new PdfStream(this.tokens.getPosition(), dict);
                            this.tokens.seek(pdfStream.getOffset() + pdfStream.getLength());
                            return pdfStream;
                        }
                    }
                } while (this.tokens.getTokenType() == PdfTokenizer.TokenType.Comment);
                if (hasNext) {
                }
                this.tokens.seek(pos);
                return dict;
            case StartArray:
                return readArray(objStm);
            case Number:
                return new PdfNumber(this.tokens.getByteContent());
            case String:
                PdfString pdfString = new PdfString(this.tokens.getByteContent(), this.tokens.isHexString());
                if (this.encrypted && !this.decrypt.isEmbeddedFilesOnly() && !objStm) {
                    pdfString.setDecryption(this.currentIndirectReference.getObjNumber(), this.currentIndirectReference.getGenNumber(), this.decrypt);
                }
                return pdfString;
            case Name:
                return readPdfName(readAsDirect);
            case Ref:
                return readReference(readAsDirect);
            case EndOfFile:
                throw new PdfException(KernelExceptionMessageConstant.UNEXPECTED_END_OF_FILE);
            default:
                if (this.tokens.tokenValueEqualsTo(PdfTokenizer.Null)) {
                    return createPdfNullInstance(readAsDirect);
                }
                if (this.tokens.tokenValueEqualsTo(PdfTokenizer.True)) {
                    if (readAsDirect) {
                        return PdfBoolean.TRUE;
                    }
                    return new PdfBoolean(true);
                } else if (this.tokens.tokenValueEqualsTo(PdfTokenizer.False)) {
                    if (readAsDirect) {
                        return PdfBoolean.FALSE;
                    }
                    return new PdfBoolean(false);
                } else {
                    return null;
                }
        }
    }

    protected PdfName readPdfName(boolean readAsDirect) {
        PdfName cachedName;
        if (readAsDirect && (cachedName = PdfName.staticNames.get(this.tokens.getStringValue())) != null) {
            return cachedName;
        }
        return new PdfName(this.tokens.getByteContent());
    }

    protected PdfDictionary readDictionary(boolean objStm) throws IOException {
        PdfDictionary dic = new PdfDictionary();
        while (true) {
            this.tokens.nextValidToken();
            if (this.tokens.getTokenType() != PdfTokenizer.TokenType.EndDic) {
                if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Name) {
                    this.tokens.throwError(KernelExceptionMessageConstant.THIS_DICTIONARY_KEY_IS_NOT_A_NAME, this.tokens.getStringValue());
                }
                PdfName name = readPdfName(true);
                PdfObject obj = readObject(true, objStm);
                if (obj == null) {
                    if (this.tokens.getTokenType() == PdfTokenizer.TokenType.EndDic) {
                        this.tokens.throwError(MessageFormatUtil.format(KernelExceptionMessageConstant.UNEXPECTED_TOKEN, ">>"), new Object[0]);
                    }
                    if (this.tokens.getTokenType() == PdfTokenizer.TokenType.EndArray) {
                        this.tokens.throwError(MessageFormatUtil.format(KernelExceptionMessageConstant.UNEXPECTED_TOKEN, "]"), new Object[0]);
                    }
                }
                dic.put(name, obj);
            } else {
                return dic;
            }
        }
    }

    protected PdfArray readArray(boolean objStm) throws IOException {
        PdfArray array = new PdfArray();
        while (true) {
            PdfObject obj = readObject(true, objStm);
            if (obj == null) {
                break;
            }
            array.add(obj);
        }
        if (this.tokens.getTokenType() != PdfTokenizer.TokenType.EndArray) {
            processArrayReadError();
        }
        return array;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void readXref() throws IOException {
        this.tokens.seek(this.tokens.getStartxref());
        this.tokens.nextToken();
        if (!this.tokens.tokenValueEqualsTo(PdfTokenizer.Startxref)) {
            throw new PdfException("PDF startxref not found.", this.tokens);
        }
        this.tokens.nextToken();
        if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Number) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_STARTXREF_IS_NOT_FOLLOWED_BY_A_NUMBER, this.tokens);
        }
        long startxref = this.tokens.getLongValue();
        this.lastXref = startxref;
        this.eofPos = this.tokens.getPosition();
        try {
            if (readXrefStream(startxref)) {
                this.xrefStm = true;
                return;
            }
        } catch (InvalidXRefPrevException exceptionWhileReadingXrefStream) {
            throw exceptionWhileReadingXrefStream;
        } catch (MemoryLimitsAwareException exceptionWhileReadingXrefStream2) {
            throw exceptionWhileReadingXrefStream2;
        } catch (XrefCycledReferencesException exceptionWhileReadingXrefStream3) {
            throw exceptionWhileReadingXrefStream3;
        } catch (Exception e) {
        }
        this.pdfDocument.getXref().clear();
        this.tokens.seek(startxref);
        this.trailer = readXrefSection();
        PdfDictionary trailer2 = this.trailer;
        Set<Long> alreadyVisitedXrefTables = new HashSet<>();
        while (true) {
            alreadyVisitedXrefTables.add(Long.valueOf(startxref));
            PdfNumber prev = getXrefPrev(trailer2.get(PdfName.Prev, false));
            if (prev != null) {
                long prevXrefOffset = prev.longValue();
                if (alreadyVisitedXrefTables.contains(Long.valueOf(prevXrefOffset))) {
                    if (StrictnessLevel.CONSERVATIVE.isStricter(getStrictnessLevel())) {
                        throw new PdfException(KernelExceptionMessageConstant.TRAILER_PREV_ENTRY_POINTS_TO_ITS_OWN_CROSS_REFERENCE_SECTION);
                    }
                    throw new XrefCycledReferencesException(KernelExceptionMessageConstant.XREF_TABLE_HAS_CYCLED_REFERENCES);
                }
                startxref = prevXrefOffset;
                this.tokens.seek(startxref);
                trailer2 = readXrefSection();
            } else {
                Integer xrefSize = this.trailer.getAsInt(PdfName.Size);
                if (xrefSize == null) {
                    throw new PdfException(KernelExceptionMessageConstant.INVALID_XREF_TABLE);
                }
                return;
            }
        }
    }

    protected PdfDictionary readXrefSection() throws IOException {
        this.tokens.nextValidToken();
        if (!this.tokens.tokenValueEqualsTo(PdfTokenizer.Xref)) {
            this.tokens.throwError(KernelExceptionMessageConstant.XREF_SUBSECTION_NOT_FOUND, new Object[0]);
        }
        PdfXrefTable xref = this.pdfDocument.getXref();
        while (true) {
            this.tokens.nextValidToken();
            if (this.tokens.tokenValueEqualsTo(PdfTokenizer.Trailer)) {
                break;
            }
            if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Number) {
                this.tokens.throwError(KernelExceptionMessageConstant.OBJECT_NUMBER_OF_THE_FIRST_OBJECT_IN_THIS_XREF_SUBSECTION_NOT_FOUND, new Object[0]);
            }
            int start = this.tokens.getIntValue();
            this.tokens.nextValidToken();
            if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Number) {
                this.tokens.throwError(KernelExceptionMessageConstant.NUMBER_OF_ENTRIES_IN_THIS_XREF_SUBSECTION_NOT_FOUND, new Object[0]);
            }
            int end = this.tokens.getIntValue() + start;
            int num = start;
            while (num < end) {
                this.tokens.nextValidToken();
                long pos = this.tokens.getLongValue();
                this.tokens.nextValidToken();
                int gen = this.tokens.getIntValue();
                this.tokens.nextValidToken();
                if (pos == 0 && gen == 65535 && num == 1 && start != 0) {
                    num = 0;
                    end--;
                } else {
                    PdfIndirectReference reference = xref.get(num);
                    boolean refReadingState = reference != null && reference.checkState((short) 4) && reference.getGenNumber() == gen;
                    boolean refFirstEncountered = reference == null || (!refReadingState && reference.getDocument() == null);
                    if (refFirstEncountered) {
                        reference = new PdfIndirectReference(this.pdfDocument, num, gen, pos);
                    } else if (refReadingState) {
                        reference.setOffset(pos);
                        reference.clearState((short) 4);
                    }
                    if (this.tokens.tokenValueEqualsTo(PdfTokenizer.N)) {
                        if (pos == 0) {
                            this.tokens.throwError(KernelExceptionMessageConstant.FILE_POSITION_0_CROSS_REFERENCE_ENTRY_IN_THIS_XREF_SUBSECTION, new Object[0]);
                        }
                    } else if (this.tokens.tokenValueEqualsTo(PdfTokenizer.F)) {
                        if (refFirstEncountered) {
                            reference.setState((short) 2);
                        }
                    } else {
                        this.tokens.throwError(KernelExceptionMessageConstant.INVALID_CROSS_REFERENCE_ENTRY_IN_THIS_XREF_SUBSECTION, new Object[0]);
                    }
                    if (refFirstEncountered) {
                        xref.add(reference);
                    }
                }
                num++;
            }
        }
        processXref(xref);
        PdfDictionary trailer = (PdfDictionary) readObject(false);
        PdfObject xrs = trailer.get(PdfName.XRefStm);
        if (xrs != null && xrs.getType() == 8) {
            int loc = ((PdfNumber) xrs).intValue();
            try {
                readXrefStream(loc);
                this.xrefStm = true;
                this.hybridXref = true;
            } catch (IOException e) {
                xref.clear();
                throw e;
            }
        }
        return trailer;
    }

    /* JADX WARN: Code restructure failed: missing block: B:89:0x0270, code lost:
        r2 = r17 + 2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected boolean readXrefStream(long r39) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 692
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.PdfReader.readXrefStream(long):boolean");
    }

    protected void fixXref() throws IOException {
        int[] obj;
        this.fixedXref = true;
        PdfXrefTable xref = this.pdfDocument.getXref();
        this.tokens.seek(0L);
        ByteBuffer buffer = new ByteBuffer(24);
        PdfTokenizer lineTokeniser = new PdfTokenizer(new RandomAccessFileOrArray(new ReusableRandomAccessSource(buffer)));
        while (true) {
            long pos = this.tokens.getPosition();
            buffer.reset();
            if (this.tokens.readLineSegment(buffer, true)) {
                if (buffer.get(0) >= 48 && buffer.get(0) <= 57 && (obj = PdfTokenizer.checkObjectStart(lineTokeniser)) != null) {
                    int num = obj[0];
                    int gen = obj[1];
                    PdfIndirectReference reference = xref.get(num);
                    if (reference != null && reference.getGenNumber() == gen) {
                        reference.fixOffset(pos);
                    }
                }
            } else {
                return;
            }
        }
    }

    protected void rebuildXref() throws IOException {
        int[] obj;
        this.xrefStm = false;
        this.hybridXref = false;
        this.rebuiltXref = true;
        PdfXrefTable xref = this.pdfDocument.getXref();
        xref.clear();
        this.tokens.seek(0L);
        this.trailer = null;
        ByteBuffer buffer = new ByteBuffer(24);
        PdfTokenizer lineTokenizer = new PdfTokenizer(new RandomAccessFileOrArray(new ReusableRandomAccessSource(buffer)));
        Long trailerIndex = null;
        while (true) {
            try {
                long pos = this.tokens.getPosition();
                buffer.reset();
                if (this.tokens.readLineSegment(buffer, true)) {
                    if (buffer.get(0) == 116) {
                        if (PdfTokenizer.checkTrailer(buffer)) {
                            this.tokens.seek(pos);
                            this.tokens.nextToken();
                            long pos2 = this.tokens.getPosition();
                            if (isCurrentObjectATrailer()) {
                                trailerIndex = Long.valueOf(pos2);
                            } else {
                                this.tokens.seek(pos2);
                            }
                        }
                    } else if (buffer.get(0) >= 48 && buffer.get(0) <= 57 && (obj = PdfTokenizer.checkObjectStart(lineTokenizer)) != null) {
                        int num = obj[0];
                        int gen = obj[1];
                        if (xref.get(num) == null || xref.get(num).getGenNumber() <= gen) {
                            xref.add(new PdfIndirectReference(this.pdfDocument, num, gen, pos));
                        }
                    }
                } else {
                    setTrailerFromTrailerIndex(trailerIndex);
                    lineTokenizer.close();
                    return;
                }
            } finally {
            }
        }
    }

    private boolean isCurrentObjectATrailer() {
        try {
            PdfDictionary dic = (PdfDictionary) readObject(false);
            return dic.get(PdfName.Root, false) != null;
        } catch (Exception e) {
            return false;
        }
    }

    private void setTrailerFromTrailerIndex(Long trailerIndex) throws IOException {
        if (trailerIndex == null) {
            throw new PdfException(KernelExceptionMessageConstant.TRAILER_NOT_FOUND);
        }
        this.tokens.seek(trailerIndex.longValue());
        PdfDictionary dic = (PdfDictionary) readObject(false);
        if (dic.get(PdfName.Root, false) != null) {
            this.trailer = dic;
        }
        if (this.trailer == null) {
            throw new PdfException(KernelExceptionMessageConstant.TRAILER_NOT_FOUND);
        }
    }

    protected PdfNumber getXrefPrev(PdfObject prevObjectToCheck) {
        PdfObject value;
        if (prevObjectToCheck == null) {
            return null;
        }
        if (prevObjectToCheck.getType() == 8) {
            return (PdfNumber) prevObjectToCheck;
        }
        if (prevObjectToCheck.getType() == 5 && StrictnessLevel.CONSERVATIVE.isStricter(getStrictnessLevel()) && (value = ((PdfIndirectReference) prevObjectToCheck).getRefersTo(true)) != null && value.getType() == 8) {
            return (PdfNumber) value;
        }
        throw new InvalidXRefPrevException(KernelExceptionMessageConstant.XREF_PREV_SHALL_BE_DIRECT_NUMBER_OBJECT);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isMemorySavingMode() {
        return this.memorySavingMode;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setXrefProcessor(XrefProcessor xrefProcessor) {
        this.xrefProcessor = xrefProcessor;
    }

    private void processArrayReadError() {
        String error = MessageFormatUtil.format(KernelExceptionMessageConstant.UNEXPECTED_TOKEN, new String(this.tokens.getByteContent(), StandardCharsets.UTF_8));
        if (StrictnessLevel.CONSERVATIVE.isStricter(getStrictnessLevel())) {
            Logger logger = LoggerFactory.getLogger(PdfReader.class);
            logger.error(error);
            return;
        }
        this.tokens.throwError(error, new Object[0]);
    }

    private void readDecryptObj() {
        PdfDictionary enc;
        if (this.encrypted || (enc = this.trailer.getAsDictionary(PdfName.Encrypt)) == null) {
            return;
        }
        this.encrypted = true;
        PdfName filter = enc.getAsName(PdfName.Filter);
        if (PdfName.Adobe_PubSec.equals(filter)) {
            if (this.properties.certificate == null) {
                throw new PdfException(KernelExceptionMessageConstant.CERTIFICATE_IS_NOT_PROVIDED_DOCUMENT_IS_ENCRYPTED_WITH_PUBLIC_KEY_CERTIFICATE);
            }
            this.decrypt = new PdfEncryption(enc, this.properties.certificateKey, this.properties.certificate, this.properties.certificateKeyProvider, this.properties.externalDecryptionProcess);
        } else if (PdfName.Standard.equals(filter)) {
            this.decrypt = new PdfEncryption(enc, this.properties.password, getOriginalFileId());
        } else {
            throw new UnsupportedSecurityHandlerException(MessageFormatUtil.format(KernelExceptionMessageConstant.UNSUPPORTED_SECURITY_HANDLER, filter));
        }
    }

    private PdfObject readObject(PdfIndirectReference reference, boolean fixXref) {
        PdfObject object;
        if (reference == null) {
            return null;
        }
        if (reference.refersTo != null) {
            return reference.refersTo;
        }
        try {
            this.currentIndirectReference = reference;
            if (reference.getObjStreamNumber() > 0) {
                PdfStream objectStream = (PdfStream) this.pdfDocument.getXref().get(reference.getObjStreamNumber()).getRefersTo(false);
                readObjectStream(objectStream);
                return reference.refersTo;
            } else if (reference.getOffset() <= 0) {
                return null;
            } else {
                try {
                    this.tokens.seek(reference.getOffset());
                    this.tokens.nextValidToken();
                    if (this.tokens.getTokenType() != PdfTokenizer.TokenType.Obj || this.tokens.getObjNr() != reference.getObjNumber() || this.tokens.getGenNr() != reference.getGenNumber()) {
                        this.tokens.throwError(KernelExceptionMessageConstant.INVALID_OFFSET_FOR_THIS_OBJECT, reference.toString());
                    }
                    object = readObject(false);
                } catch (RuntimeException ex) {
                    if (!fixXref || reference.getObjStreamNumber() != 0) {
                        throw ex;
                    }
                    fixXref();
                    object = readObject(reference, false);
                }
                if (object != null) {
                    return object.setIndirectReference(reference);
                }
                return null;
            }
        } catch (IOException e) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_READ_PDF_OBJECT, (Throwable) e);
        }
    }

    private void checkPdfStreamLength(PdfStream pdfStream) throws IOException {
        long pos;
        long pos2;
        int streamLength;
        if (!correctStreamLength) {
            return;
        }
        long fileLength = this.tokens.length();
        long start = pdfStream.getOffset();
        boolean calc = false;
        PdfNumber pdfNumber = pdfStream.getAsNumber(PdfName.Length);
        if (pdfNumber != null) {
            int streamLength2 = pdfNumber.intValue();
            if (streamLength2 + start > fileLength - 20) {
                calc = true;
            } else {
                this.tokens.seek(streamLength2 + start);
                String line = this.tokens.readString(20);
                if (!line.startsWith(endstream2) && !line.startsWith(endstream3) && !line.startsWith(endstream4) && !line.startsWith(endstream1)) {
                    calc = true;
                }
            }
        } else {
            pdfNumber = new PdfNumber(0);
            pdfStream.put(PdfName.Length, pdfNumber);
            calc = true;
        }
        if (calc) {
            ByteBuffer line2 = new ByteBuffer(16);
            this.tokens.seek(start);
            while (true) {
                long pos3 = this.tokens.getPosition();
                line2.reset();
                if (!this.tokens.readLineSegment(line2, false)) {
                    if (!StrictnessLevel.CONSERVATIVE.isStricter(this.strictnessLevel)) {
                        throw new PdfException(KernelExceptionMessageConstant.STREAM_SHALL_END_WITH_ENDSTREAM);
                    }
                    pos = pos3;
                } else if (line2.startsWith(endstream)) {
                    pos = pos3;
                    break;
                } else if (line2.startsWith(endobj)) {
                    pos = pos3;
                    this.tokens.seek(pos - 16);
                    String s = this.tokens.readString(16);
                    int index = s.indexOf(endstream1);
                    if (index >= 0) {
                        long fileLength2 = index;
                        pos2 = (pos - 16) + fileLength2;
                    }
                }
            }
            pos2 = pos;
            long fileLength3 = pos2 - start;
            int streamLength3 = (int) fileLength3;
            this.tokens.seek(pos2 - 2);
            if (this.tokens.read() == 13) {
                streamLength3--;
            }
            this.tokens.seek(pos2 - 1);
            if (this.tokens.read() != 10) {
                streamLength = streamLength3;
            } else {
                streamLength = streamLength3 - 1;
            }
            pdfNumber.setValue(streamLength);
            pdfStream.updateLength(streamLength);
        }
    }

    private PdfObject createPdfNullInstance(boolean readAsDirect) {
        if (readAsDirect) {
            return PdfNull.PDF_NULL;
        }
        return new PdfNull();
    }

    private static PdfTokenizer getOffsetTokeniser(IRandomAccessSource byteSource, boolean closeStream) throws IOException {
        PdfTokenizer tok = new PdfTokenizer(new RandomAccessFileOrArray(byteSource));
        try {
            int offset = tok.getHeaderOffset();
            if (offset != 0) {
                IRandomAccessSource offsetSource = new WindowRandomAccessSource(byteSource, offset);
                return new PdfTokenizer(new RandomAccessFileOrArray(offsetSource));
            }
            return tok;
        } catch (com.itextpdf.io.exceptions.IOException ex) {
            if (closeStream) {
                tok.close();
            }
            throw ex;
        }
    }

    private void processXref(PdfXrefTable xrefTable) throws IOException {
        long currentPosition = this.tokens.getPosition();
        try {
            this.xrefProcessor.processXref(xrefTable, this.tokens);
        } finally {
            this.tokens.seek(currentPosition);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes12.dex */
    public static class ReusableRandomAccessSource implements IRandomAccessSource {
        private ByteBuffer buffer;

        public ReusableRandomAccessSource(ByteBuffer buffer) {
            if (buffer == null) {
                throw new IllegalArgumentException("Passed byte buffer can not be null.");
            }
            this.buffer = buffer;
        }

        @Override // com.itextpdf.io.source.IRandomAccessSource
        public int get(long offset) {
            if (offset >= this.buffer.size()) {
                return -1;
            }
            return this.buffer.getInternalBuffer()[(int) offset] & UByte.MAX_VALUE;
        }

        @Override // com.itextpdf.io.source.IRandomAccessSource
        public int get(long offset, byte[] bytes, int off, int len) {
            if (this.buffer == null) {
                throw new IllegalStateException(IoExceptionMessageConstant.ALREADY_CLOSED);
            }
            if (offset >= this.buffer.size()) {
                return -1;
            }
            if (len + offset > this.buffer.size()) {
                len = (int) (this.buffer.size() - offset);
            }
            System.arraycopy(this.buffer.getInternalBuffer(), (int) offset, bytes, off, len);
            return len;
        }

        @Override // com.itextpdf.io.source.IRandomAccessSource
        public long length() {
            return this.buffer.size();
        }

        @Override // com.itextpdf.io.source.IRandomAccessSource
        public void close() {
            this.buffer = null;
        }
    }

    /* loaded from: classes12.dex */
    public enum StrictnessLevel {
        CONSERVATIVE(5000),
        LENIENT(3000);
        
        private final int levelValue;

        StrictnessLevel(int levelValue) {
            this.levelValue = levelValue;
        }

        public boolean isStricter(StrictnessLevel compareWith) {
            return compareWith == null || this.levelValue > compareWith.levelValue;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes12.dex */
    public static class XrefProcessor {
        void processXref(PdfXrefTable xrefTable, PdfTokenizer tokenizer) throws IOException {
        }
    }
}
