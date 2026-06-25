package com.itextpdf.kernel.actions.events;

import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.confirmations.EventConfirmationType;
import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.sequence.SequenceId;
import com.itextpdf.kernel.actions.data.ITextCoreProductData;
/* loaded from: classes12.dex */
public final class ITextCoreProductEvent extends AbstractProductProcessITextEvent {
    public static final String PROCESS_PDF = "process-pdf";
    private final String eventType;

    private ITextCoreProductEvent(SequenceId sequenceId, IMetaInfo metaInfo, String eventType, EventConfirmationType confirmationType) {
        super(sequenceId, ITextCoreProductData.getInstance(), metaInfo, confirmationType);
        this.eventType = eventType;
    }

    public static ITextCoreProductEvent createProcessPdfEvent(SequenceId sequenceId, IMetaInfo metaInfo, EventConfirmationType confirmationType) {
        return new ITextCoreProductEvent(sequenceId, metaInfo, PROCESS_PDF, confirmationType);
    }

    @Override // com.itextpdf.commons.actions.AbstractProductProcessITextEvent
    public String getEventType() {
        return this.eventType;
    }
}
