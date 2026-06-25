package com.itextpdf.commons.actions.processors;

import com.itextpdf.commons.actions.AbstractProductProcessITextEvent;
/* loaded from: classes12.dex */
public class UnderAgplITextProductEventProcessor extends AbstractITextProductEventProcessor {
    public UnderAgplITextProductEventProcessor(String productName) {
        super(productName);
    }

    @Override // com.itextpdf.commons.actions.processors.AbstractITextProductEventProcessor, com.itextpdf.commons.actions.processors.ITextProductEventProcessor
    public void onEvent(AbstractProductProcessITextEvent event) {
    }

    @Override // com.itextpdf.commons.actions.processors.AbstractITextProductEventProcessor, com.itextpdf.commons.actions.processors.ITextProductEventProcessor
    public String getUsageType() {
        return "AGPL";
    }
}
