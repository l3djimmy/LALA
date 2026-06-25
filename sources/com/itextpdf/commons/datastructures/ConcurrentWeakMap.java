package com.itextpdf.commons.datastructures;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
/* loaded from: classes12.dex */
public class ConcurrentWeakMap<K, V> implements Map<K, V> {
    private final Map<K, V> map = Collections.synchronizedMap(new WeakHashMap());

    @Override // java.util.Map
    public int size() {
        return this.map.size();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.map.isEmpty();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return this.map.containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return this.map.containsValue(value);
    }

    @Override // java.util.Map
    public V get(Object key) {
        return this.map.get(key);
    }

    @Override // java.util.Map
    public V put(K key, V value) {
        return this.map.put(key, value);
    }

    @Override // java.util.Map
    public V remove(Object key) {
        return this.map.remove(key);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> m) {
        this.map.putAll(m);
    }

    @Override // java.util.Map
    public void clear() {
        this.map.clear();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return this.map.keySet();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return this.map.values();
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return this.map.entrySet();
    }
}
