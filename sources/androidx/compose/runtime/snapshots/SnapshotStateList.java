package androidx.compose.runtime.snapshots;

import androidx.compose.runtime.PreconditionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.ExtensionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.PersistentList;
import androidx.exifinterface.media.ExifInterface;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableList;
/* compiled from: SnapshotStateList.kt */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u001e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010)\n\u0002\b\u0002\n\u0002\u0010+\n\u0002\b\u0018\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u00022\b\u0012\u0004\u0012\u0002H\u00010\u00032\u00060\u0004j\u0002`\u0005:\u0001ZB\u0007\b\u0016¢\u0006\u0002\u0010\u0006B\u0015\b\u0000\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00028\u00000\b¢\u0006\u0002\u0010\tJ\u0015\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\"J\u001d\u0010\u001f\u001a\u00020#2\u0006\u0010$\u001a\u00020\u001a2\u0006\u0010!\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010%J\u001e\u0010&\u001a\u00020 2\u0006\u0010$\u001a\u00020\u001a2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0016J\u0016\u0010&\u001a\u00020 2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0016J\b\u0010)\u001a\u00020#H\u0016J3\u0010*\u001a\u00020 2\b\b\u0002\u0010+\u001a\u00020 2\u001e\u0010,\u001a\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\b\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\b0-H\u0082\bJ\u0016\u0010.\u001a\u00020 2\u0006\u0010!\u001a\u00028\u0000H\u0096\u0002¢\u0006\u0002\u0010\"J\u0016\u0010/\u001a\u00020 2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0016J\u0016\u00100\u001a\u00028\u00002\u0006\u0010$\u001a\u00020\u001aH\u0096\u0002¢\u0006\u0002\u00101J\u0015\u00102\u001a\u00020\u001a2\u0006\u0010!\u001a\u00028\u0000H\u0016¢\u0006\u0002\u00103J\b\u00104\u001a\u00020 H\u0016J\u000f\u00105\u001a\b\u0012\u0004\u0012\u00028\u000006H\u0096\u0002J\u0015\u00107\u001a\u00020\u001a2\u0006\u0010!\u001a\u00028\u0000H\u0016¢\u0006\u0002\u00103J\u000e\u00108\u001a\b\u0012\u0004\u0012\u00028\u000009H\u0016J\u0016\u00108\u001a\b\u0012\u0004\u0012\u00028\u0000092\u0006\u0010$\u001a\u00020\u001aH\u0016J.\u0010:\u001a\u0002H;\"\u0004\b\u0001\u0010;2\u0018\u0010,\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0003\u0012\u0004\u0012\u0002H;0-H\u0082\b¢\u0006\u0002\u0010<J\"\u0010=\u001a\u00020 2\u0018\u0010,\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0003\u0012\u0004\u0012\u00020 0-H\u0002J\u0010\u0010>\u001a\u00020#2\u0006\u0010?\u001a\u00020\u0010H\u0016J\u0015\u0010@\u001a\u00020 2\u0006\u0010!\u001a\u00028\u0000H\u0016¢\u0006\u0002\u0010\"J\u0016\u0010A\u001a\u00020 2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0016J\u0015\u0010B\u001a\u00028\u00002\u0006\u0010$\u001a\u00020\u001aH\u0016¢\u0006\u0002\u00101J\u0016\u0010C\u001a\u00020#2\u0006\u0010D\u001a\u00020\u001a2\u0006\u0010E\u001a\u00020\u001aJ\u0016\u0010F\u001a\u00020 2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0016J+\u0010G\u001a\u00020\u001a2\f\u0010'\u001a\b\u0012\u0004\u0012\u00028\u00000(2\u0006\u0010H\u001a\u00020\u001a2\u0006\u0010I\u001a\u00020\u001aH\u0000¢\u0006\u0002\bJJ\u001e\u0010K\u001a\u00028\u00002\u0006\u0010$\u001a\u00020\u001a2\u0006\u0010!\u001a\u00028\u0000H\u0096\u0002¢\u0006\u0002\u0010LJ\u0016\u0010M\u001a\u00020\u00102\f\u0010N\u001a\b\u0012\u0004\u0012\u00028\u00000\bH\u0002J\u001e\u0010O\u001a\b\u0012\u0004\u0012\u00028\u00000\u00032\u0006\u0010D\u001a\u00020\u001a2\u0006\u0010E\u001a\u00020\u001aH\u0016J\f\u0010P\u001a\b\u0012\u0004\u0012\u00028\u00000\u000bJ\b\u0010Q\u001a\u00020RH\u0016J3\u0010S\u001a\u00020#2\b\b\u0002\u0010+\u001a\u00020 2\u001e\u0010,\u001a\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\b\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\b0-H\u0082\bJ3\u0010T\u001a\u0002H;\"\u0004\b\u0001\u0010;2\u001d\u0010,\u001a\u0019\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0015\u0012\u0004\u0012\u0002H;0-¢\u0006\u0002\bUH\u0082\b¢\u0006\u0002\u0010<J3\u0010V\u001a\u0002H;\"\u0004\b\u0001\u0010;2\u001d\u0010,\u001a\u0019\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u0015\u0012\u0004\u0012\u0002H;0-¢\u0006\u0002\bUH\u0082\b¢\u0006\u0002\u0010<J0\u0010W\u001a\u00020 *\b\u0012\u0004\u0012\u00028\u00000\u00152\u0006\u0010X\u001a\u00020\u001a2\f\u0010Y\u001a\b\u0012\u0004\u0012\u00028\u00000\b2\u0006\u0010+\u001a\u00020 H\u0002R \u0010\n\u001a\b\u0012\u0004\u0012\u00028\u00000\u000b8AX\u0080\u0004¢\u0006\f\u0012\u0004\b\f\u0010\u0006\u001a\u0004\b\r\u0010\u000eR\u001e\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u0010@RX\u0096\u000e¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R \u0010\u0014\u001a\b\u0012\u0004\u0012\u00028\u00000\u00158@X\u0080\u0004¢\u0006\f\u0012\u0004\b\u0016\u0010\u0006\u001a\u0004\b\u0017\u0010\u0018R\u0014\u0010\u0019\u001a\u00020\u001a8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u001cR\u0014\u0010\u001d\u001a\u00020\u001a8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\u001e\u0010\u001c¨\u0006["}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotStateList;", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/runtime/snapshots/StateObject;", "", "Ljava/util/RandomAccess;", "Lkotlin/collections/RandomAccess;", "()V", "persistentList", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;", "(Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;)V", "debuggerDisplayValue", "", "getDebuggerDisplayValue$annotations", "getDebuggerDisplayValue", "()Ljava/util/List;", "<set-?>", "Landroidx/compose/runtime/snapshots/StateRecord;", "firstStateRecord", "getFirstStateRecord", "()Landroidx/compose/runtime/snapshots/StateRecord;", "readable", "Landroidx/compose/runtime/snapshots/SnapshotStateList$StateListStateRecord;", "getReadable$runtime_release$annotations", "getReadable$runtime_release", "()Landroidx/compose/runtime/snapshots/SnapshotStateList$StateListStateRecord;", "size", "", "getSize", "()I", "structure", "getStructure$runtime_release", "add", "", "element", "(Ljava/lang/Object;)Z", "", "index", "(ILjava/lang/Object;)V", "addAll", "elements", "", "clear", "conditionalUpdate", "structural", "block", "Lkotlin/Function1;", "contains", "containsAll", "get", "(I)Ljava/lang/Object;", "indexOf", "(Ljava/lang/Object;)I", "isEmpty", "iterator", "", "lastIndexOf", "listIterator", "", "mutate", "R", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "mutateBoolean", "prependStateRecord", "value", "remove", "removeAll", "removeAt", "removeRange", "fromIndex", "toIndex", "retainAll", "retainAllInRange", "start", "end", "retainAllInRange$runtime_release", "set", "(ILjava/lang/Object;)Ljava/lang/Object;", "stateRecordWith", "list", "subList", "toList", "toString", "", "update", "withCurrent", "Lkotlin/ExtensionFunctionType;", "writable", "attemptUpdate", "currentModification", "newList", "StateListStateRecord", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotStateList<T> implements StateObject, List<T>, RandomAccess, KMutableList {
    public static final int $stable = 0;
    private StateRecord firstStateRecord;

    public static /* synthetic */ void getDebuggerDisplayValue$annotations() {
    }

    public static /* synthetic */ void getReadable$runtime_release$annotations() {
    }

    @Override // java.util.List, java.util.Collection
    public Object[] toArray() {
        return CollectionToArray.toArray(this);
    }

    @Override // java.util.List, java.util.Collection
    public <T> T[] toArray(T[] tArr) {
        return (T[]) CollectionToArray.toArray(this, tArr);
    }

    public SnapshotStateList(PersistentList<? extends T> persistentList) {
        this.firstStateRecord = stateRecordWith(persistentList);
    }

    @Override // java.util.List
    public final /* bridge */ T remove(int index) {
        return removeAt(index);
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ int size() {
        return getSize();
    }

    public SnapshotStateList() {
        this(ExtensionsKt.persistentListOf());
    }

    @Override // androidx.compose.runtime.snapshots.StateObject
    public StateRecord getFirstStateRecord() {
        return this.firstStateRecord;
    }

    @Override // androidx.compose.runtime.snapshots.StateObject
    public void prependStateRecord(StateRecord value) {
        value.setNext$runtime_release(getFirstStateRecord());
        Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        this.firstStateRecord = (StateListStateRecord) value;
    }

    public final List<T> toList() {
        return getReadable$runtime_release().getList$runtime_release();
    }

    public final int getStructure$runtime_release() {
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$withCurrent$iv$iv = (StateListStateRecord) firstStateRecord;
        StateListStateRecord $this$_get_structure__u24lambda_u240 = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv);
        return $this$_get_structure__u24lambda_u240.getStructuralChange$runtime_release();
    }

    public final StateListStateRecord<T> getReadable$runtime_release() {
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        return (StateListStateRecord) SnapshotKt.readable((StateListStateRecord) firstStateRecord, this);
    }

    /* compiled from: SnapshotStateList.kt */
    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0000\u0018\u0000*\u0004\b\u0001\u0010\u00012\u00020\u0002B!\b\u0000\u0012\n\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005\u0012\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0007¢\u0006\u0002\u0010\bJ\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0002H\u0016J\b\u0010\u0019\u001a\u00020\u0002H\u0016J\u0014\u0010\u0019\u001a\u00020\u00022\n\u0010\u0003\u001a\u00060\u0004j\u0002`\u0005H\u0016R \u0010\u0006\u001a\b\u0012\u0004\u0012\u00028\u00010\u0007X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\fR\u001a\u0010\r\u001a\u00020\u000eX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u000eX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0014\u0010\u0010\"\u0004\b\u0015\u0010\u0012¨\u0006\u001a"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotStateList$StateListStateRecord;", ExifInterface.GPS_DIRECTION_TRUE, "Landroidx/compose/runtime/snapshots/StateRecord;", "snapshotId", "", "Landroidx/compose/runtime/snapshots/SnapshotId;", "list", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;", "(JLandroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;)V", "getList$runtime_release", "()Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;", "setList$runtime_release", "(Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;)V", "modification", "", "getModification$runtime_release", "()I", "setModification$runtime_release", "(I)V", "structuralChange", "getStructuralChange$runtime_release", "setStructuralChange$runtime_release", "assign", "", "value", "create", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class StateListStateRecord<T> extends StateRecord {
        public static final int $stable = 8;
        private PersistentList<? extends T> list;
        private int modification;
        private int structuralChange;

        public final PersistentList<T> getList$runtime_release() {
            return (PersistentList<? extends T>) this.list;
        }

        public final void setList$runtime_release(PersistentList<? extends T> persistentList) {
            this.list = persistentList;
        }

        public StateListStateRecord(long snapshotId, PersistentList<? extends T> persistentList) {
            super(snapshotId);
            this.list = persistentList;
        }

        public final int getModification$runtime_release() {
            return this.modification;
        }

        public final void setModification$runtime_release(int i) {
            this.modification = i;
        }

        public final int getStructuralChange$runtime_release() {
            return this.structuralChange;
        }

        public final void setStructuralChange$runtime_release(int i) {
            this.structuralChange = i;
        }

        @Override // androidx.compose.runtime.snapshots.StateRecord
        public void assign(StateRecord value) {
            Object lock$iv;
            lock$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv) {
                Intrinsics.checkNotNull(value, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord>");
                this.list = ((StateListStateRecord) value).list;
                this.modification = ((StateListStateRecord) value).modification;
                this.structuralChange = ((StateListStateRecord) value).structuralChange;
                Unit unit = Unit.INSTANCE;
            }
        }

        @Override // androidx.compose.runtime.snapshots.StateRecord
        public StateRecord create() {
            return create(SnapshotKt.currentSnapshot().getSnapshotId());
        }

        @Override // androidx.compose.runtime.snapshots.StateRecord
        public StateRecord create(long snapshotId) {
            return new StateListStateRecord(snapshotId, this.list);
        }
    }

    public int getSize() {
        return getReadable$runtime_release().getList$runtime_release().size();
    }

    @Override // java.util.List, java.util.Collection
    public boolean contains(Object element) {
        return getReadable$runtime_release().getList$runtime_release().contains(element);
    }

    @Override // java.util.List, java.util.Collection
    public boolean containsAll(Collection<? extends Object> collection) {
        return getReadable$runtime_release().getList$runtime_release().containsAll(collection);
    }

    @Override // java.util.List
    public T get(int index) {
        return (T) getReadable$runtime_release().getList$runtime_release().get(index);
    }

    @Override // java.util.List
    public int indexOf(Object element) {
        return getReadable$runtime_release().getList$runtime_release().indexOf(element);
    }

    @Override // java.util.List, java.util.Collection
    public boolean isEmpty() {
        return getReadable$runtime_release().getList$runtime_release().isEmpty();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public Iterator<T> iterator() {
        return listIterator();
    }

    @Override // java.util.List
    public int lastIndexOf(Object element) {
        return getReadable$runtime_release().getList$runtime_release().lastIndexOf(element);
    }

    @Override // java.util.List
    public ListIterator<T> listIterator() {
        return new StateListIterator(this, 0);
    }

    @Override // java.util.List
    public ListIterator<T> listIterator(int index) {
        return new StateListIterator(this, index);
    }

    @Override // java.util.List
    public List<T> subList(int fromIndex, int toIndex) {
        boolean value$iv = true;
        if (!(fromIndex >= 0 && fromIndex <= toIndex) || toIndex > size()) {
            value$iv = false;
        }
        if (!value$iv) {
            PreconditionsKt.throwIllegalArgumentException("fromIndex or toIndex are out of bounds");
        }
        return new SubList(this, fromIndex, toIndex);
    }

    public String toString() {
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$withCurrent$iv = (StateListStateRecord) firstStateRecord;
        StateListStateRecord it = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv);
        return "SnapshotStateList(value=" + it.getList$runtime_release() + ")@" + hashCode();
    }

    @Override // java.util.List, java.util.Collection
    public boolean add(T t) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        boolean attemptUpdate;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv = this;
        do {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
                Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                currentModification$iv = current$iv.getModification$runtime_release();
                list$runtime_release = current$iv.getList$runtime_release();
                Unit unit = Unit.INSTANCE;
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList it = list$runtime_release.add((PersistentList<T>) t);
            if (Intrinsics.areEqual(it, list$runtime_release)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                current = Snapshot.Companion.getCurrent();
                StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv, current);
                attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, it, true);
            }
            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv);
        } while (!attemptUpdate);
        return true;
    }

    @Override // java.util.List
    public void add(int index, T t) {
        Object lock$iv$iv$iv;
        int currentModification$iv$iv;
        PersistentList<T> list$runtime_release;
        boolean z = false;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv$iv = this;
        while (true) {
            lock$iv$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv$iv) {
                try {
                    StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv$iv);
                    currentModification$iv$iv = current$iv$iv.getModification$runtime_release();
                    list$runtime_release = current$iv$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList it = list$runtime_release.add(index, (int) t);
            if (Intrinsics.areEqual(it, list$runtime_release)) {
                return;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv$iv) {
                try {
                    Snapshot current = Snapshot.Companion.getCurrent();
                    try {
                        boolean z2 = z;
                        try {
                            StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv$iv, current);
                            boolean attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv, currentModification$iv$iv, it, true);
                            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv$iv);
                            if (attemptUpdate) {
                                return;
                            }
                            z = z2;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                }
            }
        }
    }

    @Override // java.util.List
    public boolean addAll(final int index, final Collection<? extends T> collection) {
        return mutateBoolean(new Function1<List<T>, Boolean>() { // from class: androidx.compose.runtime.snapshots.SnapshotStateList$addAll$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                return invoke((List) ((List) p1));
            }

            public final Boolean invoke(List<T> list) {
                return Boolean.valueOf(list.addAll(index, collection));
            }
        });
    }

    @Override // java.util.List, java.util.Collection
    public boolean addAll(Collection<? extends T> collection) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        boolean attemptUpdate;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv = this;
        do {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
                Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                currentModification$iv = current$iv.getModification$runtime_release();
                list$runtime_release = current$iv.getList$runtime_release();
                Unit unit = Unit.INSTANCE;
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList it = list$runtime_release.addAll(collection);
            if (Intrinsics.areEqual(it, list$runtime_release)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                current = Snapshot.Companion.getCurrent();
                StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv, current);
                attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, it, true);
            }
            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv);
        } while (!attemptUpdate);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public void clear() {
        Snapshot current;
        Object lock$iv;
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$writable$iv$iv = (StateListStateRecord) firstStateRecord;
        Object lock$iv$iv$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv$iv$iv) {
            current = Snapshot.Companion.getCurrent();
            StateListStateRecord $this$clear_u24lambda_u247 = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv, this, current);
            lock$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv) {
                $this$clear_u24lambda_u247.setList$runtime_release(ExtensionsKt.persistentListOf());
                $this$clear_u24lambda_u247.setModification$runtime_release($this$clear_u24lambda_u247.getModification$runtime_release() + 1);
                $this$clear_u24lambda_u247.setStructuralChange$runtime_release($this$clear_u24lambda_u247.getStructuralChange$runtime_release() + 1);
            }
        }
        SnapshotKt.notifyWrite(current, this);
    }

    @Override // java.util.List, java.util.Collection
    public boolean remove(Object element) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        boolean attemptUpdate;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv = this;
        do {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
                Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                currentModification$iv = current$iv.getModification$runtime_release();
                list$runtime_release = current$iv.getList$runtime_release();
                Unit unit = Unit.INSTANCE;
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList it = list$runtime_release.remove((PersistentList<T>) element);
            if (Intrinsics.areEqual(it, list$runtime_release)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                current = Snapshot.Companion.getCurrent();
                StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv, current);
                attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, it, true);
            }
            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv);
        } while (!attemptUpdate);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public boolean removeAll(Collection<? extends Object> collection) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        boolean attemptUpdate;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv = this;
        do {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
                Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                currentModification$iv = current$iv.getModification$runtime_release();
                list$runtime_release = current$iv.getList$runtime_release();
                Unit unit = Unit.INSTANCE;
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList it = list$runtime_release.removeAll((Collection<? extends T>) collection);
            if (Intrinsics.areEqual(it, list$runtime_release)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                current = Snapshot.Companion.getCurrent();
                StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv, current);
                attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, it, true);
            }
            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv);
        } while (!attemptUpdate);
        return true;
    }

    public T removeAt(int index) {
        Object lock$iv$iv$iv;
        T t;
        Object obj = get(index);
        Object it = obj;
        boolean z = false;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv$iv = this;
        while (true) {
            lock$iv$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv$iv) {
                t = obj;
                try {
                    StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
                    Object it2 = it;
                    try {
                        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                        StateRecord $this$withCurrent$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                        StateListStateRecord current$iv$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv$iv);
                        int currentModification$iv$iv = current$iv$iv.getModification$runtime_release();
                        PersistentList<T> list$runtime_release = current$iv$iv.getList$runtime_release();
                        Unit unit = Unit.INSTANCE;
                        Intrinsics.checkNotNull(list$runtime_release);
                        PersistentList it3 = list$runtime_release.removeAt(index);
                        if (Intrinsics.areEqual(it3, list$runtime_release)) {
                            break;
                        }
                        StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
                        Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                        StateRecord $this$writable$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
                        Object lock$iv$iv$iv$iv$iv$iv = SnapshotKt.getLock();
                        synchronized (lock$iv$iv$iv$iv$iv$iv) {
                            try {
                                Snapshot current = Snapshot.Companion.getCurrent();
                                try {
                                    boolean z2 = z;
                                    try {
                                        StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv$iv, current);
                                        boolean attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv, currentModification$iv$iv, it3, true);
                                        SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv$iv);
                                        if (attemptUpdate) {
                                            break;
                                        }
                                        obj = t;
                                        it = it2;
                                        z = z2;
                                    } catch (Throwable th) {
                                        th = th;
                                        throw th;
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                            }
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        throw th;
                    }
                } catch (Throwable th5) {
                    th = th5;
                }
            }
        }
        return t;
    }

    @Override // java.util.List, java.util.Collection
    public boolean retainAll(final Collection<? extends Object> collection) {
        return mutateBoolean(new Function1<List<T>, Boolean>() { // from class: androidx.compose.runtime.snapshots.SnapshotStateList$retainAll$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            public final Boolean invoke(List<T> list) {
                return Boolean.valueOf(list.retainAll(collection));
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(Object p1) {
                return invoke((List) ((List) p1));
            }
        });
    }

    @Override // java.util.List
    public T set(int index, T t) {
        Object lock$iv$iv$iv;
        T t2;
        StateRecord firstStateRecord;
        Object it;
        Snapshot current;
        SnapshotStateList this_$iv;
        Object obj = get(index);
        Object it2 = obj;
        boolean z = false;
        SnapshotStateList this_$iv2 = this;
        SnapshotStateList $this$conditionalUpdate_u24lambda_u2423$iv$iv = this_$iv2;
        while (true) {
            lock$iv$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv$iv) {
                t2 = obj;
                try {
                    firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
                    it = it2;
                } catch (Throwable th) {
                    th = th;
                }
                try {
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv$iv);
                    int currentModification$iv$iv = current$iv$iv.getModification$runtime_release();
                    PersistentList<T> list$runtime_release = current$iv$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                    Intrinsics.checkNotNull(list$runtime_release);
                    PersistentList it3 = list$runtime_release.set(index, (int) t);
                    if (Intrinsics.areEqual(it3, list$runtime_release)) {
                        break;
                    }
                    StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv$iv.getFirstStateRecord();
                    boolean z2 = z;
                    Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$writable$iv$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
                    Object lock$iv$iv$iv$iv$iv$iv = SnapshotKt.getLock();
                    synchronized (lock$iv$iv$iv$iv$iv$iv) {
                        try {
                            current = Snapshot.Companion.getCurrent();
                            try {
                                this_$iv = this_$iv2;
                            } catch (Throwable th2) {
                                th = th2;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                        }
                        try {
                            StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv$iv, current);
                            boolean attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv$iv, currentModification$iv$iv, it3, false);
                            SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv$iv);
                            if (attemptUpdate) {
                                break;
                            }
                            z = z2;
                            obj = t2;
                            it2 = it;
                            this_$iv2 = this_$iv;
                        } catch (Throwable th4) {
                            th = th4;
                            throw th;
                        }
                    }
                } catch (Throwable th5) {
                    th = th5;
                    throw th;
                }
            }
        }
        return t2;
    }

    public final void removeRange(int fromIndex, int toIndex) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        StateListStateRecord $this$mutate_u24lambda_u2419$iv;
        boolean z;
        boolean z2 = false;
        while (true) {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                try {
                    StateRecord firstStateRecord = getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                    currentModification$iv = current$iv.getModification$runtime_release();
                    list$runtime_release = current$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList.Builder builder$iv = list$runtime_release.builder();
            PersistentList.Builder it = builder$iv;
            it.subList(fromIndex, toIndex).clear();
            Unit unit2 = Unit.INSTANCE;
            PersistentList newList$iv = builder$iv.build();
            if (Intrinsics.areEqual(newList$iv, list$runtime_release)) {
                return;
            }
            StateRecord firstStateRecord2 = getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                try {
                    current = Snapshot.Companion.getCurrent();
                    $this$mutate_u24lambda_u2419$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, this, current);
                    z = z2;
                } catch (Throwable th2) {
                    th = th2;
                }
                try {
                    boolean attemptUpdate = attemptUpdate($this$mutate_u24lambda_u2419$iv, currentModification$iv, newList$iv, true);
                    SnapshotKt.notifyWrite(current, this);
                    if (attemptUpdate) {
                        return;
                    }
                    z2 = z;
                } catch (Throwable th3) {
                    th = th3;
                    throw th;
                }
            }
        }
    }

    public final int retainAllInRange$runtime_release(Collection<? extends T> collection, int start, int end) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        int startSize;
        StateListStateRecord $this$mutate_u24lambda_u2419$iv;
        boolean z;
        int startSize2 = size();
        boolean z2 = false;
        while (true) {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                try {
                    StateRecord firstStateRecord = getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                    currentModification$iv = current$iv.getModification$runtime_release();
                    list$runtime_release = current$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList.Builder builder$iv = list$runtime_release.builder();
            PersistentList.Builder it = builder$iv;
            it.subList(start, end).retainAll(collection);
            Unit unit2 = Unit.INSTANCE;
            PersistentList newList$iv = builder$iv.build();
            if (Intrinsics.areEqual(newList$iv, list$runtime_release)) {
                startSize = startSize2;
                break;
            }
            StateRecord firstStateRecord2 = getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                try {
                    Snapshot current = Snapshot.Companion.getCurrent();
                    try {
                        startSize = startSize2;
                        try {
                            $this$mutate_u24lambda_u2419$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, this, current);
                            z = z2;
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                    try {
                        boolean attemptUpdate = attemptUpdate($this$mutate_u24lambda_u2419$iv, currentModification$iv, newList$iv, true);
                        SnapshotKt.notifyWrite(current, this);
                        if (attemptUpdate) {
                            break;
                        }
                        startSize2 = startSize;
                        z2 = z;
                    } catch (Throwable th4) {
                        th = th4;
                        throw th;
                    }
                } catch (Throwable th5) {
                    th = th5;
                }
            }
        }
        return startSize - size();
    }

    public final List<T> getDebuggerDisplayValue() {
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$withCurrent$iv$iv = (StateListStateRecord) firstStateRecord;
        StateListStateRecord $this$_get_debuggerDisplayValue__u24lambda_u2416 = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv);
        return $this$_get_debuggerDisplayValue__u24lambda_u2416.getList$runtime_release();
    }

    private final <R> R writable(Function1<? super StateListStateRecord<T>, ? extends R> function1) {
        Snapshot current;
        R invoke;
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$writable$iv = (StateListStateRecord) firstStateRecord;
        Object lock$iv$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv$iv) {
            current = Snapshot.Companion.getCurrent();
            invoke = function1.invoke(SnapshotKt.writableRecord($this$writable$iv, this, current));
        }
        SnapshotKt.notifyWrite(current, this);
        return invoke;
    }

    private final <R> R withCurrent(Function1<? super StateListStateRecord<T>, ? extends R> function1) {
        StateRecord firstStateRecord = getFirstStateRecord();
        Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
        StateRecord $this$withCurrent$iv = (StateListStateRecord) firstStateRecord;
        return function1.invoke(SnapshotKt.current($this$withCurrent$iv));
    }

    private final boolean mutateBoolean(Function1<? super List<T>, Boolean> function1) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        Object result$iv;
        boolean z = false;
        while (true) {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                try {
                    StateRecord firstStateRecord = getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                    currentModification$iv = current$iv.getModification$runtime_release();
                    list$runtime_release = current$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList.Builder builder$iv = list$runtime_release.builder();
            result$iv = function1.invoke(builder$iv);
            PersistentList newList$iv = builder$iv.build();
            if (Intrinsics.areEqual(newList$iv, list$runtime_release)) {
                break;
            }
            StateRecord firstStateRecord2 = getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                try {
                    Snapshot current = Snapshot.Companion.getCurrent();
                    StateListStateRecord $this$mutate_u24lambda_u2419$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, this, current);
                    boolean z2 = z;
                    try {
                        boolean attemptUpdate = attemptUpdate($this$mutate_u24lambda_u2419$iv, currentModification$iv, newList$iv, true);
                        SnapshotKt.notifyWrite(current, this);
                        if (attemptUpdate) {
                            break;
                        }
                        z = z2;
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        }
        return ((Boolean) result$iv).booleanValue();
    }

    private final <R> R mutate(Function1<? super List<T>, ? extends R> function1) {
        Object lock$iv;
        int currentModification;
        PersistentList<T> list$runtime_release;
        boolean z = false;
        R r = null;
        while (true) {
            lock$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv) {
                try {
                    StateRecord firstStateRecord = getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv);
                    currentModification = current.getModification$runtime_release();
                    list$runtime_release = current.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList.Builder builder = list$runtime_release.builder();
            R invoke = function1.invoke(builder);
            PersistentList newList = builder.build();
            if (Intrinsics.areEqual(newList, list$runtime_release)) {
                return invoke;
            }
            StateRecord firstStateRecord2 = getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv) {
                try {
                    Snapshot current2 = Snapshot.Companion.getCurrent();
                    StateListStateRecord $this$mutate_u24lambda_u2419 = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv, this, current2);
                    boolean z2 = z;
                    try {
                        boolean attemptUpdate = attemptUpdate($this$mutate_u24lambda_u2419, currentModification, newList, true);
                        SnapshotKt.notifyWrite(current2, this);
                        if (attemptUpdate) {
                            return invoke;
                        }
                        z = z2;
                        r = invoke;
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        }
    }

    static /* synthetic */ void update$default(SnapshotStateList $this, boolean structural, Function1 block, int i, Object obj) {
        Object lock$iv$iv;
        int currentModification$iv;
        PersistentList<T> list$runtime_release;
        boolean structural2 = (i & 1) != 0 ? true : structural;
        boolean z = false;
        while (true) {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                try {
                    StateRecord firstStateRecord = $this.getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                    currentModification$iv = current$iv.getModification$runtime_release();
                    list$runtime_release = current$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList newList$iv = (PersistentList) block.invoke(list$runtime_release);
            if (Intrinsics.areEqual(newList$iv, list$runtime_release)) {
                return;
            }
            StateRecord firstStateRecord2 = $this.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                try {
                    Snapshot current = Snapshot.Companion.getCurrent();
                    try {
                        boolean z2 = z;
                        try {
                            StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this, current);
                            boolean attemptUpdate = $this.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, newList$iv, structural2);
                            SnapshotKt.notifyWrite(current, $this);
                            if (attemptUpdate) {
                                return;
                            }
                            z = z2;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                }
            }
        }
    }

    private final void update(boolean structural, Function1<? super PersistentList<? extends T>, ? extends PersistentList<? extends T>> function1) {
        Object lock$iv$iv;
        int currentModification$iv;
        Object oldList$iv;
        boolean z = false;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423$iv = this;
        while (true) {
            lock$iv$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv$iv) {
                try {
                    StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current$iv = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv$iv);
                    currentModification$iv = current$iv.getModification$runtime_release();
                    oldList$iv = current$iv.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(oldList$iv);
            PersistentList newList$iv = function1.invoke(oldList$iv);
            if (Intrinsics.areEqual(newList$iv, oldList$iv)) {
                return;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423$iv.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv$iv) {
                try {
                    Snapshot current = Snapshot.Companion.getCurrent();
                    StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv$iv, $this$conditionalUpdate_u24lambda_u2423$iv, current);
                    boolean z2 = z;
                    try {
                        boolean attemptUpdate = $this$conditionalUpdate_u24lambda_u2423$iv.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422$iv, currentModification$iv, newList$iv, structural);
                        SnapshotKt.notifyWrite(current, $this$conditionalUpdate_u24lambda_u2423$iv);
                        if (attemptUpdate) {
                            return;
                        }
                        z = z2;
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        }
    }

    static /* synthetic */ boolean conditionalUpdate$default(SnapshotStateList $this, boolean structural, Function1 block, int i, Object obj) {
        boolean structural2;
        Object lock$iv;
        int currentModification;
        PersistentList<T> list$runtime_release;
        Snapshot current;
        boolean attemptUpdate;
        if ((i & 1) == 0) {
            structural2 = structural;
        } else {
            structural2 = true;
        }
        do {
            lock$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv) {
                StateRecord firstStateRecord = $this.getFirstStateRecord();
                Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                StateRecord $this$withCurrent$iv$iv = (StateListStateRecord) firstStateRecord;
                StateListStateRecord current2 = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv);
                currentModification = current2.getModification$runtime_release();
                list$runtime_release = current2.getList$runtime_release();
                Unit unit = Unit.INSTANCE;
            }
            Intrinsics.checkNotNull(list$runtime_release);
            PersistentList newList = (PersistentList) block.invoke(list$runtime_release);
            if (Intrinsics.areEqual(newList, list$runtime_release)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv) {
                current = Snapshot.Companion.getCurrent();
                StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422 = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv, $this, current);
                attemptUpdate = $this.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422, currentModification, newList, structural2);
            }
            SnapshotKt.notifyWrite(current, $this);
        } while (!attemptUpdate);
        return true;
    }

    private final boolean conditionalUpdate(boolean structural, Function1<? super PersistentList<? extends T>, ? extends PersistentList<? extends T>> function1) {
        Object lock$iv;
        int currentModification;
        Object oldList;
        boolean z = false;
        SnapshotStateList<T> $this$conditionalUpdate_u24lambda_u2423 = this;
        while (true) {
            lock$iv = SnapshotStateListKt.sync;
            synchronized (lock$iv) {
                try {
                    StateRecord firstStateRecord = $this$conditionalUpdate_u24lambda_u2423.getFirstStateRecord();
                    Intrinsics.checkNotNull(firstStateRecord, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
                    StateRecord $this$withCurrent$iv$iv = (StateListStateRecord) firstStateRecord;
                    StateListStateRecord current = (StateListStateRecord) SnapshotKt.current($this$withCurrent$iv$iv);
                    currentModification = current.getModification$runtime_release();
                    oldList = current.getList$runtime_release();
                    Unit unit = Unit.INSTANCE;
                } catch (Throwable th) {
                    throw th;
                }
            }
            Intrinsics.checkNotNull(oldList);
            PersistentList newList = function1.invoke(oldList);
            if (Intrinsics.areEqual(newList, oldList)) {
                return false;
            }
            StateRecord firstStateRecord2 = $this$conditionalUpdate_u24lambda_u2423.getFirstStateRecord();
            Intrinsics.checkNotNull(firstStateRecord2, "null cannot be cast to non-null type androidx.compose.runtime.snapshots.SnapshotStateList.StateListStateRecord<T of androidx.compose.runtime.snapshots.SnapshotStateList>");
            StateRecord $this$writable$iv$iv = (StateListStateRecord) firstStateRecord2;
            Object lock$iv$iv$iv$iv = SnapshotKt.getLock();
            synchronized (lock$iv$iv$iv$iv) {
                try {
                    Snapshot current2 = Snapshot.Companion.getCurrent();
                    StateListStateRecord $this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422 = (StateListStateRecord) SnapshotKt.writableRecord($this$writable$iv$iv, $this$conditionalUpdate_u24lambda_u2423, current2);
                    boolean z2 = z;
                    try {
                        boolean attemptUpdate = $this$conditionalUpdate_u24lambda_u2423.attemptUpdate($this$conditionalUpdate_u24lambda_u2423_u24lambda_u2422, currentModification, newList, structural);
                        SnapshotKt.notifyWrite(current2, $this$conditionalUpdate_u24lambda_u2423);
                        if (attemptUpdate) {
                            return true;
                        }
                        z = z2;
                    } catch (Throwable th2) {
                        th = th2;
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean attemptUpdate(StateListStateRecord<T> stateListStateRecord, int currentModification, PersistentList<? extends T> persistentList, boolean structural) {
        Object lock$iv;
        boolean z;
        lock$iv = SnapshotStateListKt.sync;
        synchronized (lock$iv) {
            if (stateListStateRecord.getModification$runtime_release() == currentModification) {
                stateListStateRecord.setList$runtime_release(persistentList);
                z = true;
                if (structural) {
                    stateListStateRecord.setStructuralChange$runtime_release(stateListStateRecord.getStructuralChange$runtime_release() + 1);
                }
                stateListStateRecord.setModification$runtime_release(stateListStateRecord.getModification$runtime_release() + 1);
            } else {
                z = false;
            }
        }
        return z;
    }

    private final StateRecord stateRecordWith(PersistentList<? extends T> persistentList) {
        Snapshot snapshot = SnapshotKt.currentSnapshot();
        StateListStateRecord it = new StateListStateRecord(snapshot.getSnapshotId(), persistentList);
        if (!(snapshot instanceof GlobalSnapshot)) {
            it.setNext$runtime_release(new StateListStateRecord(SnapshotId_jvmKt.toSnapshotId(1), persistentList));
        }
        return it;
    }
}
