package androidx.compose.runtime.collection;

import androidx.autofill.HintConstants;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterMapKt;
import androidx.collection.ScatterSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.SetsKt;
import kotlin.jvm.JvmInline;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ScopeMap.kt */
@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\u0010\"\n\u0002\b\u001f\n\u0002\u0010\u000e\n\u0002\b\u0003\b\u0081@\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u0002*\b\b\u0001\u0010\u0003*\u00020\u00022\u00020\u0002B\u001d\u0012\u0014\b\u0002\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00028\u00002\u0006\u0010\u0011\u001a\u00028\u0001¢\u0006\u0004\b\u0012\u0010\u0013J;\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00028\u00002!\u0010\u0016\u001a\u001d\u0012\u0013\u0012\u00118\u0001¢\u0006\f\b\u0018\u0012\b\b\u0019\u0012\u0004\b\b(\u0011\u0012\u0004\u0012\u00020\u00150\u0017H\u0086\b¢\u0006\u0004\b\u001a\u0010\u001bJ\u001f\u0010\u001c\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00010\u001e0\u001d¢\u0006\u0004\b\u001f\u0010 J\r\u0010!\u001a\u00020\u000f¢\u0006\u0004\b\"\u0010#J\u0018\u0010$\u001a\u00020\u00152\u0006\u0010%\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0004\b&\u0010'J\u001a\u0010(\u001a\u00020\u00152\b\u0010)\u001a\u0004\u0018\u00010\u0002HÖ\u0003¢\u0006\u0004\b*\u0010'J;\u0010+\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00028\u00002!\u0010\u0016\u001a\u001d\u0012\u0013\u0012\u00118\u0001¢\u0006\f\b\u0018\u0012\b\b\u0019\u0012\u0004\b\b(\u0011\u0012\u0004\u0012\u00020\u000f0\u0017H\u0086\b¢\u0006\u0004\b,\u0010-J\u0010\u0010.\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b/\u0010\rJ\u001d\u00100\u001a\u00020\u00152\u0006\u0010\u0010\u001a\u00028\u00002\u0006\u0010\u0011\u001a\u00028\u0001¢\u0006\u0004\b1\u00102J\u0015\u00103\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00028\u0001¢\u0006\u0004\b4\u00105J5\u00106\u001a\u00020\u000f2#\b\u0004\u00107\u001a\u001d\u0012\u0013\u0012\u00118\u0001¢\u0006\f\b\u0018\u0012\b\b\u0019\u0012\u0004\b\b(\u0011\u0012\u0004\u0012\u00020\u00150\u0017H\u0086\b¢\u0006\u0004\b8\u00109J\u001d\u0010:\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00028\u00002\u0006\u0010;\u001a\u00028\u0001¢\u0006\u0004\b<\u0010\u0013J\u0010\u0010=\u001a\u00020>HÖ\u0001¢\u0006\u0004\b?\u0010@R\u001d\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\n\u001a\u00020\u000b8F¢\u0006\u0006\u001a\u0004\b\f\u0010\r\u0088\u0001\u0004¨\u0006A"}, d2 = {"Landroidx/compose/runtime/collection/ScopeMap;", "Key", "", "Scope", "map", "Landroidx/collection/MutableScatterMap;", "constructor-impl", "(Landroidx/collection/MutableScatterMap;)Landroidx/collection/MutableScatterMap;", "getMap", "()Landroidx/collection/MutableScatterMap;", "size", "", "getSize-impl", "(Landroidx/collection/MutableScatterMap;)I", "add", "", "key", "scope", "add-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Ljava/lang/Object;)V", "anyScopeOf", "", "block", "Lkotlin/Function1;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "anyScopeOf-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)Z", "asMap", "", "", "asMap-impl", "(Landroidx/collection/MutableScatterMap;)Ljava/util/Map;", "clear", "clear-impl", "(Landroidx/collection/MutableScatterMap;)V", "contains", "element", "contains-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;)Z", "equals", "other", "equals-impl", "forEachScopeOf", "forEachScopeOf-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V", "hashCode", "hashCode-impl", "remove", "remove-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;Ljava/lang/Object;)Z", "removeScope", "removeScope-impl", "(Landroidx/collection/MutableScatterMap;Ljava/lang/Object;)V", "removeScopeIf", "predicate", "removeScopeIf-impl", "(Landroidx/collection/MutableScatterMap;Lkotlin/jvm/functions/Function1;)V", "set", "value", "set-impl", "toString", "", "toString-impl", "(Landroidx/collection/MutableScatterMap;)Ljava/lang/String;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@JvmInline
/* loaded from: classes11.dex */
public final class ScopeMap<Key, Scope> {
    private final MutableScatterMap<Object, Object> map;

