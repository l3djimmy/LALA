package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.data.ProductData;
/* loaded from: classes12.dex */
public abstract class AbstractContextBasedITextEvent extends AbstractProductITextEvent {
    private IMetaInfo metaInfo;

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractContextBasedITextEvent(ProductData productData, IMetaInfo metaInfo) {
        super(productData);
        this.metaInfo = metaInfo;
    }

    public Class<?> getClassFromContext() {
        return getClass();
    }

    public boolean setMetaInfo(IMetaInfo metaInfo) {
        if (this.metaInfo != null) {
            return false;
        }
        this.metaInfo = metaInfo;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IMetaInfo getMetaInfo() {
        return this.metaInfo;
    }
}
