package com.itextpdf.commons.utils;

import java.util.Map;
import java.util.function.BiFunction;
/* loaded from: classes12.dex */
public final class MapUtil {
    private static final int HASH_MULTIPLIER = 31;

    private MapUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0032  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static <K, V> boolean equals(java.util.Map<K, V> r7, java.util.Map<K, V> r8) {
        /*
            r0 = 1
            if (r7 != r8) goto L4
            return r0
        L4:
            r1 = 0
            if (r7 == 0) goto L58
            if (r8 != 0) goto La
            goto L58
        La:
            java.lang.Class r2 = r7.getClass()
            java.lang.Class r3 = r8.getClass()
            boolean r2 = r2.equals(r3)
            if (r2 != 0) goto L19
            return r1
        L19:
            int r2 = r7.size()
            int r3 = r8.size()
            if (r2 == r3) goto L24
            return r1
        L24:
            java.util.Set r2 = r7.entrySet()
            java.util.Iterator r2 = r2.iterator()
        L2c:
            boolean r3 = r2.hasNext()
            if (r3 == 0) goto L57
            java.lang.Object r3 = r2.next()
            java.util.Map$Entry r3 = (java.util.Map.Entry) r3
            java.lang.Object r4 = r3.getValue()
            java.lang.Object r5 = r3.getKey()
            java.lang.Object r5 = r8.get(r5)
            java.lang.Object r6 = r3.getKey()
            boolean r6 = r8.containsKey(r6)
            if (r6 == 0) goto L56
            boolean r6 = java.util.Objects.equals(r4, r5)
            if (r6 != 0) goto L55
            goto L56
        L55:
            goto L2c
        L56:
            return r1
        L57:
            return r0
        L58:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.itextpdf.commons.utils.MapUtil.equals(java.util.Map, java.util.Map):boolean");
    }

    public static <K, V> void merge(Map<K, V> destination, Map<K, V> source, BiFunction<V, V, V> valuesMerger) {
        if (destination == source) {
            return;
        }
        for (Map.Entry<K, V> entry : source.entrySet()) {
            V value = destination.get(entry.getKey());
            if (value == null) {
                destination.put(entry.getKey(), entry.getValue());
            } else {
                destination.put(entry.getKey(), valuesMerger.apply(value, entry.getValue()));
            }
        }
    }

    public static <K, V> int getHashCode(Map<K, V> m1) {
        if (m1 == null) {
            return 0;
        }
        int hash = 0;
        for (Map.Entry<K, V> entry : m1.entrySet()) {
            K key = entry.getKey();
            V value = entry.getValue();
            hash = (((hash * 31) + (key == null ? 0 : key.hashCode())) * 31) + (value == null ? 0 : value.hashCode());
        }
        return hash;
    }

    public static <K, V> void putIfNotNull(Map<K, V> map, K key, V value) {
        if (value != null) {
            map.put(key, value);
        }
    }
}
