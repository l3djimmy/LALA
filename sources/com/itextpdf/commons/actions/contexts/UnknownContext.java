package com.itextpdf.commons.actions.contexts;

import com.itextpdf.commons.actions.AbstractContextBasedITextEvent;
/* loaded from: classes12.dex */
public class UnknownContext implements IContext {
    private final boolean allowEvents;
    public static final IContext RESTRICTIVE = new UnknownContext(false);
    public static final IContext PERMISSIVE = new UnknownContext(true);

    public UnknownContext(boolean allowEvents) {
        this.allowEvents = allowEvents;
    }

    @Override // com.itextpdf.commons.actions.contexts.IContext
    public boolean isAllowed(AbstractContextBasedITextEvent event) {
        return this.allowEvents;
    }
}
