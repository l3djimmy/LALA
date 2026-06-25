package androidx.collection;

import androidx.collection.internal.ContainerHelpersKt;
import androidx.collection.internal.RuntimeHelpersKt;
import androidx.exifinterface.media.ExifInterface;
import java.util.Arrays;
import java.util.ConcurrentModificationException;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.ArraysKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SimpleArrayMap.kt */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b)\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0016\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u00020\u0003B!\b\u0016\u0012\u0018\u0010\u0004\u001a\u0014\u0012\u0006\b\u0001\u0012\u00028\u0000\u0012\u0006\b\u0001\u0012\u00028\u0001\u0018\u00010\u0000¢\u0006\u0002\u0010\u0005B\u0011\b\u0007\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\b\u0010\u000f\u001a\u00020\u0010H\u0016J\u0015\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u0014J\u0015\u0010\u0015\u001a\u00020\u00122\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u0014J\u0010\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u0007H\u0016J\u0013\u0010\u0019\u001a\u00020\u00122\b\u0010\u001a\u001a\u0004\u0018\u00010\u0003H\u0096\u0002J\u0018\u0010\u001b\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0013\u001a\u00028\u0000H\u0096\u0002¢\u0006\u0002\u0010\u001cJ\u001f\u0010\u001d\u001a\u00028\u00012\b\u0010\u0013\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u001e\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001fJ,\u0010 \u001a\u0002H!\"\n\b\u0002\u0010!*\u0004\u0018\u00018\u00012\b\u0010\u0013\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u001e\u001a\u0002H!H\u0082\b¢\u0006\u0002\u0010\u001fJ\b\u0010\"\u001a\u00020\u0007H\u0016J\u001d\u0010#\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010$\u001a\u00020\u0007H\u0002¢\u0006\u0002\u0010%J\u0015\u0010&\u001a\u00020\u00072\u0006\u0010\u0013\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010'J\b\u0010(\u001a\u00020\u0007H\u0002J\u0017\u0010)\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00028\u0001H\u0001¢\u0006\u0004\b*\u0010'J\b\u0010+\u001a\u00020\u0012H\u0016J\u0015\u0010,\u001a\u00028\u00002\u0006\u0010-\u001a\u00020\u0007H\u0016¢\u0006\u0002\u0010.J\u001f\u0010/\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001fJ \u00100\u001a\u00020\u00102\u0016\u0010\u0004\u001a\u0012\u0012\u0006\b\u0001\u0012\u00028\u0000\u0012\u0006\b\u0001\u0012\u00028\u00010\u0000H\u0016J\u001f\u00101\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001fJ\u0017\u00102\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0013\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\u001cJ\u001d\u00102\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u00103J\u0015\u00104\u001a\u00028\u00012\u0006\u0010-\u001a\u00020\u0007H\u0016¢\u0006\u0002\u0010.J\u001f\u00105\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010\u001fJ%\u00105\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00028\u00002\u0006\u00106\u001a\u00028\u00012\u0006\u00107\u001a\u00028\u0001H\u0016¢\u0006\u0002\u00108J\u001d\u00109\u001a\u00028\u00012\u0006\u0010-\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00028\u0001H\u0016¢\u0006\u0002\u0010:J\b\u0010\u000e\u001a\u00020\u0007H\u0016J\b\u0010;\u001a\u00020<H\u0016J\u0015\u0010=\u001a\u00028\u00012\u0006\u0010-\u001a\u00020\u0007H\u0016¢\u0006\u0002\u0010.R\u0018\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\nX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u000bR\u000e\u0010\f\u001a\u00020\rX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006>"}, d2 = {"Landroidx/collection/SimpleArrayMap;", "K", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "", "map", "(Landroidx/collection/SimpleArrayMap;)V", "capacity", "", "(I)V", "array", "", "[Ljava/lang/Object;", "hashes", "", "size", "clear", "", "containsKey", "", "key", "(Ljava/lang/Object;)Z", "containsValue", "value", "ensureCapacity", "minimumCapacity", "equals", "other", "get", "(Ljava/lang/Object;)Ljava/lang/Object;", "getOrDefault", "defaultValue", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "getOrDefaultInternal", ExifInterface.GPS_DIRECTION_TRUE, "hashCode", "indexOf", "hash", "(Ljava/lang/Object;I)I", "indexOfKey", "(Ljava/lang/Object;)I", "indexOfNull", "indexOfValue", "__restricted$indexOfValue", "isEmpty", "keyAt", "index", "(I)Ljava/lang/Object;", "put", "putAll", "putIfAbsent", "remove", "(Ljava/lang/Object;Ljava/lang/Object;)Z", "removeAt", "replace", "oldValue", "newValue", "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z", "setValueAt", "(ILjava/lang/Object;)Ljava/lang/Object;", "toString", "", "valueAt", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public class SimpleArrayMap<K, V> {
    private Object[] array;
    private int[] hashes;
    private int size;

    public SimpleArrayMap() {
        this(0, 1, null);
    }

    public SimpleArrayMap(int capacity) {
        this.hashes = capacity == 0 ? ContainerHelpersKt.EMPTY_INTS : new int[capacity];
        this.array = capacity == 0 ? ContainerHelpersKt.EMPTY_OBJECTS : new Object[capacity << 1];
    }

    public /* synthetic */ SimpleArrayMap(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 0 : i);
    }

    public SimpleArrayMap(SimpleArrayMap<? extends K, ? extends V> simpleArrayMap) {
        this(0, 1, null);
        if (simpleArrayMap != null) {
            putAll(simpleArrayMap);
        }
    }

    private final int indexOf(K k, int hash) {
        int n = this.size;
        if (n == 0) {
            return -1;
        }
        int index = ContainerHelpersKt.binarySearch(this.hashes, n, hash);
        if (index < 0) {
            return index;
        }
        if (Intrinsics.areEqual(k, this.array[index << 1])) {
            return index;
        }
        int end = index + 1;
        while (end < n && this.hashes[end] == hash) {
            if (Intrinsics.areEqual(k, this.array[end << 1])) {
                return end;
            }
            end++;
        }
        for (int i = index - 1; i >= 0 && this.hashes[i] == hash; i--) {
            if (Intrinsics.areEqual(k, this.array[i << 1])) {
                return i;
            }
        }
        return ~end;
    }

    private final int indexOfNull() {
        int n = this.size;
        if (n == 0) {
            return -1;
        }
        int index = ContainerHelpersKt.binarySearch(this.hashes, n, 0);
        if (index < 0) {
            return index;
        }
        if (this.array[index << 1] == null) {
            return index;
        }
        int end = index + 1;
        while (end < n && this.hashes[end] == 0) {
            if (this.array[end << 1] == null) {
                return end;
            }
            end++;
        }
        for (int i = index - 1; i >= 0 && this.hashes[i] == 0; i--) {
            if (this.array[i << 1] == null) {
                return i;
            }
        }
        return ~end;
    }

    public void clear() {
        if (this.size > 0) {
            this.hashes = ContainerHelpersKt.EMPTY_INTS;
            this.array = ContainerHelpersKt.EMPTY_OBJECTS;
            this.size = 0;
        }
        if (this.size > 0) {
            throw new ConcurrentModificationException();
        }
    }

    public void ensureCapacity(int minimumCapacity) {
        int osize = this.size;
        if (this.hashes.length < minimumCapacity) {
            int[] copyOf = Arrays.copyOf(this.hashes, minimumCapacity);
            Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
            this.hashes = copyOf;
            Object[] copyOf2 = Arrays.copyOf(this.array, minimumCapacity * 2);
            Intrinsics.checkNotNullExpressionValue(copyOf2, "copyOf(...)");
            this.array = copyOf2;
        }
        if (this.size != osize) {
            throw new ConcurrentModificationException();
        }
    }

    public boolean containsKey(K k) {
        return indexOfKey(k) >= 0;
    }

    public int indexOfKey(K k) {
        return k == null ? indexOfNull() : indexOf(k, k.hashCode());
    }

    public final int __restricted$indexOfValue(V v) {
        int n = this.size * 2;
        Object[] array = this.array;
        if (v == null) {
            for (int i = 1; i < n; i += 2) {
                if (array[i] == null) {
                    return i >> 1;
                }
            }
            return -1;
        }
        for (int i2 = 1; i2 < n; i2 += 2) {
            if (Intrinsics.areEqual(v, array[i2])) {
                return i2 >> 1;
            }
        }
        return -1;
    }

    public boolean containsValue(V v) {
        return __restricted$indexOfValue(v) >= 0;
    }

    public V get(K k) {
        int index$iv = indexOfKey(k);
        if (index$iv >= 0) {
            return (V) this.array[(index$iv << 1) + 1];
        }
        return null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public V getOrDefault(Object key, V v) {
        int index$iv = indexOfKey(key);
        if (index$iv >= 0) {
            return (V) this.array[(index$iv << 1) + 1];
        }
        return v;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final <T extends V> T getOrDefaultInternal(Object key, T t) {
        int index = indexOfKey(key);
        return index >= 0 ? (T) this.array[(index << 1) + 1] : t;
    }

    public K keyAt(int index) {
        boolean value$iv = false;
        if (index >= 0 && index < this.size) {
            value$iv = true;
        }
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Expected index to be within 0..size()-1, but was " + index);
        }
        return (K) this.array[index << 1];
    }

    public V valueAt(int index) {
        boolean value$iv = false;
        if (index >= 0 && index < this.size) {
            value$iv = true;
        }
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Expected index to be within 0..size()-1, but was " + index);
        }
        return (V) this.array[(index << 1) + 1];
    }

    public V setValueAt(int index, V v) {
        boolean value$iv = false;
        if (index >= 0 && index < this.size) {
            value$iv = true;
        }
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Expected index to be within 0..size()-1, but was " + index);
        }
        int indexInArray = (index << 1) + 1;
        V v2 = (V) this.array[indexInArray];
        this.array[indexInArray] = v;
        return v2;
    }

    public boolean isEmpty() {
        return this.size <= 0;
    }

    public V put(K k, V v) {
        int osize = this.size;
        int hash = k != null ? k.hashCode() : 0;
        int index = k != null ? indexOf(k, hash) : indexOfNull();
        if (index >= 0) {
            int index2 = (index << 1) + 1;
            V v2 = (V) this.array[index2];
            this.array[index2] = v;
            return v2;
        }
        int index3 = ~index;
        if (osize >= this.hashes.length) {
            int n = 8;
            if (osize >= 8) {
                n = (osize >> 1) + osize;
            } else if (osize < 4) {
                n = 4;
            }
            int[] copyOf = Arrays.copyOf(this.hashes, n);
            Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
            this.hashes = copyOf;
            Object[] copyOf2 = Arrays.copyOf(this.array, n << 1);
            Intrinsics.checkNotNullExpressionValue(copyOf2, "copyOf(...)");
            this.array = copyOf2;
            if (osize != this.size) {
                throw new ConcurrentModificationException();
            }
        }
        if (index3 < osize) {
            ArraysKt.copyInto(this.hashes, this.hashes, index3 + 1, index3, osize);
            ArraysKt.copyInto(this.array, this.array, (index3 + 1) << 1, index3 << 1, this.size << 1);
        }
        if (osize != this.size || index3 >= this.hashes.length) {
            throw new ConcurrentModificationException();
        }
        this.hashes[index3] = hash;
        this.array[index3 << 1] = k;
        this.array[(index3 << 1) + 1] = v;
        this.size++;
        return null;
    }

    public void putAll(SimpleArrayMap<? extends K, ? extends V> map) {
        Intrinsics.checkNotNullParameter(map, "map");
        int n = map.size;
        ensureCapacity(this.size + n);
        if (this.size == 0) {
            if (n > 0) {
                ArraysKt.copyInto(map.hashes, this.hashes, 0, 0, n);
                ArraysKt.copyInto(map.array, this.array, 0, 0, n << 1);
                this.size = n;
                return;
            }
            return;
        }
        for (int i = 0; i < n; i++) {
            put(map.keyAt(i), map.valueAt(i));
        }
    }

    public V putIfAbsent(K k, V v) {
        V v2 = get(k);
        if (v2 == null) {
            return put(k, v);
        }
        return v2;
    }

    public V remove(K k) {
        int index = indexOfKey(k);
        if (index >= 0) {
            return removeAt(index);
        }
        return null;
    }

    public boolean remove(K k, V v) {
        int index = indexOfKey(k);
        if (index >= 0) {
            Object mapValue = valueAt(index);
            if (Intrinsics.areEqual(v, mapValue)) {
                removeAt(index);
                return true;
            }
            return false;
        }
        return false;
    }

    public V removeAt(int index) {
        boolean value$iv = index >= 0 && index < this.size;
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Expected index to be within 0..size()-1, but was " + index);
        }
        V v = (V) this.array[(index << 1) + 1];
        int osize = this.size;
        if (osize <= 1) {
            clear();
        } else {
            int nsize = osize - 1;
            if (this.hashes.length > 8 && osize < this.hashes.length / 3) {
                int n = osize > 8 ? osize + (osize >> 1) : 8;
                int[] ohashes = this.hashes;
                Object[] oarray = this.array;
                int[] copyOf = Arrays.copyOf(this.hashes, n);
                Intrinsics.checkNotNullExpressionValue(copyOf, "copyOf(...)");
                this.hashes = copyOf;
                Object[] copyOf2 = Arrays.copyOf(this.array, n << 1);
                Intrinsics.checkNotNullExpressionValue(copyOf2, "copyOf(...)");
                this.array = copyOf2;
                if (osize != this.size) {
                    throw new ConcurrentModificationException();
                }
                if (index > 0) {
                    ArraysKt.copyInto(ohashes, this.hashes, 0, 0, index);
                    ArraysKt.copyInto(oarray, this.array, 0, 0, index << 1);
                }
                if (index < nsize) {
                    ArraysKt.copyInto(ohashes, this.hashes, index, index + 1, nsize + 1);
                    ArraysKt.copyInto(oarray, this.array, index << 1, (index + 1) << 1, (nsize + 1) << 1);
                }
            } else {
                if (index < nsize) {
                    ArraysKt.copyInto(this.hashes, this.hashes, index, index + 1, nsize + 1);
                    ArraysKt.copyInto(this.array, this.array, index << 1, (index + 1) << 1, (nsize + 1) << 1);
                }
                this.array[nsize << 1] = null;
                this.array[(nsize << 1) + 1] = null;
            }
            if (osize != this.size) {
                throw new ConcurrentModificationException();
            }
            this.size = nsize;
        }
        return v;
    }

    public V replace(K k, V v) {
        int index = indexOfKey(k);
        if (index >= 0) {
            return setValueAt(index, v);
        }
        return null;
    }

    public boolean replace(K k, V v, V v2) {
        int index = indexOfKey(k);
        if (index >= 0) {
            Object mapValue = valueAt(index);
            if (Intrinsics.areEqual(v, mapValue)) {
                setValueAt(index, v2);
                return true;
            }
            return false;
        }
        return false;
    }

    public int size() {
        return this.size;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        try {
            if (other instanceof SimpleArrayMap) {
                if (size() != ((SimpleArrayMap) other).size()) {
                    return false;
                }
                SimpleArrayMap otherSimpleArrayMap = (SimpleArrayMap) other;
                int i = this.size;
                for (int i2 = 0; i2 < i; i2++) {
                    K keyAt = keyAt(i2);
                    Object mine = valueAt(i2);
                    Object theirs = otherSimpleArrayMap.get(keyAt);
                    if (mine == null) {
                        if (theirs != null || !otherSimpleArrayMap.containsKey(keyAt)) {
                            return false;
                        }
                    } else if (!Intrinsics.areEqual(mine, theirs)) {
                        return false;
                    }
                }
                return true;
            } else if (!(other instanceof Map) || size() != ((Map) other).size()) {
                return false;
            } else {
                int i3 = this.size;
                for (int i4 = 0; i4 < i3; i4++) {
                    Object key = keyAt(i4);
                    Object mine2 = valueAt(i4);
                    Object theirs2 = ((Map) other).get(key);
                    if (mine2 == null) {
                        if (theirs2 != null || !((Map) other).containsKey(key)) {
                            return false;
                        }
                    } else if (!Intrinsics.areEqual(mine2, theirs2)) {
                        return false;
                    }
                }
                return true;
            }
        } catch (ClassCastException e) {
        } catch (NullPointerException e2) {
        }
        return false;
    }

    public int hashCode() {
        int[] hashes = this.hashes;
        Object[] array = this.array;
        int result = 0;
        int i = 0;
        int v = 1;
        int s = this.size;
        while (i < s) {
            Object value = array[v];
            result += hashes[i] ^ (value != null ? value.hashCode() : 0);
            i++;
            v += 2;
        }
        return result;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder $this$toString_u24lambda_u245 = new StringBuilder(this.size * 28);
        $this$toString_u24lambda_u245.append('{');
        int i = this.size;
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 > 0) {
                $this$toString_u24lambda_u245.append(", ");
            }
            Object key = keyAt(i2);
            if (key != $this$toString_u24lambda_u245) {
                $this$toString_u24lambda_u245.append(key);
            } else {
                $this$toString_u24lambda_u245.append("(this Map)");
            }
            $this$toString_u24lambda_u245.append('=');
            Object value = valueAt(i2);
            if (value != $this$toString_u24lambda_u245) {
                $this$toString_u24lambda_u245.append(value);
            } else {
                $this$toString_u24lambda_u245.append("(this Map)");
            }
        }
        $this$toString_u24lambda_u245.append('}');
        String sb = $this$toString_u24lambda_u245.toString();
        Intrinsics.checkNotNullExpressionValue(sb, "toString(...)");
        return sb;
    }
}
