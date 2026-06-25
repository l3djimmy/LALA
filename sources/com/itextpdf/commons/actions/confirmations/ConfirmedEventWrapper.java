package com.itextpdf.commons.actions.confirmations;

import com.itextpdf.commons.actions.AbstractEventWrapper;
import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
/* loaded from: classes12.dex */
public class ConfirmedEventWrapper extends AbstractEventWrapper {
    private final String producerLine;
    private final String productUsageType;

    public ConfirmedEventWrapper(AbstractProductProcessITextEvent event, String productUsageType, String producerLine) {
        super(event, EventConfirmationType.UNCONFIRMABLE);
        this.productUsageType = productUsageType;
        this.producerLine = producerLine;
    }

    public String getProductUsageType() {
        return this.productUsageType;
    }

    public String getProducerLine() {
        return this.producerLine;
    }
}
