package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.source.ByteUtils;
import com.itextpdf.io.source.OutputStream;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.filters.FlateDecodeFilter;
import java.io.IOException;
import java.util.Iterator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class PdfOutputStream extends OutputStream<PdfOutputStream> {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    protected PdfEncryption crypto;
    protected PdfDocument document;
    private static final byte[] stream = ByteUtils.getIsoBytes("stream\n");
    private static final byte[] endstream = ByteUtils.getIsoBytes("\nendstream");
    private static final byte[] openDict = ByteUtils.getIsoBytes("<<");
    private static final byte[] closeDict = ByteUtils.getIsoBytes(">>");
    private static final byte[] endIndirect = ByteUtils.getIsoBytes(" R");
    private static final byte[] endIndirectWithZeroGenNr = ByteUtils.getIsoBytes(" 0 R");
    private static final Logger LOGGER = LoggerFactory.getLogger(PdfOutputStream.class);

    public PdfOutputStream(java.io.OutputStream outputStream) {
        super(outputStream);
        this.document = null;
    }

    public PdfOutputStream write(PdfObject pdfObject) {
        boolean checkState = pdfObject.checkState((short) 64);
        PdfObject pdfObject2 = pdfObject;
        if (checkState) {
            pdfObject2 = pdfObject;
            if (this.document != null) {
                pdfObject.makeIndirect(this.document);
                pdfObject2 = pdfObject.getIndirectReference();
            }
        }
        if (pdfObject2.checkState((short) 256)) {
            throw new PdfException(KernelExceptionMessageConstant.CANNOT_WRITE_OBJECT_AFTER_IT_WAS_RELEASED);
        }
        switch (pdfObject2.getType()) {
            case 1:
                write((PdfArray) pdfObject2);
                break;
            case 2:
            case 7:
                write((PdfPrimitiveObject) pdfObject2);
                break;
            case 3:
                write((PdfDictionary) pdfObject2);
                break;
            case 4:
                write((PdfLiteral) pdfObject2);
                break;
            case 5:
                write((PdfIndirectReference) pdfObject2);
                break;
            case 6:
                write((PdfName) pdfObject2);
                break;
            case 8:
                write((PdfNumber) pdfObject2);
                break;
            case 9:
                write((PdfStream) pdfObject2);
                break;
            case 10:
                write((PdfString) pdfObject2);
                break;
        }
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void write(long bytes, int size) throws IOException {
        if (bytes < 0) {
            throw new AssertionError();
        }
        while (true) {
            size--;
            if (size >= 0) {
                write((byte) ((bytes >> (size * 8)) & 255));
            } else {
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void write(int bytes, int size) throws IOException {
        write(bytes & 4294967295L, size);
    }

    private void write(PdfArray pdfArray) {
        writeByte(91);
        for (int i = 0; i < pdfArray.size(); i++) {
            PdfObject value = pdfArray.get(i, false);
            PdfIndirectReference indirectReference = value.getIndirectReference();
            if (indirectReference != null) {
                write(indirectReference);
            } else {
                write(value);
            }
            if (i < pdfArray.size() - 1) {
                writeSpace();
            }
        }
        writeByte(93);
    }

    private void write(PdfDictionary pdfDictionary) {
        writeBytes(openDict);
        for (PdfName key : pdfDictionary.keySet()) {
            boolean isAlreadyWriteSpace = false;
            write(key);
            PdfObject value = pdfDictionary.get(key, false);
            if (value == null) {
                LOGGER.warn(MessageFormatUtil.format(IoLogMessageConstant.INVALID_KEY_VALUE_KEY_0_HAS_NULL_VALUE, key));
                value = PdfNull.PDF_NULL;
            }
            if (value.getType() == 8 || value.getType() == 4 || value.getType() == 2 || value.getType() == 7 || value.getType() == 5 || value.checkState((short) 64)) {
                isAlreadyWriteSpace = true;
                writeSpace();
            }
            PdfIndirectReference indirectReference = value.getIndirectReference();
            if (indirectReference != null) {
                if (!isAlreadyWriteSpace) {
                    writeSpace();
                }
                write(indirectReference);
            } else {
                write(value);
            }
        }
        writeBytes(closeDict);
    }

    private void write(PdfIndirectReference indirectReference) {
        if (this.document != null && !indirectReference.getDocument().equals(this.document)) {
            throw new PdfException(KernelExceptionMessageConstant.PDF_INDIRECT_OBJECT_BELONGS_TO_OTHER_PDF_DOCUMENT);
        }
        if (indirectReference.isFree()) {
            LOGGER.error(IoLogMessageConstant.FLUSHED_OBJECT_CONTAINS_FREE_REFERENCE);
            write((PdfPrimitiveObject) PdfNull.PDF_NULL);
        } else if (indirectReference.refersTo == null && (indirectReference.checkState((short) 8) || indirectReference.getReader() == null || (indirectReference.getOffset() <= 0 && indirectReference.getIndex() < 0))) {
            LOGGER.error(IoLogMessageConstant.FLUSHED_OBJECT_CONTAINS_REFERENCE_WHICH_NOT_REFER_TO_ANY_OBJECT);
            write((PdfPrimitiveObject) PdfNull.PDF_NULL);
        } else if (indirectReference.getGenNumber() == 0) {
            writeInteger(indirectReference.getObjNumber()).writeBytes(endIndirectWithZeroGenNr);
        } else {
            writeInteger(indirectReference.getObjNumber()).writeSpace().writeInteger(indirectReference.getGenNumber()).writeBytes(endIndirect);
        }
    }

    private void write(PdfPrimitiveObject pdfPrimitive) {
        writeBytes(pdfPrimitive.getInternalContent());
    }

    private void write(PdfLiteral literal) {
        literal.setPosition(getCurrentPos());
        writeBytes(literal.getInternalContent());
    }

    private void write(PdfString pdfString) {
        pdfString.encrypt(this.crypto);
        if (pdfString.isHexWriting()) {
            writeByte(60);
            writeBytes(pdfString.getInternalContent());
            writeByte(62);
            return;
        }
        writeByte(40);
        writeBytes(pdfString.getInternalContent());
        writeByte(41);
    }

    private void write(PdfName name) {
        writeByte(47);
        writeBytes(name.getInternalContent());
    }

    private void write(PdfNumber pdfNumber) {
        if (pdfNumber.hasContent()) {
            writeBytes(pdfNumber.getInternalContent());
        } else if (pdfNumber.isDoubleNumber()) {
            writeDouble(pdfNumber.getValue());
        } else {
            writeInteger(pdfNumber.intValue());
        }
    }

    private boolean isNotMetadataPdfStream(PdfStream pdfStream) {
        return pdfStream.getAsName(PdfName.Type) == null || !(pdfStream.getAsName(PdfName.Type) == null || pdfStream.getAsName(PdfName.Type).equals(PdfName.Metadata));
    }

    private boolean isXRefStream(PdfStream pdfStream) {
        return PdfName.XRef.equals(pdfStream.getAsName(PdfName.Type));
    }

    /* JADX WARN: Removed duplicated region for block: B:79:0x0199 A[Catch: IOException -> 0x01dc, TRY_LEAVE, TryCatch #1 {IOException -> 0x01dc, blocks: (B:56:0x00fb, B:58:0x0101, B:62:0x010b, B:64:0x0120, B:68:0x0151, B:77:0x0193, B:79:0x0199, B:65:0x013e, B:67:0x0144, B:69:0x0155, B:70:0x015a, B:71:0x015b, B:73:0x015f, B:74:0x0182, B:76:0x0188, B:85:0x01d6, B:86:0x01db), top: B:96:0x00fb, outer: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void write(com.itextpdf.kernel.pdf.PdfStream r13) {
        /*
            Method dump skipped, instructions count: 502
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.kernel.pdf.PdfOutputStream.write(com.itextpdf.kernel.pdf.PdfStream):void");
    }

    protected boolean checkEncryption(PdfStream pdfStream) {
        if (this.crypto == null || ((this.crypto.isEmbeddedFilesOnly() && !this.document.doesStreamBelongToEmbeddedFile(pdfStream)) || isXRefStream(pdfStream))) {
            return false;
        }
        PdfObject filter = pdfStream.get(PdfName.Filter, true);
        if (filter == null) {
            return true;
        }
        if (filter.isFlushed()) {
            IndirectFilterUtils.throwFlushedFilterException(pdfStream);
        }
        if (PdfName.Crypt.equals(filter)) {
            return false;
        }
        if (filter.getType() == 1) {
            PdfArray filters = (PdfArray) filter;
            if (filters.isEmpty()) {
                return true;
            }
            if (filters.get(0).isFlushed()) {
                IndirectFilterUtils.throwFlushedFilterException(pdfStream);
            }
            return !PdfName.Crypt.equals(filters.get(0, true));
        }
        return true;
    }

    protected boolean containsFlateFilter(PdfStream pdfStream) {
        PdfObject filter = pdfStream.get(PdfName.Filter);
        if (filter == null) {
            return false;
        }
        if (filter.isFlushed()) {
            IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, pdfStream);
            return true;
        } else if (filter.getType() != 6 && filter.getType() != 1) {
            throw new PdfException(KernelExceptionMessageConstant.FILTER_IS_NOT_A_NAME_OR_ARRAY);
        } else {
            if (filter.getType() == 6) {
                return PdfName.FlateDecode.equals(filter);
            }
            Iterator<PdfObject> it = ((PdfArray) filter).iterator();
            while (it.hasNext()) {
                PdfObject obj = it.next();
                if (obj.isFlushed()) {
                    IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, pdfStream);
                    return true;
                }
            }
            return ((PdfArray) filter).contains(PdfName.FlateDecode);
        }
    }

    protected void updateCompressionFilter(PdfStream pdfStream) {
        PdfObject filter = pdfStream.get(PdfName.Filter);
        if (filter == null) {
            pdfStream.remove(PdfName.DecodeParms);
            pdfStream.put(PdfName.Filter, PdfName.FlateDecode);
            return;
        }
        PdfArray filters = new PdfArray();
        filters.add(PdfName.FlateDecode);
        if (filter instanceof PdfArray) {
            filters.addAll((PdfArray) filter);
        } else {
            filters.add(filter);
        }
        PdfObject decodeParms = pdfStream.get(PdfName.DecodeParms);
        if (decodeParms != null) {
            if (decodeParms instanceof PdfDictionary) {
                PdfArray array = new PdfArray();
                array.add(new PdfNull());
                array.add(decodeParms);
                pdfStream.put(PdfName.DecodeParms, array);
            } else if (decodeParms instanceof PdfArray) {
                ((PdfArray) decodeParms).add(0, new PdfNull());
            } else {
                throw new PdfException(KernelExceptionMessageConstant.THIS_DECODE_PARAMETER_TYPE_IS_NOT_SUPPORTED).setMessageParams(decodeParms.getClass().toString());
            }
        }
        pdfStream.put(PdfName.Filter, filters);
    }

    protected byte[] decodeFlateBytes(PdfStream stream2, byte[] bytes) {
        PdfName filterName;
        PdfDictionary decodeParams;
        PdfObject filterObject = stream2.get(PdfName.Filter);
        if (filterObject == null) {
            return bytes;
        }
        PdfArray filtersArray = null;
        if (filterObject instanceof PdfName) {
            filterName = (PdfName) filterObject;
        } else if (filterObject instanceof PdfArray) {
            filtersArray = (PdfArray) filterObject;
            if (filtersArray.isFlushed()) {
                IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, stream2);
                return bytes;
            }
            filterName = filtersArray.getAsName(0);
        } else {
            throw new PdfException(KernelExceptionMessageConstant.FILTER_IS_NOT_A_NAME_OR_ARRAY);
        }
        if (filterName.isFlushed()) {
            IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, stream2);
            return bytes;
        } else if (!PdfName.FlateDecode.equals(filterName)) {
            return bytes;
        } else {
            PdfArray decodeParamsArray = null;
            PdfObject decodeParamsObject = stream2.get(PdfName.DecodeParms);
            if (decodeParamsObject == null) {
                decodeParams = null;
            } else if (decodeParamsObject.isFlushed()) {
                IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, stream2);
                return bytes;
            } else if (decodeParamsObject.getType() != 3) {
                if (decodeParamsObject.getType() == 1) {
                    decodeParamsArray = (PdfArray) decodeParamsObject;
                    decodeParams = decodeParamsArray.getAsDictionary(0);
                } else {
                    throw new PdfException(KernelExceptionMessageConstant.THIS_DECODE_PARAMETER_TYPE_IS_NOT_SUPPORTED).setMessageParams(decodeParamsObject.getClass().toString());
                }
            } else {
                decodeParams = (PdfDictionary) decodeParamsObject;
            }
            if (decodeParams != null && (decodeParams.isFlushed() || isFlushed(decodeParams, PdfName.Predictor) || isFlushed(decodeParams, PdfName.Columns) || isFlushed(decodeParams, PdfName.Colors) || isFlushed(decodeParams, PdfName.BitsPerComponent))) {
                IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, stream2);
                return bytes;
            }
            byte[] res = FlateDecodeFilter.flateDecode(bytes, true);
            if (res == null) {
                res = FlateDecodeFilter.flateDecode(bytes, false);
            }
            byte[] bytes2 = FlateDecodeFilter.decodePredictor(res, decodeParams);
            PdfObject filterObject2 = null;
            if (filtersArray != null) {
                filtersArray.remove(0);
                if (filtersArray.size() == 1) {
                    filterObject2 = filtersArray.get(0);
                } else if (!filtersArray.isEmpty()) {
                    filterObject2 = filtersArray;
                }
            }
            PdfObject decodeParamsObject2 = null;
            if (decodeParamsArray != null) {
                decodeParamsArray.remove(0);
                if (decodeParamsArray.size() == 1 && decodeParamsArray.get(0).getType() != 7) {
                    decodeParamsObject2 = decodeParamsArray.get(0);
                } else if (!decodeParamsArray.isEmpty()) {
                    decodeParamsObject2 = decodeParamsArray;
                }
            }
            if (filterObject2 == null) {
                stream2.remove(PdfName.Filter);
            } else {
                stream2.put(PdfName.Filter, filterObject2);
            }
            if (decodeParamsObject2 == null) {
                stream2.remove(PdfName.DecodeParms);
            } else {
                stream2.put(PdfName.DecodeParms, decodeParamsObject2);
            }
            return bytes2;
        }
    }

    private static boolean isFlushed(PdfDictionary dict, PdfName name) {
        PdfObject obj = dict.get(name);
        return obj != null && obj.isFlushed();
    }

    private static boolean decodeParamsArrayNotFlushed(PdfStream pdfStream) {
        PdfArray decodeParams = pdfStream.getAsArray(PdfName.DecodeParms);
        if (decodeParams == null || !decodeParams.isFlushed()) {
            return true;
        }
        IndirectFilterUtils.logFilterWasAlreadyFlushed(LOGGER, pdfStream);
        return false;
    }
}
