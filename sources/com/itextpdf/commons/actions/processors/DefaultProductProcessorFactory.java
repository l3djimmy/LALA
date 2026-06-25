package com.itextpdf.commons.actions.processors;
/* loaded from: classes12.dex */
public class DefaultProductProcessorFactory implements IProductProcessorFactory {
    @Override // com.itextpdf.commons.actions.processors.IProductProcessorFactory
    public ITextProductEventProcessor createProcessor(String productName) {
        return new DefaultITextProductEventProcessor(productName);
    }
}
