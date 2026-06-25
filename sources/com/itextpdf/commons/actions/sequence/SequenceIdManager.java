package com.itextpdf.commons.actions.sequence;

import com.itextpdf.commons.exceptions.CommonsExceptionMessageConstant;
import com.itextpdf.commons.utils.MessageFormatUtil;
/* loaded from: classes12.dex */
public final class SequenceIdManager {
    private SequenceIdManager() {
    }

    public static void setSequenceId(AbstractIdentifiableElement element, SequenceId sequenceId) {
        synchronized (element) {
            if (element.getSequenceId() == null) {
                element.setSequenceId(sequenceId);
            } else {
                throw new IllegalStateException(MessageFormatUtil.format(CommonsExceptionMessageConstant.ELEMENT_ALREADY_HAS_IDENTIFIER, Long.valueOf(element.getSequenceId().getId()), Long.valueOf(sequenceId.getId())));
            }
        }
    }

    public static SequenceId getSequenceId(AbstractIdentifiableElement element) {
        return element.getSequenceId();
    }
}
