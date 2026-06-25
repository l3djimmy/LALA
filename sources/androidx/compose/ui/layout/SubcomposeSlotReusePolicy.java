package androidx.compose.ui.layout;

import androidx.collection.MutableOrderedScatterSet;
import androidx.collection.OrderedScatterSet;
import androidx.collection.OrderedScatterSetKt;
import androidx.collection.SieveCacheKt;
import java.util.Collection;
import java.util.Iterator;
import java.util.function.Predicate;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.markers.KMappedMarker;
/* compiled from: SubcomposeLayout.kt */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001:\u0001\nJ\u001c\u0010\u0002\u001a\u00020\u00032\b\u0010\u0004\u001a\u0004\u0018\u00010\u00012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0001H&J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u000bÀ\u0006\u0001"}, d2 = {"Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy;", "", "areCompatible", "", "slotId", "reusableSlotId", "getSlotsToRetain", "", "slotIds", "Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy$SlotIdsSet;", "SlotIdsSet", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public interface SubcomposeSlotReusePolicy {
    boolean areCompatible(Object obj, Object obj2);

    void getSlotsToRetain(SlotIdsSet slotIdsSet);

    /* compiled from: SubcomposeLayout.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u001e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010)\n\u0002\b\b\b\u0007\u0018\u00002\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001B\u0019\b\u0000\u0012\u0010\b\u0002\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004¢\u0006\u0002\u0010\u0005J\u0017\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0002H\u0000¢\u0006\u0002\b\rJ\u0006\u0010\u000e\u001a\u00020\u000fJ\u0013\u0010\u0010\u001a\u00020\u000b2\b\u0010\u0011\u001a\u0004\u0018\u00010\u0002H\u0096\u0002J\u0018\u0010\u0012\u001a\u00020\u000b2\u000e\u0010\u0013\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001H\u0016J\u001c\u0010\u0014\u001a\u00020\u000f2\u0014\u0010\u0015\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0004\u0012\u00020\u000f0\u0016J\b\u0010\u0017\u001a\u00020\u000bH\u0016J\u0011\u0010\u0018\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0019H\u0096\u0002J\u0010\u0010\u001a\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0002J\u001c\u0010\u001b\u001a\u00020\u000b2\u0014\u0010\u001c\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0004\u0012\u00020\u000b0\u0016J\u0016\u0010\u001b\u001a\u00020\u000b2\u000e\u0010\u001d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u001c\u0010\u001e\u001a\u00020\u000b2\u0014\u0010\u001c\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0002\u0012\u0004\u0012\u00020\u000b0\u0016J\u0016\u0010\u001e\u001a\u00020\u000b2\u000e\u0010\u001d\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0001J\u000e\u0010\u001f\u001a\u00020\u000f2\u0006\u0010 \u001a\u00020\u0007R\u0016\u0010\u0003\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u00020\u00078VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\t¨\u0006!"}, d2 = {"Landroidx/compose/ui/layout/SubcomposeSlotReusePolicy$SlotIdsSet;", "", "", "set", "Landroidx/collection/MutableOrderedScatterSet;", "(Landroidx/collection/MutableOrderedScatterSet;)V", "size", "", "getSize", "()I", "add", "", "slotId", "add$ui_release", "clear", "", "contains", "element", "containsAll", "elements", "forEach", "block", "Lkotlin/Function1;", "isEmpty", "iterator", "", "remove", "removeAll", "predicate", "slotIds", "retainAll", "trimToSize", "maxSlotsToRetainForReuse", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class SlotIdsSet implements Collection<Object>, KMappedMarker {
        public static final int $stable = 8;
        private final MutableOrderedScatterSet<Object> set;

        public SlotIdsSet() {
            this(null, 1, null);
        }

        @Override // java.util.Collection
        public boolean addAll(Collection<? extends Object> collection) {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }

        @Override // java.util.Collection
        public boolean removeIf(Predicate<? super Object> predicate) {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }

        @Override // java.util.Collection
        public Object[] toArray() {
            return CollectionToArray.toArray(this);
        }

        @Override // java.util.Collection
        public <T> T[] toArray(T[] tArr) {
            return (T[]) CollectionToArray.toArray(this, tArr);
        }

        public SlotIdsSet(MutableOrderedScatterSet<Object> mutableOrderedScatterSet) {
            this.set = mutableOrderedScatterSet;
        }

        @Override // java.util.Collection
        public final /* bridge */ int size() {
            return getSize();
        }

        public /* synthetic */ SlotIdsSet(MutableOrderedScatterSet mutableOrderedScatterSet, int i, DefaultConstructorMarker defaultConstructorMarker) {
            this((i & 1) != 0 ? OrderedScatterSetKt.mutableOrderedScatterSetOf() : mutableOrderedScatterSet);
        }

        public int getSize() {
            return this.set.getSize();
        }

        @Override // java.util.Collection
        public boolean isEmpty() {
            return this.set.isEmpty();
        }

        @Override // java.util.Collection
        public boolean containsAll(Collection<? extends Object> collection) {
            Collection<? extends Object> $this$forEach$iv = collection;
            for (Object element$iv : $this$forEach$iv) {
                if (!this.set.contains(element$iv)) {
                    return false;
                }
            }
            return true;
        }

        @Override // java.util.Collection
        public boolean contains(Object element) {
            return this.set.contains(element);
        }

        @Override // java.util.Collection
        /* renamed from: add$ui_release */
        public final boolean add(Object slotId) {
            return this.set.add(slotId);
        }

        @Override // java.util.Collection, java.lang.Iterable
        public Iterator<Object> iterator() {
            return this.set.asMutableSet().iterator();
        }

        @Override // java.util.Collection
        public final boolean remove(Object slotId) {
            return this.set.remove(slotId);
        }

        @Override // java.util.Collection
        public final boolean removeAll(Collection<? extends Object> collection) {
            return this.set.remove(collection);
        }

        public final boolean removeAll(Function1<Object, Boolean> function1) {
            int $i$f$removeIf;
            int $i$f$removeIf2;
            int i;
            int size = this.set.getSize();
            MutableOrderedScatterSet this_$iv = this.set;
            int $i$f$removeIf3 = 0;
            Object[] elements$iv = this_$iv.elements;
            MutableOrderedScatterSet this_$iv$iv = this_$iv;
            long[] m$iv$iv = this_$iv$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                        $i$f$removeIf = $i$f$removeIf3;
                    } else {
                        int i2 = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            if (!(value$iv$iv$iv < 128)) {
                                $i$f$removeIf2 = $i$f$removeIf3;
                                i = i2;
                            } else {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                i = i2;
                                $i$f$removeIf2 = $i$f$removeIf3;
                                if (function1.invoke(elements$iv[index$iv$iv]).booleanValue()) {
                                    this_$iv.removeElementAt(index$iv$iv);
                                }
                            }
                            slot$iv$iv >>= i;
                            j$iv$iv++;
                            i2 = i;
                            $i$f$removeIf3 = $i$f$removeIf2;
                        }
                        $i$f$removeIf = $i$f$removeIf3;
                        if (bitCount$iv$iv != i2) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                    $i$f$removeIf3 = $i$f$removeIf;
                }
            }
            return size != this.set.getSize();
        }

        @Override // java.util.Collection
        public final boolean retainAll(Collection<? extends Object> collection) {
            return this.set.retainAll(collection);
        }

        public final boolean retainAll(Function1<Object, Boolean> function1) {
            int i;
            MutableOrderedScatterSet this_$iv = this.set;
            Object[] elements$iv = this_$iv.elements;
            int startSize$iv = this_$iv.getSize();
            MutableOrderedScatterSet this_$iv$iv = this_$iv;
            long[] m$iv$iv = this_$iv$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i2 = 8;
                        int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                        int j$iv$iv = 0;
                        while (j$iv$iv < bitCount$iv$iv) {
                            long value$iv$iv$iv = 255 & slot$iv$iv;
                            if (value$iv$iv$iv < 128) {
                                int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                i = i2;
                                if (!function1.invoke(elements$iv[index$iv$iv]).booleanValue()) {
                                    this_$iv.removeElementAt(index$iv$iv);
                                }
                            } else {
                                i = i2;
                            }
                            slot$iv$iv >>= i;
                            j$iv$iv++;
                            i2 = i;
                        }
                        if (bitCount$iv$iv != i2) {
                            break;
                        }
                    }
                    if (i$iv$iv == lastIndex$iv$iv) {
                        break;
                    }
                    i$iv$iv++;
                }
            }
            return startSize$iv != this_$iv.getSize();
        }

        @Override // java.util.Collection
        public final void clear() {
            this.set.clear();
        }

        public final void trimToSize(int maxSlotsToRetainForReuse) {
            this.set.trimToSize(maxSlotsToRetainForReuse);
        }

        public final void forEach(Function1<Object, Unit> function1) {
            OrderedScatterSet this_$iv = this.set;
            Object[] elements$iv = this_$iv.elements;
            long[] nodes$iv = this_$iv.nodes;
            int candidate$iv = this_$iv.tail;
            while (candidate$iv != Integer.MAX_VALUE) {
                long $this$previousNode$iv$iv = nodes$iv[candidate$iv];
                int previousNode$iv = (int) (($this$previousNode$iv$iv >> 31) & SieveCacheKt.NodeLinkMask);
                function1.invoke(elements$iv[candidate$iv]);
                candidate$iv = previousNode$iv;
            }
        }
    }
}
