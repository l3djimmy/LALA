package androidx.compose.runtime.snapshots;

import androidx.autofill.HintConstants;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.sequences.SequencesKt;
/* compiled from: SnapshotIdSet.kt */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0016\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010(\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0001\u0018\u0000 &2\f\u0012\b\u0012\u00060\u0002j\u0002`\u00030\u0001:\u0001&B3\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002\u0012\n\u0010\u0006\u001a\u00060\u0002j\u0002`\u0003\u0012\u000e\u0010\u0007\u001a\n\u0018\u00010\bj\u0004\u0018\u0001`\t¢\u0006\u0002\u0010\nJ\u000e\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u0000J\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u0000J\u0012\u0010\u000e\u001a\u00020\u00002\n\u0010\u000f\u001a\u00060\u0002j\u0002`\u0003J>\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u00002+\u0010\u0012\u001a'\u0012\u0013\u0012\u00110\u0000¢\u0006\f\b\u0014\u0012\b\b\u0015\u0012\u0004\b\b(\u0016\u0012\b\u0012\u00060\u0002j\u0002`\u0003\u0012\u0004\u0012\u00020\u00000\u0013H\u0082\bJ!\u0010\u0017\u001a\u00020\u00182\u0016\u0010\u0019\u001a\u0012\u0012\b\u0012\u00060\u0002j\u0002`\u0003\u0012\u0004\u0012\u00020\u00180\u001aH\u0086\bJ\u0012\u0010\u001b\u001a\u00020\u001c2\n\u0010\u000f\u001a\u00060\u0002j\u0002`\u0003J\u0013\u0010\u001d\u001a\f\u0012\b\u0012\u00060\u0002j\u0002`\u00030\u001eH\u0096\u0002J\u0016\u0010\u001f\u001a\u00060\u0002j\u0002`\u00032\n\u0010 \u001a\u00060\u0002j\u0002`\u0003J\u000e\u0010!\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020\u0000J\u0012\u0010#\u001a\u00020\u00002\n\u0010\u000f\u001a\u00060\u0002j\u0002`\u0003J\b\u0010$\u001a\u00020%H\u0016R\u0016\u0010\u0007\u001a\n\u0018\u00010\bj\u0004\u0018\u0001`\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00060\u0002j\u0002`\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0002X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0002X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006'"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "", "", "Landroidx/compose/runtime/snapshots/SnapshotId;", "upperSet", "lowerSet", "lowerBound", "belowBound", "", "Landroidx/compose/runtime/snapshots/SnapshotIdArray;", "(JJJ[J)V", "and", "ids", "andNot", "clear", "id", "fastFold", "initial", "operation", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "acc", "fastForEach", "", "block", "Lkotlin/Function1;", "get", "", "iterator", "", "lowest", "default", "or", "bits", "set", "toString", "", "Companion", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotIdSet implements Iterable<Long>, KMappedMarker {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private static final SnapshotIdSet EMPTY = new SnapshotIdSet(0, 0, 0, null);
    private final long[] belowBound;
    private final long lowerBound;
    private final long lowerSet;
    private final long upperSet;

    private SnapshotIdSet(long upperSet, long lowerSet, long lowerBound, long[] belowBound) {
        this.upperSet = upperSet;
        this.lowerSet = lowerSet;
        this.lowerBound = lowerBound;
        this.belowBound = belowBound;
    }

    public final boolean get(long id) {
        long[] it;
        long offset = id - this.lowerBound;
        return (offset < 0 || offset >= 64) ? (offset < 64 || offset >= 128) ? offset <= 0 && (it = this.belowBound) != null && SnapshotId_jvmKt.binarySearch(it, id) >= 0 : ((1 << (((int) offset) + (-64))) & this.upperSet) != 0 : ((1 << ((int) offset)) & this.lowerSet) != 0;
    }

    public final SnapshotIdSet set(long id) {
        long newLowerSet;
        long newLowerBound;
        long[] jArr;
        long offset = id - this.lowerBound;
        long j = 1;
        if (offset >= 0 && offset < 64) {
            long mask = 1 << ((int) offset);
            if ((this.lowerSet & mask) == 0) {
                return new SnapshotIdSet(this.upperSet, this.lowerSet | mask, this.lowerBound, this.belowBound);
            }
        } else if (offset >= 64 && offset < 128) {
            long mask2 = 1 << (((int) offset) - 64);
            if ((this.upperSet & mask2) == 0) {
                return new SnapshotIdSet(this.upperSet | mask2, this.lowerSet, this.lowerBound, this.belowBound);
            }
        } else if (offset >= 128) {
            if (!get(id)) {
                long newUpperSet = this.upperSet;
                long newLowerSet2 = this.lowerSet;
                long newLowerBound2 = this.lowerBound;
                SnapshotIdArrayBuilder snapshotIdArrayBuilder = null;
                long it = ((id + 1) / 64) * 64;
                if (it < 0) {
                    it = 9223372036854775680L;
                }
                long newUpperSet2 = newUpperSet;
                while (true) {
                    if (newLowerBound2 >= it) {
                        newLowerSet = newLowerSet2;
                        newLowerBound = newLowerBound2;
                        break;
                    }
                    if (newLowerSet2 != 0) {
                        if (snapshotIdArrayBuilder == null) {
                            snapshotIdArrayBuilder = new SnapshotIdArrayBuilder(this.belowBound);
                        }
                        int i = 0;
                        while (i < 64) {
                            int bitOffset = i;
                            if ((newLowerSet2 & (j << bitOffset)) != 0) {
                                snapshotIdArrayBuilder.add(bitOffset + newLowerBound2);
                            }
                            i++;
                            j = 1;
                        }
                    }
                    if (newUpperSet2 == 0) {
                        long newLowerBound3 = it;
                        newLowerSet = 0;
                        newLowerBound = newLowerBound3;
                        break;
                    }
                    newLowerSet2 = newUpperSet2;
                    newUpperSet2 = 0;
                    newLowerBound2 += 64;
                    j = 1;
                }
                if (snapshotIdArrayBuilder == null || (jArr = snapshotIdArrayBuilder.toArray()) == null) {
                    jArr = this.belowBound;
                }
                return new SnapshotIdSet(newUpperSet2, newLowerSet, newLowerBound, jArr).set(id);
            }
        } else {
            long[] array = this.belowBound;
            if (array == null) {
                return new SnapshotIdSet(this.upperSet, this.lowerSet, this.lowerBound, new long[]{id});
            }
            int location = SnapshotId_jvmKt.binarySearch(array, id);
            if (location < 0) {
                int insertLocation = -(location + 1);
                long[] newBelowBound = SnapshotId_jvmKt.withIdInsertedAt(array, insertLocation, id);
                return new SnapshotIdSet(this.upperSet, this.lowerSet, this.lowerBound, newBelowBound);
            }
        }
        return this;
    }

    public final SnapshotIdSet clear(long id) {
        long[] array;
        int location;
        long offset = id - this.lowerBound;
        if (offset >= 0 && offset < 64) {
            long mask = 1 << ((int) offset);
            if ((this.lowerSet & mask) != 0) {
                return new SnapshotIdSet(this.upperSet, (~mask) & this.lowerSet, this.lowerBound, this.belowBound);
            }
        } else if (offset >= 64 && offset < 128) {
            long mask2 = 1 << (((int) offset) - 64);
            if ((this.upperSet & mask2) != 0) {
                return new SnapshotIdSet((~mask2) & this.upperSet, this.lowerSet, this.lowerBound, this.belowBound);
            }
        } else if (offset < 0 && (array = this.belowBound) != null && (location = SnapshotId_jvmKt.binarySearch(array, id)) >= 0) {
            return new SnapshotIdSet(this.upperSet, this.lowerSet, this.lowerBound, SnapshotId_jvmKt.withIdRemovedAt(array, location));
        }
        return this;
    }

    public final SnapshotIdSet andNot(SnapshotIdSet ids) {
        if (ids == EMPTY) {
            return this;
        }
        if (this == EMPTY) {
            return EMPTY;
        }
        if (ids.lowerBound == this.lowerBound && ids.belowBound == this.belowBound) {
            return new SnapshotIdSet((~ids.upperSet) & this.upperSet, (~ids.lowerSet) & this.lowerSet, this.lowerBound, this.belowBound);
        }
        SnapshotIdSet this_$iv = ids;
        SnapshotIdSet snapshotIdSet = this;
        long[] $this$forEach$iv$iv$iv = this_$iv.belowBound;
        if ($this$forEach$iv$iv$iv != null) {
            int length = $this$forEach$iv$iv$iv.length;
            int i = 0;
            while (i < length) {
                long value$iv$iv$iv = $this$forEach$iv$iv$iv[i];
                SnapshotIdSet previous = snapshotIdSet;
                snapshotIdSet = previous.clear(value$iv$iv$iv);
                i++;
                this_$iv = this_$iv;
            }
        }
        if (this_$iv.lowerSet != 0) {
            for (int index$iv$iv = 0; index$iv$iv < 64; index$iv$iv++) {
                if ((this_$iv.lowerSet & (1 << index$iv$iv)) != 0) {
                    long element$iv = this_$iv.lowerBound + index$iv$iv;
                    SnapshotIdSet previous2 = snapshotIdSet;
                    snapshotIdSet = previous2.clear(element$iv);
                }
            }
        }
        if (this_$iv.upperSet != 0) {
            for (int index$iv$iv2 = 0; index$iv$iv2 < 64; index$iv$iv2++) {
                if ((this_$iv.upperSet & (1 << index$iv$iv2)) != 0) {
                    long element$iv2 = this_$iv.lowerBound + index$iv$iv2 + 64;
                    SnapshotIdSet previous3 = snapshotIdSet;
                    snapshotIdSet = previous3.clear(element$iv2);
                }
            }
        }
        return snapshotIdSet;
    }

    public final SnapshotIdSet and(SnapshotIdSet ids) {
        long j;
        long j2;
        long j3;
        if (!Intrinsics.areEqual(ids, EMPTY) && !Intrinsics.areEqual(this, EMPTY)) {
            if (ids.lowerBound == this.lowerBound && ids.belowBound == this.belowBound) {
                long newUpper = this.upperSet & ids.upperSet;
                long newLower = this.lowerSet & ids.lowerSet;
                if (newUpper == 0 && newLower == 0 && this.belowBound == null) {
                    SnapshotIdSet initial$iv = EMPTY;
                    return initial$iv;
                }
                SnapshotIdSet initial$iv2 = new SnapshotIdSet(ids.upperSet & this.upperSet, ids.lowerSet & this.lowerSet, this.lowerBound, this.belowBound);
                return initial$iv2;
            }
            int i = 0;
            if (this.belowBound != null) {
                SnapshotIdSet initial$iv3 = EMPTY;
                SnapshotIdSet previous = initial$iv3;
                long[] $this$forEach$iv$iv$iv = ids.belowBound;
                if ($this$forEach$iv$iv$iv != null) {
                    boolean z = false;
                    int length = $this$forEach$iv$iv$iv.length;
                    while (i < length) {
                        long value$iv$iv$iv = $this$forEach$iv$iv$iv[i];
                        SnapshotIdSet previous2 = previous;
                        boolean z2 = z;
                        if (get(value$iv$iv$iv)) {
                            previous2 = previous2.set(value$iv$iv$iv);
                        }
                        previous = previous2;
                        i++;
                        z = z2;
                    }
                }
                if (ids.lowerSet != 0) {
                    for (int index$iv$iv = 0; index$iv$iv < 64; index$iv$iv++) {
                        if ((ids.lowerSet & (1 << index$iv$iv)) != 0) {
                            long element$iv = ids.lowerBound + index$iv$iv;
                            SnapshotIdSet previous3 = previous;
                            if (get(element$iv)) {
                                previous3 = previous3.set(element$iv);
                            }
                            previous = previous3;
                        }
                    }
                }
                if (ids.upperSet != 0) {
                    for (int index$iv$iv2 = 0; index$iv$iv2 < 64; index$iv$iv2++) {
                        if ((ids.upperSet & (1 << index$iv$iv2)) != 0) {
                            long element$iv2 = ids.lowerBound + index$iv$iv2 + 64;
                            SnapshotIdSet previous4 = previous;
                            if (get(element$iv2)) {
                                previous4 = previous4.set(element$iv2);
                            }
                            previous = previous4;
                        }
                    }
                }
                SnapshotIdSet initial$iv4 = previous;
                return initial$iv4;
            }
            SnapshotIdSet initial$iv5 = EMPTY;
            SnapshotIdSet previous5 = initial$iv5;
            long[] $this$forEach$iv$iv$iv2 = this.belowBound;
            if ($this$forEach$iv$iv$iv2 != null) {
                j = 0;
                int length2 = $this$forEach$iv$iv$iv2.length;
                while (i < length2) {
                    long value$iv$iv$iv2 = $this$forEach$iv$iv$iv2[i];
                    SnapshotIdSet previous6 = previous5;
                    if (ids.get(value$iv$iv$iv2)) {
                        previous6 = previous6.set(value$iv$iv$iv2);
                    }
                    previous5 = previous6;
                    i++;
                }
                j2 = 1;
                j3 = 64;
            } else {
                j = 0;
                j2 = 1;
                j3 = 64;
            }
            if (this.lowerSet != j) {
                for (int index$iv$iv3 = 0; index$iv$iv3 < 64; index$iv$iv3++) {
                    if ((this.lowerSet & (j2 << index$iv$iv3)) != j) {
                        long element$iv3 = this.lowerBound + index$iv$iv3;
                        SnapshotIdSet previous7 = previous5;
                        if (ids.get(element$iv3)) {
                            previous7 = previous7.set(element$iv3);
                        }
                        previous5 = previous7;
                    }
                }
            }
            if (this.upperSet != j) {
                for (int index$iv$iv4 = 0; index$iv$iv4 < 64; index$iv$iv4++) {
                    if ((this.upperSet & (j2 << index$iv$iv4)) != j) {
                        long element$iv4 = this.lowerBound + index$iv$iv4 + j3;
                        SnapshotIdSet previous8 = previous5;
                        if (ids.get(element$iv4)) {
                            previous8 = previous8.set(element$iv4);
                        }
                        previous5 = previous8;
                    }
                }
            }
            SnapshotIdSet initial$iv6 = previous5;
            return initial$iv6;
        }
        return EMPTY;
    }

    public final SnapshotIdSet or(SnapshotIdSet bits) {
        long j;
        long j2;
        long j3;
        if (bits == EMPTY) {
            return this;
        }
        if (this == EMPTY) {
            return bits;
        }
        if (bits.lowerBound == this.lowerBound && bits.belowBound == this.belowBound) {
            return new SnapshotIdSet(bits.upperSet | this.upperSet, bits.lowerSet | this.lowerSet, this.lowerBound, this.belowBound);
        }
        int i = 0;
        if (this.belowBound != null) {
            SnapshotIdSet snapshotIdSet = this;
            long[] $this$forEach$iv$iv$iv = bits.belowBound;
            if ($this$forEach$iv$iv$iv != null) {
                int length = $this$forEach$iv$iv$iv.length;
                while (i < length) {
                    long value$iv$iv$iv = $this$forEach$iv$iv$iv[i];
                    SnapshotIdSet previous = snapshotIdSet;
                    snapshotIdSet = previous.set(value$iv$iv$iv);
                    i++;
                    $this$forEach$iv$iv$iv = $this$forEach$iv$iv$iv;
                }
            }
            if (bits.lowerSet != 0) {
                for (int index$iv$iv = 0; index$iv$iv < 64; index$iv$iv++) {
                    if ((bits.lowerSet & (1 << index$iv$iv)) != 0) {
                        long element$iv = bits.lowerBound + index$iv$iv;
                        SnapshotIdSet previous2 = snapshotIdSet;
                        snapshotIdSet = previous2.set(element$iv);
                    }
                }
            }
            if (bits.upperSet != 0) {
                for (int index$iv$iv2 = 0; index$iv$iv2 < 64; index$iv$iv2++) {
                    if ((bits.upperSet & (1 << index$iv$iv2)) != 0) {
                        long element$iv2 = bits.lowerBound + index$iv$iv2 + 64;
                        SnapshotIdSet previous3 = snapshotIdSet;
                        snapshotIdSet = previous3.set(element$iv2);
                    }
                }
            }
            return snapshotIdSet;
        }
        SnapshotIdSet snapshotIdSet2 = bits;
        long[] $this$forEach$iv$iv$iv2 = this.belowBound;
        if ($this$forEach$iv$iv$iv2 != null) {
            j = 64;
            int length2 = $this$forEach$iv$iv$iv2.length;
            while (i < length2) {
                long value$iv$iv$iv2 = $this$forEach$iv$iv$iv2[i];
                SnapshotIdSet previous4 = snapshotIdSet2;
                snapshotIdSet2 = previous4.set(value$iv$iv$iv2);
                i++;
            }
            j2 = 0;
            j3 = 1;
        } else {
            j = 64;
            j2 = 0;
            j3 = 1;
        }
        if (this.lowerSet != j2) {
            for (int index$iv$iv3 = 0; index$iv$iv3 < 64; index$iv$iv3++) {
                if ((this.lowerSet & (j3 << index$iv$iv3)) != j2) {
                    long element$iv3 = this.lowerBound + index$iv$iv3;
                    SnapshotIdSet previous5 = snapshotIdSet2;
                    snapshotIdSet2 = previous5.set(element$iv3);
                }
            }
        }
        if (this.upperSet != j2) {
            for (int index$iv$iv4 = 0; index$iv$iv4 < 64; index$iv$iv4++) {
                if ((this.upperSet & (j3 << index$iv$iv4)) != j2) {
                    long element$iv4 = this.lowerBound + index$iv$iv4 + j;
                    SnapshotIdSet previous6 = snapshotIdSet2;
                    snapshotIdSet2 = previous6.set(element$iv4);
                }
            }
            return snapshotIdSet2;
        }
        return snapshotIdSet2;
    }

    @Override // java.lang.Iterable
    public Iterator<Long> iterator() {
        return SequencesKt.sequence(new SnapshotIdSet$iterator$1(this, null)).iterator();
    }

    private final SnapshotIdSet fastFold(SnapshotIdSet initial, Function2<? super SnapshotIdSet, ? super Long, SnapshotIdSet> function2) {
        SnapshotIdSet this_$iv = initial;
        long[] $this$forEach$iv$iv = this.belowBound;
        if ($this$forEach$iv$iv != null) {
            for (long value$iv$iv : $this$forEach$iv$iv) {
                this_$iv = function2.invoke(this_$iv, Long.valueOf(value$iv$iv));
            }
        }
        if (this.lowerSet != 0) {
            for (int index$iv = 0; index$iv < 64; index$iv++) {
                if ((this.lowerSet & (1 << index$iv)) != 0) {
                    long element = this.lowerBound + index$iv;
                    this_$iv = function2.invoke(this_$iv, Long.valueOf(element));
                }
            }
        }
        if (this.upperSet != 0) {
            for (int index$iv2 = 0; index$iv2 < 64; index$iv2++) {
                if ((this.upperSet & (1 << index$iv2)) != 0) {
                    long element2 = this.lowerBound + index$iv2 + 64;
                    this_$iv = function2.invoke(this_$iv, Long.valueOf(element2));
                }
            }
        }
        return this_$iv;
    }

    public final void fastForEach(Function1<? super Long, Unit> function1) {
        long[] $this$forEach$iv = this.belowBound;
        if ($this$forEach$iv != null) {
            for (long value$iv : $this$forEach$iv) {
                function1.invoke(Long.valueOf(value$iv));
            }
        }
        if (this.lowerSet != 0) {
            for (int index = 0; index < 64; index++) {
                if ((this.lowerSet & (1 << index)) != 0) {
                    function1.invoke(Long.valueOf(this.lowerBound + index));
                }
            }
        }
        if (this.upperSet != 0) {
            for (int index2 = 0; index2 < 64; index2++) {
                if ((this.upperSet & (1 << index2)) != 0) {
                    function1.invoke(Long.valueOf(this.lowerBound + index2 + 64));
                }
            }
        }
    }

    public final long lowest(long j) {
        long[] belowBound = this.belowBound;
        if (belowBound != null) {
            return belowBound[0];
        }
        return this.lowerSet != 0 ? this.lowerBound + Long.numberOfTrailingZeros(this.lowerSet) : this.upperSet != 0 ? this.lowerBound + 64 + Long.numberOfTrailingZeros(this.upperSet) : j;
    }

    public String toString() {
        StringBuilder append = new StringBuilder().append(super.toString()).append(" [");
        SnapshotIdSet $this$map$iv = this;
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            long it = ((Number) item$iv$iv).longValue();
            destination$iv$iv.add(String.valueOf(it));
        }
        return append.append(ListUtilsKt.fastJoinToString$default((List) destination$iv$iv, null, null, null, 0, null, null, 63, null)).append(']').toString();
    }

    /* compiled from: SnapshotIdSet.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotIdSet$Companion;", "", "()V", "EMPTY", "Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "getEMPTY", "()Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final SnapshotIdSet getEMPTY() {
            return SnapshotIdSet.EMPTY;
        }
    }
}
