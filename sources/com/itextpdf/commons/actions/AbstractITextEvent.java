package com.itextpdf.commons.actions;

import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes12.dex */
public abstract class AbstractITextEvent implements IEvent {
    private static final Map<String, Object> INTERNAL_PACKAGES = new ConcurrentHashMap();
    private static final String ONLY_FOR_INTERNAL_USE = "AbstractITextEvent is only for internal usage.";

    static {
        registerNamespace(NamespaceConstant.ITEXT);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbstractITextEvent() {
        boolean isUnknown = true;
        Iterator<String> it = INTERNAL_PACKAGES.keySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            String namespace = it.next();
            if (getClass().getName().startsWith(namespace)) {
                isUnknown = false;
                break;
            }
        }
        if (isUnknown) {
            throw new UnsupportedOperationException(ONLY_FOR_INTERNAL_USE);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void registerNamespace(String namespace) {
        INTERNAL_PACKAGES.put(namespace + ".", new Object());
    }
}
