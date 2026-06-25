package com.itextpdf.commons.actions.confirmations;

import com.itextpdf.commons.actions.AbstractEventWrapper;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
import com.itextpdf.commons.actions.sequence.SequenceId;
/* loaded from: classes12.dex */
public class ConfirmEvent extends AbstractEventWrapper {
    public ConfirmEvent(SequenceId updatedSequenceId, AbstractProductProcessITextEvent confirmedEvent) {
        super(updatedSequenceId, confirmedEvent, EventConfirmationType.UNCONFIRMABLE);
    }

    public ConfirmEvent(AbstractProductProcessITextEvent confirmedEvent) {
        this(confirmedEvent.getSequenceId(), confirmedEvent);
    }

    public AbstractProductProcessITextEvent getConfirmedEvent() {
        AbstractProductProcessITextEvent event = getEvent();
        if (event instanceof ConfirmEvent) {
            return ((ConfirmEvent) event).getConfirmedEvent();
        }
        return event;
    }
}
