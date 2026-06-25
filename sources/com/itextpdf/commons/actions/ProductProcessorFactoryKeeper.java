package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.processors.DefaultProductProcessorFactory;
import com.itextpdf.commons.actions.processors.IProductProcessorFactory;
/* loaded from: classes12.dex */
final class ProductProcessorFactoryKeeper {
    private static final IProductProcessorFactory DEFAULT_FACTORY = new DefaultProductProcessorFactory();
    private static IProductProcessorFactory productProcessorFactory = DEFAULT_FACTORY;

    private ProductProcessorFactoryKeeper() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void setProductProcessorFactory(IProductProcessorFactory productProcessorFactory2) {
        productProcessorFactory = productProcessorFactory2;
    }

    static void restoreDefaultProductProcessorFactory() {
        productProcessorFactory = DEFAULT_FACTORY;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static IProductProcessorFactory getProductProcessorFactory() {
        return productProcessorFactory;
    }
}
