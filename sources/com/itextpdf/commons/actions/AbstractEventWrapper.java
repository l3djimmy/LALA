package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.confirmations.EventConfirmationType;
import com.itextpdf.commons.actions.sequence.SequenceId;
/* loaded from: classes12.dex */
public abstract class AbstractEventWrapper extends AbstractProductProcessITextEvent {
    private final AbstractProductProcessITextEvent event;

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractEventWrapper(AbstractProductProcessITextEvent event, EventConfirmationType confirmationType) {
        super(event.getSequenceId(), event.getProductData(), event.getMetaInfo(), confirmationType);
        this.event = event;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractEventWrapper(SequenceId updatedSequenceId, AbstractProductProcessITextEvent event, EventConfirmationType confirmationType) {
        super(updatedSequenceId, event.getProductData(), event.getMetaInfo(), confirmationType);
        this.event = event;
    }

    public AbstractProductProcessITextEvent getEvent() {
        return this.event;
    }

    @Override // com.itextpdf.commons.actions.AbstractContextBasedITextEvent
    public Class<?> getClassFromContext() {
        return getEvent().getClassFromContext();
    }

    @Override // com.itextpdf.commons.actions.AbstractProductProcessITextEvent
    public String getEventType() {
        return getEvent().getEventType();
    }
}
