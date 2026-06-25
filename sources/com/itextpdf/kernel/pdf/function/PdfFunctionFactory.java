package com.itextpdf.kernel.pdf.function;

import com.itextpdf.commons.utils.MessageFormatUtil;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfObject;
import com.itextpdf.kernel.pdf.PdfStream;
/* loaded from: classes12.dex */
public final class PdfFunctionFactory {
    public static final int FUNCTION_TYPE_0 = 0;
    public static final int FUNCTION_TYPE_2 = 2;
    public static final int FUNCTION_TYPE_3 = 3;
    public static final int FUNCTION_TYPE_4 = 4;

    private PdfFunctionFactory() {
    }

    public static IPdfFunction create(PdfObject pdfObject) {
        if (pdfObject.isDictionary() || pdfObject.isStream()) {
            PdfDictionary dict = (PdfDictionary) pdfObject;
            switch (dict.getAsNumber(PdfName.FunctionType).intValue()) {
                case 0:
                    if (pdfObject.getType() != 9) {
                        throw new PdfException(KernelExceptionMessageConstant.FUCTIONFACTORY_INVALID_OBJECT_TYPE_TYPE0);
                    }
                    return new PdfType0Function((PdfStream) pdfObject);
                case 1:
                default:
                    throw new PdfException(MessageFormatUtil.format(KernelExceptionMessageConstant.FUCTIONFACTORY_INVALID_FUNCTION_TYPE, Integer.valueOf(dict.getAsNumber(PdfName.FunctionType).intValue())));
                case 2:
                    return new PdfType2Function(dict);
                case 3:
                    return new PdfType3Function(dict);
                case 4:
                    if (pdfObject.getType() != 9) {
                        throw new PdfException(KernelExceptionMessageConstant.FUCTIONFACTORY_INVALID_OBJECT_TYPE_TYPE4);
                    }
                    return new PdfType4Function((PdfStream) pdfObject);
            }
        }
        throw new PdfException(KernelExceptionMessageConstant.FUCTIONFACTORY_INVALID_OBJECT_TYPE);
    }
}
