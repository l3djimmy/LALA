package com.itextpdf.kernel.exceptions;

import com.itextpdf.commons.exceptions.ITextException;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class PdfException extends ITextException {
    private List<Object> messageParams;
    protected Object object;

    public PdfException(String message) {
        super(message);
    }

    public PdfException(Throwable cause) {
        this(KernelExceptionMessageConstant.UNKNOWN_PDF_EXCEPTION, cause);
    }

    public PdfException(String message, Object obj) {
        this(message);
        this.object = obj;
    }

    public PdfException(String message, Throwable cause) {
        super(message, cause);
    }

    public PdfException(String message, Throwable cause, Object obj) {
        this(message, cause);
        this.object = obj;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        if (this.messageParams == null || this.messageParams.size() == 0) {
            return super.getMessage();
        }
        return MessageFormatUtil.format(super.getMessage(), getMessageParams());
    }

    public PdfException setMessageParams(Object... messageParams) {
        this.messageParams = new ArrayList();
        Collections.addAll(this.messageParams, messageParams);
        return this;
    }

    protected Object[] getMessageParams() {
        Object[] parameters = new Object[this.messageParams.size()];
        for (int i = 0; i < this.messageParams.size(); i++) {
            parameters[i] = this.messageParams.get(i);
        }
        return parameters;
    }
}
