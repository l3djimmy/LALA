package com.itextpdf.kernel.pdf;

import com.itextpdf.commons.actions.contexts.IMetaInfo;
/* loaded from: classes12.dex */
public class DocumentProperties {
    protected IMetaInfo metaInfo;

    public DocumentProperties() {
        this.metaInfo = null;
    }

    public DocumentProperties(DocumentProperties other) {
        this.metaInfo = null;
        this.metaInfo = other.metaInfo;
    }

    public DocumentProperties setEventCountingMetaInfo(IMetaInfo metaInfo) {
        this.metaInfo = metaInfo;
        return this;
    }

    public boolean isEventCountingMetaInfoSet() {
        return this.metaInfo != null;
    }
}
