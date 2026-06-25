package com.itextpdf.commons.actions;

import com.itextpdf.commons.actions.processors.UnderAgplProductProcessorFactory;
import com.itextpdf.commons.exceptions.AggregatedException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes12.dex */
public final class EventManager {
    private static final EventManager INSTANCE = new EventManager();
    private final Set<IEventHandler> handlers = new LinkedHashSet();

    private EventManager() {
        this.handlers.add(ProductEventHandler.INSTANCE);
    }

    public static EventManager getInstance() {
        return INSTANCE;
    }

    public static void acknowledgeAgplUsageDisableWarningMessage() {
        ProductProcessorFactoryKeeper.setProductProcessorFactory(new UnderAgplProductProcessorFactory());
    }

    public void onEvent(IEvent event) {
        List<RuntimeException> caughtExceptions = new ArrayList<>();
        for (IEventHandler handler : this.handlers) {
            try {
                handler.onEvent(event);
            } catch (RuntimeException ex) {
                caughtExceptions.add(ex);
            }
        }
        if (event instanceof AbstractITextConfigurationEvent) {
            try {
                AbstractITextConfigurationEvent itce = (AbstractITextConfigurationEvent) event;
                itce.doAction();
            } catch (RuntimeException ex2) {
                caughtExceptions.add(ex2);
            }
        }
        if (caughtExceptions.size() == 1) {
            throw caughtExceptions.get(0);
        }
        if (!caughtExceptions.isEmpty()) {
            throw new AggregatedException(AggregatedException.ERROR_DURING_EVENT_PROCESSING, caughtExceptions);
        }
    }

    public void register(IEventHandler handler) {
        if (handler != null) {
            this.handlers.add(handler);
        }
    }

    public boolean isRegistered(IEventHandler handler) {
        if (handler != null) {
            return this.handlers.contains(handler);
        }
        return false;
    }

    public boolean unregister(IEventHandler handler) {
        if (handler != null) {
            return this.handlers.remove(handler);
        }
        return false;
    }
}
