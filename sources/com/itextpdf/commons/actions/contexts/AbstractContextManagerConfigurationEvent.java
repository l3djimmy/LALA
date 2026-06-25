package com.itextpdf.commons.actions.contexts;

import com.itextpdf.commons.actions.AbstractITextConfigurationEvent;
import java.util.Collection;
/* loaded from: classes12.dex */
public abstract class AbstractContextManagerConfigurationEvent extends AbstractITextConfigurationEvent {
    protected AbstractContextManagerConfigurationEvent() {
    }

    protected void registerGenericContext(Collection<String> namespaces, Collection<String> products) {
        ContextManager.getInstance().registerGenericContext(namespaces, products);
    }

    protected void unregisterContext(Collection<String> namespaces) {
        ContextManager.getInstance().unregisterContext(namespaces);
    }
}
