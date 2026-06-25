package com.itextpdf.io.exceptions;

import com.itextpdf.commons.exceptions.ITextException;
import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes12.dex */
public class IOException extends ITextException {
    private List<Object> messageParams;
    protected Object obj;

    public IOException(String message) {
        super(message);
    }

    public IOException(Throwable cause) {
        this(IoExceptionMessageConstant.UNKNOWN_IO_EXCEPTION, cause);
    }

    public IOException(String message, Object obj) {
        this(message);
        this.obj = obj;
    }

    public IOException(String message, Throwable cause) {
        super(message, cause);
    }

    public IOException(String message, Throwable cause, Object obj) {
        this(message, cause);
        this.obj = obj;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        if (this.messageParams == null || this.messageParams.size() == 0) {
            return super.getMessage();
        }
        return MessageFormatUtil.format(super.getMessage(), getMessageParams());
    }

    protected Object[] getMessageParams() {
        Object[] parameters = new Object[this.messageParams.size()];
        for (int i = 0; i < this.messageParams.size(); i++) {
            parameters[i] = this.messageParams.get(i);
        }
        return parameters;
    }

    public IOException setMessageParams(Object... messageParams) {
        this.messageParams = new ArrayList();
        Collections.addAll(this.messageParams, messageParams);
        return this;
    }
}
