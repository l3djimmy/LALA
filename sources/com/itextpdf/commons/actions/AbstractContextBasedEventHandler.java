package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.contexts.ContextManager;
import com.itextpdf.commons.actions.contexts.IContext;
/* loaded from: classes12.dex */
public abstract class AbstractContextBasedEventHandler implements IEventHandler {
    private final IContext defaultContext;

    protected abstract void onAcceptedEvent(AbstractContextBasedITextEvent abstractContextBasedITextEvent);

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractContextBasedEventHandler(IContext onUnknownContext) {
        this.defaultContext = onUnknownContext;
    }

    @Override // com.itextpdf.commons.actions.IEventHandler
    public final void onEvent(IEvent event) {
        if (!(event instanceof AbstractContextBasedITextEvent)) {
            return;
        }
        IContext context = null;
        AbstractContextBasedITextEvent iTextEvent = (AbstractContextBasedITextEvent) event;
        if (iTextEvent.getMetaInfo() != null) {
            context = ContextManager.getInstance().getContext(iTextEvent.getMetaInfo().getClass());
        }
        if (context == null) {
            context = ContextManager.getInstance().getContext(iTextEvent.getClassFromContext());
        }
        if (context == null) {
            context = this.defaultContext;
        }
        if (context.isAllowed(iTextEvent)) {
            onAcceptedEvent(iTextEvent);
        }
    }
}
