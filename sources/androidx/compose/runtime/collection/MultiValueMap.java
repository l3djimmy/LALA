package androidx.compose.runtime.collection;

import androidx.autofill.HintConstants;
import androidx.collection.MutableObjectList;
import androidx.collection.MutableScatterMap;
import androidx.collection.ObjectList;
import androidx.collection.ObjectListKt;
import androidx.collection.ScatterMap;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.ranges.IntRange;
import kotlin.ranges.RangesKt;
/* compiled from: MultiValueMap.kt */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\b\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0081@\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u0002*\b\b\u0001\u0010\u0003*\u00020\u00022\u00020\u0002B\u001d\u0012\u0014\b\u0002\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00028\u00002\u0006\u0010\u000b\u001a\u00028\u0001¢\u0006\u0004\b\f\u0010\rJ\r\u0010\u000e\u001a\u00020\t¢\u0006\u0004\b\u000f\u0010\u0010J\u0018\u0010\u0011\u001a\u00020\u00122\u0006\u0010\n\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0015\u001a\u00020\u00122\b\u0010\u0016\u001a\u0004\u0018\u00010\u0002HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0014J;\u0010\u0018\u001a\u00020\t2\u0006\u0010\n\u001a\u00028\u00002!\u0010\u0019\u001a\u001d\u0012\u0013\u0012\u00118\u0001¢\u0006\f\b\u001b\u0012\b\b\u001c\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\t0\u001aH\u0086\b¢\u0006\u0004\b\u001d\u0010\u001eJ\u001e\u0010\u001f\u001a\b\u0012\u0004\u0012\u00028\u00010 2\u0006\u0010\n\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0004\b!\u0010\"J\u0010\u0010#\u001a\u00020$HÖ\u0001¢\u0006\u0004\b%\u0010&J\r\u0010'\u001a\u00020\u0012¢\u0006\u0004\b(\u0010)J\r\u0010*\u001a\u00020\u0012¢\u0006\u0004\b+\u0010)J\u0017\u0010,\u001a\u0004\u0018\u00018\u00012\u0006\u0010\n\u001a\u00028\u0000¢\u0006\u0004\b-\u0010.J\u0017\u0010/\u001a\u0004\u0018\u00018\u00012\u0006\u0010\n\u001a\u00028\u0000¢\u0006\u0004\b0\u0010.J8\u00101\u001a\u00020\t2\u0006\u0010\n\u001a\u00028\u00002!\u00102\u001a\u001d\u0012\u0013\u0012\u00118\u0001¢\u0006\f\b\u001b\u0012\b\b\u001c\u0012\u0004\b\b(\u000b\u0012\u0004\u0012\u00020\u00120\u001a¢\u0006\u0004\b3\u0010\u001eJ\u0010\u00104\u001a\u000205HÖ\u0001¢\u0006\u0004\b6\u00107J\u0013\u00108\u001a\b\u0012\u0004\u0012\u00028\u00010 ¢\u0006\u0004\b9\u0010:R\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000\u0088\u0001\u0004\u0092\u0001\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0005¨\u0006;"}, d2 = {"Landroidx/compose/runtime/collection/MultiValueMap;", "K", "", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "map", "Landroidx/collection/MutableScatterMap;", "constructor-impl", "(Landroidx/collection/MutableScatterMap;)Landroidx/collection/MutableScatterMap;", "add", "", "key", "value", "add-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Ljava/lang/Object;)V", "clear", "clear-impl", "(Landroidx/collection/MutableScatterMap;)V", "contains", "", "contains-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;)Z", "equals", "other", "equals-impl", "forEachValue", "block", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "forEachValue-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V", "get", "Landroidx/collection/ObjectList;", "get-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;)Landroidx/collection/ObjectList;", "hashCode", "", "hashCode-impl", "(Landroidx/collection/MutableScatterMap;)I", "isEmpty", "isEmpty-impl", "(Landroidx/collection/MutableScatterMap;)Z", "isNotEmpty", "isNotEmpty-impl", "removeFirst", "removeFirst-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;)Ljava/lang/Object;", "removeLast", "removeLast-impl", "removeValueIf", "condition", "removeValueIf-impl", "toString", "", "toString-impl", "(Landroidx/collection/MutableScatterMap;)Ljava/lang/String;", "values", "values-impl", "(Landroidx/collection/MutableScatterMap;)Landroidx/collection/ObjectList;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class MultiValueMap<K, V> {
    private final MutableScatterMap<Object, Object> map;

    /* renamed from: box-impl */
    public static final /* synthetic */ MultiValueMap m3807boximpl(MutableScatterMap mutableScatterMap) {
        return new MultiValueMap(mutableScatterMap);
    }

    /* renamed from: constructor-impl */
    public static <K, V> MutableScatterMap<Object, Object> m3809constructorimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap;
    }

    /* renamed from: equals-impl */
    public static boolean m3812equalsimpl(MutableScatterMap<Object, Object> mutableScatterMap, Object obj) {
        return (obj instanceof MultiValueMap) && Intrinsics.areEqual(mutableScatterMap, ((MultiValueMap) obj).m3824unboximpl());
    }

    /* renamed from: equals-impl0 */
    public static final boolean m3813equalsimpl0(MutableScatterMap<Object, Object> mutableScatterMap, MutableScatterMap<Object, Object> mutableScatterMap2) {
        return Intrinsics.areEqual(mutableScatterMap, mutableScatterMap2);
    }

    /* renamed from: hashCode-impl */
    public static int m3816hashCodeimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap.hashCode();
    }

    /* renamed from: toString-impl */
    public static String m3822toStringimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return "MultiValueMap(map=" + mutableScatterMap + ')';
    }

    public boolean equals(Object obj) {
        return m3812equalsimpl(this.map, obj);
    }

    public int hashCode() {
        return m3816hashCodeimpl(this.map);
    }

    public String toString() {
        return m3822toStringimpl(this.map);
    }

    /* renamed from: unbox-impl */
    public final /* synthetic */ MutableScatterMap m3824unboximpl() {
        return this.map;
    }

    private /* synthetic */ MultiValueMap(MutableScatterMap map) {
        this.map = map;
    }

    /* renamed from: constructor-impl$default */
    public static /* synthetic */ MutableScatterMap m3810constructorimpl$default(MutableScatterMap mutableScatterMap, int i, DefaultConstructorMarker defaultConstructorMarker) {
        if ((i & 1) != 0) {
            mutableScatterMap = new MutableScatterMap(0, 1, null);
        }
        return m3809constructorimpl(mutableScatterMap);
    }

    /* renamed from: add-impl */
    public static final void m3806addimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k, V v) {
        Object computedValue$iv;
        int index$iv = mutableScatterMap.findInsertIndex(k);
        boolean inserting$iv = index$iv < 0;
        Object previous = inserting$iv ? null : mutableScatterMap.values[index$iv];
        boolean isMutableList = true ^ TypeIntrinsics.isMutableList(previous);
        if (previous == null) {
            computedValue$iv = v;
        } else if (previous instanceof MutableObjectList) {
            Intrinsics.checkNotNull(previous, "null cannot be cast to non-null type androidx.collection.MutableObjectList<kotlin.Any>");
            MutableObjectList list = (MutableObjectList) previous;
            list.add(v);
            computedValue$iv = list;
        } else {
            computedValue$iv = ObjectListKt.mutableObjectListOf(previous, v);
        }
        if (inserting$iv) {
            int insertionIndex$iv = ~index$iv;
            mutableScatterMap.keys[insertionIndex$iv] = k;
            mutableScatterMap.values[insertionIndex$iv] = computedValue$iv;
            return;
        }
        mutableScatterMap.values[index$iv] = computedValue$iv;
    }

    /* renamed from: clear-impl */
    public static final void m3808clearimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        mutableScatterMap.clear();
    }

    /* renamed from: contains-impl */
    public static final boolean m3811containsimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k) {
        return mutableScatterMap.contains(k);
    }

    /* renamed from: get-impl */
    public static final ObjectList<V> m3815getimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k) {
        Object entry = mutableScatterMap.get(k);
        return entry == null ? ObjectListKt.emptyObjectList() : entry instanceof MutableObjectList ? (ObjectList) entry : ObjectListKt.objectListOf(entry);
    }

    /* renamed from: isEmpty-impl */
    public static final boolean m3817isEmptyimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap.isEmpty();
    }

    /* renamed from: isNotEmpty-impl */
    public static final boolean m3818isNotEmptyimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap.isNotEmpty();
    }

    /* renamed from: removeLast-impl */
    public static final V m3820removeLastimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k) {
        V v = (V) mutableScatterMap.get(k);
        if (v == null) {
            return null;
        }
        if (v instanceof MutableObjectList) {
            MutableObjectList list = (MutableObjectList) v;
            V v2 = (V) ExtensionsKt.removeLast(list);
            Intrinsics.checkNotNull(v2, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
            if (list.isEmpty()) {
                mutableScatterMap.remove(k);
            }
            if (list.getSize() == 1) {
                mutableScatterMap.set(k, list.first());
            }
            return v2;
        }
        mutableScatterMap.remove(k);
        return v;
    }

    /* renamed from: removeFirst-impl */
    public static final V m3819removeFirstimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k) {
        V v = (V) mutableScatterMap.get(k);
        if (v == null) {
            return null;
        }
        if (v instanceof MutableObjectList) {
            MutableObjectList list = (MutableObjectList) v;
            V v2 = (V) list.removeAt(0);
            if (list.isEmpty()) {
                mutableScatterMap.remove(k);
            }
            if (list.getSize() == 1) {
                mutableScatterMap.set(k, list.first());
            }
            return v2;
        }
        mutableScatterMap.remove(k);
        return v;
    }

    /* renamed from: values-impl */
    public static final ObjectList<V> m3823valuesimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        ScatterMap this_$iv;
        ScatterMap this_$iv2;
        int i;
        if (mutableScatterMap.isEmpty()) {
            return ObjectListKt.emptyObjectList();
        }
        MutableObjectList result = new MutableObjectList(0, 1, null);
        MutableScatterMap<Object, Object> this_$iv3 = mutableScatterMap;
        Object[] v$iv = this_$iv3.values;
        long[] m$iv$iv = this_$iv3.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    this_$iv = this_$iv3;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            this_$iv2 = this_$iv3;
                            i = i2;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i2;
                            Object entry = v$iv[index$iv$iv];
                            this_$iv2 = this_$iv3;
                            if (entry instanceof MutableObjectList) {
                                Intrinsics.checkNotNull(entry, "null cannot be cast to non-null type androidx.collection.MutableObjectList<V of androidx.compose.runtime.collection.MultiValueMap>");
                                result.addAll((MutableObjectList) entry);
                            } else {
                                Intrinsics.checkNotNull(entry, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
                                result.add(entry);
                            }
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        i2 = i;
                        this_$iv3 = this_$iv2;
                    }
                    this_$iv = this_$iv3;
                    if (bitCount$iv$iv != i2) {
                        break;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
                this_$iv3 = this_$iv;
            }
        }
        return result;
    }

    /* renamed from: forEachValue-impl */
    public static final void m3814forEachValueimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k, Function1<? super V, Unit> function1) {
        Object it = mutableScatterMap.get(k);
        if (it != null) {
            if (it instanceof MutableObjectList) {
                ObjectList this_$iv = (ObjectList) it;
                Object[] content$iv = this_$iv.content;
                int i = this_$iv._size;
                for (int i$iv = 0; i$iv < i; i$iv++) {
                    Object value = content$iv[i$iv];
                    Intrinsics.checkNotNull(value, "null cannot be cast to non-null type V of androidx.compose.runtime.collection.MultiValueMap");
                    function1.invoke(value);
                }
                return;
            }
            function1.invoke(it);
        }
    }

    /* renamed from: removeValueIf-impl */
    public static final void m3821removeValueIfimpl(MutableScatterMap<Object, Object> mutableScatterMap, K k, Function1<? super V, Boolean> function1) {
        Object it = mutableScatterMap.get(k);
        if (it != null) {
            if (it instanceof MutableObjectList) {
                MutableObjectList this_$iv = (MutableObjectList) it;
                int gap$iv = 0;
                int size$iv = this_$iv._size;
                Object[] content$iv = this_$iv.content;
                MutableObjectList this_$iv$iv = this_$iv;
                IntRange until = RangesKt.until(0, this_$iv$iv._size);
                int i$iv = until.getFirst();
                int last = until.getLast();
                if (i$iv <= last) {
                    while (true) {
                        content$iv[i$iv - gap$iv] = content$iv[i$iv];
                        if (function1.invoke(content$iv[i$iv]).booleanValue()) {
                            gap$iv++;
                        }
                        if (i$iv == last) {
                            break;
                        }
                        i$iv++;
                    }
                }
                ArraysKt.fill(content$iv, (Object) null, size$iv - gap$iv, size$iv);
                this_$iv._size -= gap$iv;
                if (((MutableObjectList) it).isEmpty()) {
                    mutableScatterMap.remove(k);
                }
                if (((MutableObjectList) it).getSize() == 0) {
                    mutableScatterMap.set(k, ((MutableObjectList) it).first());
                }
            } else if (function1.invoke(it).booleanValue()) {
                mutableScatterMap.remove(k);
            }
        }
    }
}
