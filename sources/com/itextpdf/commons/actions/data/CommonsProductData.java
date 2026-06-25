package com.itextpdf.commons.actions.data;
/* loaded from: classes12.dex */
public final class CommonsProductData {
    static final String COMMONS_PUBLIC_PRODUCT_NAME = "Commons";
    static final String COMMONS_PRODUCT_NAME = "commons";
    static final String COMMONS_VERSION = "8.0.4";
    static final String MINIMAL_COMPATIBLE_LICENSEKEY_VERSION = "4.1.0";
    static final int COMMONS_COPYRIGHT_SINCE = 2000;
    static final int COMMONS_COPYRIGHT_TO = 2024;
    private static final ProductData COMMONS_PRODUCT_DATA = new ProductData(COMMONS_PUBLIC_PRODUCT_NAME, COMMONS_PRODUCT_NAME, COMMONS_VERSION, MINIMAL_COMPATIBLE_LICENSEKEY_VERSION, COMMONS_COPYRIGHT_SINCE, COMMONS_COPYRIGHT_TO);

    private CommonsProductData() {
    }

    public static ProductData getInstance() {
        return COMMONS_PRODUCT_DATA;
    }
}
