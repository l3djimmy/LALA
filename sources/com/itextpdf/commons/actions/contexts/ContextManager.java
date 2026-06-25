package com.itextpdf.commons.actions.contexts;

import com.itextpdf.commons.actions.NamespaceConstant;
import com.itextpdf.commons.actions.ProductNameConstant;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.SortedMap;
import java.util.TreeMap;
/* loaded from: classes12.dex */
public class ContextManager {
    private static final ContextManager INSTANCE;
    private final SortedMap<String, IContext> contextMappings = new TreeMap(new LengthComparator());

    static {
        ContextManager local = new ContextManager();
        local.registerGenericContext(NamespaceConstant.ITEXT_CORE_NAMESPACES, Collections.singleton(ProductNameConstant.ITEXT_CORE));
        local.registerGenericContext(Collections.singleton(NamespaceConstant.CORE_SIGN), Collections.singleton(ProductNameConstant.ITEXT_CORE_SIGN));
        local.registerGenericContext(Collections.singletonList(NamespaceConstant.PDF_HTML), Collections.singleton(ProductNameConstant.PDF_HTML));
        local.registerGenericContext(Collections.singletonList(NamespaceConstant.PDF_SWEEP), Collections.singleton(ProductNameConstant.PDF_SWEEP));
        local.registerGenericContext(Collections.singletonList(NamespaceConstant.PDF_OCR_TESSERACT4), Collections.singleton(ProductNameConstant.PDF_OCR_TESSERACT4));
        INSTANCE = local;
    }

    ContextManager() {
    }

    public static ContextManager getInstance() {
        return INSTANCE;
    }

    public IContext getContext(Class<?> clazz) {
        if (clazz == null) {
            return null;
        }
        return getContext(clazz.getName());
    }

    public IContext getContext(String className) {
        return getNamespaceMapping(getRecognisedNamespace(className));
    }

    String getRecognisedNamespace(String className) {
        if (className != null) {
            String normalizedClassName = normalize(className);
            for (String namespace : this.contextMappings.keySet()) {
                if (normalizedClassName.startsWith(namespace)) {
                    return namespace;
                }
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void unregisterContext(Collection<String> namespaces) {
        for (String namespace : namespaces) {
            this.contextMappings.remove(normalize(namespace));
        }
    }

    private IContext getNamespaceMapping(String namespace) {
        if (namespace != null) {
            return this.contextMappings.get(namespace);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void registerGenericContext(Collection<String> namespaces, Collection<String> products) {
        GenericContext context = new GenericContext(products);
        for (String namespace : namespaces) {
            this.contextMappings.put(normalize(namespace), context);
        }
    }

    private static String normalize(String namespace) {
        return namespace.toLowerCase();
    }

    /* loaded from: classes12.dex */
    private static class LengthComparator implements Comparator<String> {
        private LengthComparator() {
        }

        @Override // java.util.Comparator
        public int compare(String o1, String o2) {
            int lengthComparison = Integer.compare(o2.length(), o1.length());
            if (lengthComparison == 0) {
                return o1.compareTo(o2);
            }
            return lengthComparison;
        }
    }
}
