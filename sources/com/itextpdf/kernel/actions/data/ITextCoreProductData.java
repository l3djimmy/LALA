package com.itextpdf.kernel.actions.data;

import com.itextpdf.commons.actions.ProductNameConstant;
import com.itextpdf.commons.actions.data.ProductData;
/* loaded from: classes12.dex */
public final class ITextCoreProductData {
    private static final String CORE_PUBLIC_PRODUCT_NAME = "Core";
    private static final String CORE_VERSION = "8.0.4";
    private static final int CORE_COPYRIGHT_SINCE = 2000;
    private static final int CORE_COPYRIGHT_TO = 2024;
    private static final ProductData ITEXT_PRODUCT_DATA = new ProductData(CORE_PUBLIC_PRODUCT_NAME, ProductNameConstant.ITEXT_CORE, CORE_VERSION, CORE_COPYRIGHT_SINCE, CORE_COPYRIGHT_TO);

    private ITextCoreProductData() {
    }

    public static ProductData getInstance() {
        return ITEXT_PRODUCT_DATA;
    }
}
