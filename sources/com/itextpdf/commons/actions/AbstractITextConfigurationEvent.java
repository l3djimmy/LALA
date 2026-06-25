package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.processors.ITextProductEventProcessor;
import com.itextpdf.commons.actions.sequence.SequenceId;
import java.util.List;
import java.util.Map;
/* loaded from: classes12.dex */
public abstract class AbstractITextConfigurationEvent extends AbstractITextEvent {
    /* JADX INFO: Access modifiers changed from: protected */
    public abstract void doAction();

    protected ITextProductEventProcessor addProcessor(ITextProductEventProcessor processor) {
        return ProductEventHandler.INSTANCE.addProcessor(processor);
    }

    protected ITextProductEventProcessor removeProcessor(String productName) {
        return ProductEventHandler.INSTANCE.removeProcessor(productName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ITextProductEventProcessor getActiveProcessor(String productName) {
        return ProductEventHandler.INSTANCE.getActiveProcessor(productName);
    }

    protected Map<String, ITextProductEventProcessor> getProcessors() {
        return ProductEventHandler.INSTANCE.getProcessors();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<AbstractProductProcessITextEvent> getEvents(SequenceId id) {
        return ProductEventHandler.INSTANCE.getEvents(id);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void addEvent(SequenceId id, AbstractProductProcessITextEvent event) {
        ProductEventHandler.INSTANCE.addEvent(id, event);
    }

    protected void registerInternalNamespace(String namespace) {
        AbstractITextEvent.registerNamespace(namespace);
    }
}
