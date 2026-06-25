package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.actions.data.ProductData;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
/* loaded from: classes12.dex */
public class FingerPrint {
    private Set<ProductData> productDataSet = new LinkedHashSet();

    public boolean registerProduct(ProductData productData) {
        int initialSize = this.productDataSet.size();
        this.productDataSet.add(productData);
        return initialSize != this.productDataSet.size();
    }

    public Collection<ProductData> getProducts() {
        return Collections.unmodifiableSet(new LinkedHashSet(this.productDataSet));
    }
}
