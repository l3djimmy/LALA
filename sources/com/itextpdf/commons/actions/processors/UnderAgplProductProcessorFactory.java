package com.itextpdf.commons.actions.processors;
/* loaded from: classes12.dex */
public class UnderAgplProductProcessorFactory implements IProductProcessorFactory {
    @Override // com.itextpdf.commons.actions.processors.IProductProcessorFactory
    public ITextProductEventProcessor createProcessor(String productName) {
        return new UnderAgplITextProductEventProcessor(productName);
    }
}