    /* renamed from: box-impl */
    public static final /* synthetic */ ScopeMap m3828boximpl(MutableScatterMap mutableScatterMap) {
        return new ScopeMap(mutableScatterMap);
    }

    /* renamed from: constructor-impl */
    public static <Key, Scope> MutableScatterMap<Object, Object> m3830constructorimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap;
    }

    /* renamed from: equals-impl */
    public static boolean m3833equalsimpl(MutableScatterMap<Object, Object> mutableScatterMap, Object obj) {
        return (obj instanceof ScopeMap) && Intrinsics.areEqual(mutableScatterMap, ((ScopeMap) obj).m3843unboximpl());
    }

    /* renamed from: equals-impl0 */
    public static final boolean m3834equalsimpl0(MutableScatterMap<Object, Object> mutableScatterMap, MutableScatterMap<Object, Object> mutableScatterMap2) {
        return Intrinsics.areEqual(mutableScatterMap, mutableScatterMap2);
    }

    /* renamed from: hashCode-impl */
    public static int m3837hashCodeimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap.hashCode();
    }

    /* renamed from: toString-impl */
    public static String m3842toStringimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return "ScopeMap(map=" + mutableScatterMap + ')';
    }

    public boolean equals(Object obj) {
        return m3833equalsimpl(this.map, obj);
    }

    public int hashCode() {
        return m3837hashCodeimpl(this.map);
    }

    public String toString() {
        return m3842toStringimpl(this.map);
    }

    /* renamed from: unbox-impl */
    public final /* synthetic */ MutableScatterMap m3843unboximpl() {
        return this.map;
    }

    private /* synthetic */ ScopeMap(MutableScatterMap map) {
        this.map = map;
    }

    /* renamed from: constructor-impl$default */
    public static /* synthetic */ MutableScatterMap m3831constructorimpl$default(MutableScatterMap mutableScatterMap, int i, DefaultConstructorMarker defaultConstructorMarker) {
        if ((i & 1) != 0) {
            mutableScatterMap = ScatterMapKt.mutableScatterMapOf();
        }
        return m3830constructorimpl(mutableScatterMap);
    }

    public final MutableScatterMap<Object, Object> getMap() {
        return this.map;
    }

    /* renamed from: getSize-impl */
    public static final int m3836getSizeimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        return mutableScatterMap.getSize();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* renamed from: add-impl */
    public static final void m3825addimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key, Scope scope) {
        Object value;
        Object computedValue$iv;
        int index$iv = mutableScatterMap.findInsertIndex(key);
        boolean inserting$iv = index$iv < 0;
        if (!inserting$iv) {
            value = mutableScatterMap.values[index$iv];
        } else {
            value = null;
        }
        if (value == null) {
            computedValue$iv = scope;
        } else {
            if (value instanceof MutableScatterSet) {
                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                ((MutableScatterSet) value).add(scope);
            } else if (value != scope) {
                MutableScatterSet set = new MutableScatterSet(0, 1, null);
                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap");
                set.add(value);
                set.add(scope);
                computedValue$iv = set;
            }
            computedValue$iv = value;
        }
        if (inserting$iv) {
            int insertionIndex$iv = ~index$iv;
            mutableScatterMap.keys[insertionIndex$iv] = key;
            mutableScatterMap.values[insertionIndex$iv] = computedValue$iv;
            return;
        }
        mutableScatterMap.values[index$iv] = computedValue$iv;
    }

    /* renamed from: set-impl */
    public static final void m3841setimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key, Scope scope) {
        mutableScatterMap.set(key, scope);
    }

    /* renamed from: contains-impl */
    public static final boolean m3832containsimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key) {
        return mutableScatterMap.containsKey(key);
    }

    /* renamed from: forEachScopeOf-impl */
    public static final void m3835forEachScopeOfimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key, Function1<? super Scope, Unit> function1) {
        int i;
        Object value = mutableScatterMap.get(key);
        if (value != null) {
            if (value instanceof MutableScatterSet) {
                ScatterSet this_$iv = (MutableScatterSet) value;
                int $i$f$forEach = 0;
                Object[] elements$iv = this_$iv.elements;
                long[] m$iv$iv = this_$iv.metadata;
                int lastIndex$iv$iv = m$iv$iv.length - 2;
                int i$iv$iv = 0;
                if (0 > lastIndex$iv$iv) {
                    return;
                }
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    ScatterSet this_$iv2 = this_$iv;
                    int $i$f$forEach2 = $i$f$forEach;
                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i2 = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            if (!(value$iv$iv$iv < 128)) {
                                i = i2;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                i = i2;
                                function1.invoke(elements$iv[index$iv$iv]);
                            }
                            slot$iv$iv >>= i;
                            j$iv$iv++;
                            i2 = i;
                        }
                        if (bitCount$iv$iv != i2) {
                            return;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        return;
                    }
                    i$iv$iv++;
                    this_$iv = this_$iv2;
                    $i$f$forEach = $i$f$forEach2;
                }
            } else {
                function1.invoke(value);
            }
        }
    }

    /* renamed from: anyScopeOf-impl */
    public static final boolean m3826anyScopeOfimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key, Function1<? super Scope, Boolean> function1) {
        int i;
        Object value$iv = mutableScatterMap.get(key);
        if (value$iv == null) {
            return false;
        }
        if (!(value$iv instanceof MutableScatterSet)) {
            return function1.invoke(value$iv).booleanValue();
        }
        ScatterSet this_$iv$iv = (MutableScatterSet) value$iv;
        int $i$f$forEach = 0;
        Object[] elements$iv$iv = this_$iv$iv.elements;
        long[] m$iv$iv$iv = this_$iv$iv.metadata;
        int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
        int i$iv$iv$iv = 0;
        if (0 > lastIndex$iv$iv$iv) {
            return false;
        }
        while (true) {
            long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
            ScatterSet this_$iv$iv2 = this_$iv$iv;
            int $i$f$forEach2 = $i$f$forEach;
            long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                int i2 = 8;
                int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                int j$iv$iv$iv = 0;
                while (j$iv$iv$iv < bitCount$iv$iv$iv) {
                    long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                    int $i$f$isFull = value$iv$iv$iv$iv < 128 ? 1 : 0;
                    if ($i$f$isFull == 0) {
                        i = i2;
                    } else {
                        int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                        i = i2;
                        Object it = elements$iv$iv[index$iv$iv$iv];
                        if (function1.invoke(it).booleanValue()) {
                            return true;
                        }
                    }
                    slot$iv$iv$iv >>= i;
                    j$iv$iv$iv++;
                    i2 = i;
                }
                if (bitCount$iv$iv$iv != i2) {
                    return false;
                }
            }
            if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                return false;
            }
            i$iv$iv$iv++;
            $i$f$forEach = $i$f$forEach2;
            this_$iv$iv = this_$iv$iv2;
        }
    }

    /* renamed from: clear-impl */
    public static final void m3829clearimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        mutableScatterMap.clear();
    }

    /* renamed from: remove-impl */
    public static final boolean m3838removeimpl(MutableScatterMap<Object, Object> mutableScatterMap, Key key, Scope scope) {
        Object value = mutableScatterMap.get(key);
        if (value == null) {
            return false;
        }
        if (value instanceof MutableScatterSet) {
            MutableScatterSet set = (MutableScatterSet) value;
            boolean removed = set.remove(scope);
            if (removed && set.isEmpty()) {
                mutableScatterMap.remove(key);
            }
            return removed;
        } else if (Intrinsics.areEqual(value, scope)) {
            mutableScatterMap.remove(key);
            return true;
        } else {
            return false;
        }
    }

    /* renamed from: removeScopeIf-impl */
    public static final void m3840removeScopeIfimpl(MutableScatterMap<Object, Object> mutableScatterMap, Function1<? super Scope, Boolean> function1) {
        int i;
        MutableScatterSet $i$f$removeIf;
        ScatterMap this_$iv$iv;
        int $i$f$forEachIndexed;
        long[] m$iv$iv;
        int i2;
        MutableScatterSet this_$iv;
        ScatterMap this_$iv$iv2;
        int $i$f$forEachIndexed2;
        long[] m$iv$iv2;
        long $this$maskEmptyOrDeleted$iv$iv$iv;
        boolean booleanValue;
        int j$iv$iv;
        int i3 = 0;
        MutableScatterSet $i$f$removeIf2 = null;
        MutableScatterMap<Object, Object> this_$iv$iv3 = mutableScatterMap;
        int $i$f$forEachIndexed3 = 0;
        long[] m$iv$iv3 = this_$iv$iv3.metadata;
        int lastIndex$iv$iv = m$iv$iv3.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv3[i$iv$iv];
            long $this$maskEmptyOrDeleted$iv$iv$iv2 = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv2 == -9187201950435737472L) {
                i = i3;
                $i$f$removeIf = $i$f$removeIf2;
                this_$iv$iv = this_$iv$iv3;
                $i$f$forEachIndexed = $i$f$forEachIndexed3;
                m$iv$iv = m$iv$iv3;
            } else {
                int i4 = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv2 = 0;
                while (j$iv$iv2 < bitCount$iv$iv) {
                    long value$iv$iv$iv = slot$iv$iv & 255;
                    if (!(value$iv$iv$iv < 128)) {
                        i2 = i3;
                        this_$iv = $i$f$removeIf2;
                        this_$iv$iv2 = this_$iv$iv3;
                        $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                        m$iv$iv2 = m$iv$iv3;
                        $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                    } else {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv2;
                        Object obj = mutableScatterMap.keys[index$iv$iv];
                        Object value = mutableScatterMap.values[index$iv$iv];
                        int i5 = i4;
                        if (value instanceof MutableScatterSet) {
                            Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                            MutableScatterSet set = (MutableScatterSet) value;
                            i2 = i3;
                            this_$iv = $i$f$removeIf2;
                            Object[] elements$iv = set.elements;
                            this_$iv$iv2 = this_$iv$iv3;
                            long[] m$iv$iv4 = set.metadata;
                            int lastIndex$iv$iv2 = m$iv$iv4.length - 2;
                            int i$iv$iv2 = 0;
                            if (0 <= lastIndex$iv$iv2) {
                                while (true) {
                                    long slot$iv$iv2 = m$iv$iv4[i$iv$iv2];
                                    $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                    m$iv$iv2 = m$iv$iv3;
                                    $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                                    long $this$maskEmptyOrDeleted$iv$iv$iv3 = ((~slot$iv$iv2) << 7) & slot$iv$iv2 & (-9187201950435737472L);
                                    if ($this$maskEmptyOrDeleted$iv$iv$iv3 != -9187201950435737472L) {
                                        int bitCount$iv$iv2 = 8 - ((~(i$iv$iv2 - lastIndex$iv$iv2)) >>> 31);
                                        int j$iv$iv3 = 0;
                                        while (j$iv$iv3 < bitCount$iv$iv2) {
                                            long value$iv$iv$iv2 = slot$iv$iv2 & 255;
                                            if (!(value$iv$iv$iv2 < 128)) {
                                                j$iv$iv = j$iv$iv3;
                                            } else {
                                                int index$iv$iv2 = (i$iv$iv2 << 3) + j$iv$iv3;
                                                j$iv$iv = j$iv$iv3;
                                                if (function1.invoke(elements$iv[index$iv$iv2]).booleanValue()) {
                                                    set.removeElementAt(index$iv$iv2);
                                                }
                                            }
                                            slot$iv$iv2 >>= i5;
                                            j$iv$iv3 = j$iv$iv + 1;
                                        }
                                        int j$iv$iv4 = i5;
                                        if (bitCount$iv$iv2 != j$iv$iv4) {
                                            break;
                                        }
                                    }
                                    if (i$iv$iv2 == lastIndex$iv$iv2) {
                                        break;
                                    }
                                    i$iv$iv2++;
                                    slot$iv$iv = $this$maskEmptyOrDeleted$iv$iv$iv;
                                    $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                                    m$iv$iv3 = m$iv$iv2;
                                    i5 = 8;
                                }
                            } else {
                                $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                m$iv$iv2 = m$iv$iv3;
                                $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                            }
                            booleanValue = set.isEmpty();
                        } else {
                            i2 = i3;
                            this_$iv = $i$f$removeIf2;
                            this_$iv$iv2 = this_$iv$iv3;
                            $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                            m$iv$iv2 = m$iv$iv3;
                            $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                            Intrinsics.checkNotNull(value, "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap");
                            booleanValue = function1.invoke(value).booleanValue();
                        }
                        if (booleanValue) {
                            mutableScatterMap.removeValueAt(index$iv$iv);
                        }
                    }
                    slot$iv$iv = $this$maskEmptyOrDeleted$iv$iv$iv >> 8;
                    j$iv$iv2++;
                    i4 = 8;
                    $i$f$removeIf2 = this_$iv;
                    i3 = i2;
                    this_$iv$iv3 = this_$iv$iv2;
                    $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                    m$iv$iv3 = m$iv$iv2;
                }
                i = i3;
                $i$f$removeIf = $i$f$removeIf2;
                this_$iv$iv = this_$iv$iv3;
                $i$f$forEachIndexed = $i$f$forEachIndexed3;
                m$iv$iv = m$iv$iv3;
                if (bitCount$iv$iv != i4) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            $i$f$removeIf2 = $i$f$removeIf;
            i3 = i;
            this_$iv$iv3 = this_$iv$iv;
            $i$f$forEachIndexed3 = $i$f$forEachIndexed;
            m$iv$iv3 = m$iv$iv;
        }
    }

    /* renamed from: removeScope-impl */
    public static final void m3839removeScopeimpl(MutableScatterMap<Object, Object> mutableScatterMap, Scope scope) {
        int $i$f$removeIf;
        int $i$f$removeIf2;
        int i;
        int $i$f$removeIf3 = 0;
        MutableScatterMap<Object, Object> this_$iv$iv = mutableScatterMap;
        long[] m$iv$iv = this_$iv$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                $i$f$removeIf = $i$f$removeIf3;
            } else {
                int i2 = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    boolean z = false;
                    if (!(value$iv$iv$iv < 128)) {
                        $i$f$removeIf2 = $i$f$removeIf3;
                        i = i2;
                    } else {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        i = i2;
                        Object obj = mutableScatterMap.keys[index$iv$iv];
                        Object value = mutableScatterMap.values[index$iv$iv];
                        $i$f$removeIf2 = $i$f$removeIf3;
                        if (value instanceof MutableScatterSet) {
                            Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                            MutableScatterSet set = (MutableScatterSet) value;
                            set.remove(scope);
                            z = set.isEmpty();
                        } else if (value == scope) {
                            z = true;
                        }
                        if (z) {
                            mutableScatterMap.removeValueAt(index$iv$iv);
                        }
                    }
                    slot$iv$iv >>= i;
                    j$iv$iv++;
                    i2 = i;
                    $i$f$removeIf3 = $i$f$removeIf2;
                }
                $i$f$removeIf = $i$f$removeIf3;
                if (bitCount$iv$iv != i2) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            $i$f$removeIf3 = $i$f$removeIf;
        }
    }

    /* renamed from: asMap-impl */
    public static final Map<Key, Set<Scope>> m3827asMapimpl(MutableScatterMap<Object, Object> mutableScatterMap) {
        HashMap result;
        int $i$f$forEach;
        Object[] k$iv;
        Object[] v$iv;
        int i;
        int $i$f$forEach2;
        Object[] k$iv2;
        Object[] v$iv2;
        Set mutableSetOf;
        HashMap result2 = new HashMap();
        MutableScatterMap<Object, Object> this_$iv = mutableScatterMap;
        int $i$f$forEach3 = 0;
        Object[] k$iv3 = this_$iv.keys;
        Object[] v$iv3 = this_$iv.values;
        long[] m$iv$iv = this_$iv.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                result = result2;
                ScatterMap this_$iv2 = this_$iv;
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    $i$f$forEach = $i$f$forEach3;
                    k$iv = k$iv3;
                    v$iv = v$iv3;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            i = i2;
                            $i$f$forEach2 = $i$f$forEach3;
                            k$iv2 = k$iv3;
                            v$iv2 = v$iv3;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i2;
                            Object key = k$iv3[index$iv$iv];
                            $i$f$forEach2 = $i$f$forEach3;
                            Object value = v$iv3[index$iv$iv];
                            k$iv2 = k$iv3;
                            HashMap hashMap = result;
                            v$iv2 = v$iv3;
                            Intrinsics.checkNotNull(key, "null cannot be cast to non-null type Key of androidx.compose.runtime.collection.ScopeMap");
                            if (value instanceof MutableScatterSet) {
                                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.collection.MutableScatterSet<Scope of androidx.compose.runtime.collection.ScopeMap>");
                                MutableScatterSet set = (MutableScatterSet) value;
                                mutableSetOf = set.asSet();
                            } else {
                                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type Scope of androidx.compose.runtime.collection.ScopeMap");
                                mutableSetOf = SetsKt.mutableSetOf(value);
                            }
                            hashMap.put(key, mutableSetOf);
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        i2 = i;
                        $i$f$forEach3 = $i$f$forEach2;
                        k$iv3 = k$iv2;
                        v$iv3 = v$iv2;
                    }
                    $i$f$forEach = $i$f$forEach3;
                    k$iv = k$iv3;
                    v$iv = v$iv3;
                    if (bitCount$iv$iv != i2) {
                        break;
                    }
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    break;
                }
                i$iv$iv++;
                result2 = result;
                this_$iv = this_$iv2;
                $i$f$forEach3 = $i$f$forEach;
                k$iv3 = k$iv;
                v$iv3 = v$iv;
            }
        } else {
            result = result2;
        }
        return result;
    }
}
