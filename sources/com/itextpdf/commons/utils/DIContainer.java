package com.itextpdf.commons.utils;

import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Supplier;
/* loaded from: classes12.dex */
public class DIContainer {
    private static final ConcurrentHashMap<Class<?>, Supplier<Object>> instances = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Class<?>, Object> localInstances = new ConcurrentHashMap<>();

    static {
        DIContainerConfigurations.loadDefaultConfigurations();
    }

    public static void registerDefault(Class<?> clazz, Supplier<Object> supplier) {
        instances.put(clazz, supplier);
    }

    public void register(Class<?> clazz, Object inst) {
        this.localInstances.put(clazz, inst);
    }

    public <T> T getInstance(Class<T> clazz) {
        Object supplier = (T) this.localInstances.get(clazz);
        if (supplier == null) {
            supplier = (T) instances.get(clazz).get();
        }
        if (supplier != null) {
            return (T) supplier;
        }
        throw new RuntimeException("No instance registered for class " + clazz.getName());
    }

    public boolean isRegistered(Class<?> clazz) {
        return this.localInstances.containsKey(clazz) || instances.containsKey(clazz);
    }
}
