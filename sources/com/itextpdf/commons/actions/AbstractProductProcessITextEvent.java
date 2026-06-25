package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.confirmations.EventConfirmationType;
import com.itextpdf.commons.actions.contexts.IMetaInfo;
import com.itextpdf.commons.actions.data.ProductData;
import com.itextpdf.commons.actions.sequence.SequenceId;
import java.lang.ref.WeakReference;
/* loaded from: classes12.dex */
public abstract class AbstractProductProcessITextEvent extends AbstractContextBasedITextEvent {
    private final EventConfirmationType confirmationType;
    private final WeakReference<SequenceId> sequenceId;

    public abstract String getEventType();

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractProductProcessITextEvent(SequenceId sequenceId, ProductData productData, IMetaInfo metaInfo, EventConfirmationType confirmationType) {
        super(productData, metaInfo);
        this.sequenceId = new WeakReference<>(sequenceId);
        this.confirmationType = confirmationType;
    }

    protected AbstractProductProcessITextEvent(ProductData productData, IMetaInfo metaInfo, EventConfirmationType confirmationType) {
        this(null, productData, metaInfo, confirmationType);
    }

    public SequenceId getSequenceId() {
        return this.sequenceId.get();
    }

    public EventConfirmationType getConfirmationType() {
        return this.confirmationType;
    }
}
