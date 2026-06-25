package androidx.compose.runtime.snapshots;

import androidx.compose.runtime.external.kotlinx.collections.immutable.PersistentList;
import androidx.compose.runtime.snapshots.tooling.SnapshotInstanceObservers;
import androidx.compose.runtime.snapshots.tooling.SnapshotObserverKt;
import java.util.List;
import java.util.Map;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: Snapshot.kt */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u0019\u0012\n\u0010\u0002\u001a\u00060\u0003j\u0002`\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\b\u0010\b\u001a\u00020\tH\u0016J\b\u0010\n\u001a\u00020\u000bH\u0016J\u0015\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0010¢\u0006\u0002\b\u0010J\u0015\u0010\u0011\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0010¢\u0006\u0002\b\u0012J\r\u0010\u0013\u001a\u00020\u000bH\u0010¢\u0006\u0002\b\u0014J4\u0010\u0015\u001a\u00020\u00012\u0014\u0010\u0016\u001a\u0010\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u00172\u0014\u0010\u0019\u001a\u0010\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0017H\u0016J\u001e\u0010\u001a\u001a\u00020\u000f2\u0014\u0010\u0016\u001a\u0010\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0017H\u0016¨\u0006\u001b"}, d2 = {"Landroidx/compose/runtime/snapshots/GlobalSnapshot;", "Landroidx/compose/runtime/snapshots/MutableSnapshot;", "snapshotId", "", "Landroidx/compose/runtime/snapshots/SnapshotId;", "invalid", "Landroidx/compose/runtime/snapshots/SnapshotIdSet;", "(JLandroidx/compose/runtime/snapshots/SnapshotIdSet;)V", "apply", "Landroidx/compose/runtime/snapshots/SnapshotApplyResult;", "dispose", "", "nestedActivated", "", "snapshot", "Landroidx/compose/runtime/snapshots/Snapshot;", "nestedActivated$runtime_release", "nestedDeactivated", "nestedDeactivated$runtime_release", "notifyObjectsInitialized", "notifyObjectsInitialized$runtime_release", "takeNestedMutableSnapshot", "readObserver", "Lkotlin/Function1;", "", "writeObserver", "takeNestedSnapshot", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class GlobalSnapshot extends MutableSnapshot {
    public static final int $stable = 0;

    public GlobalSnapshot(long snapshotId, SnapshotIdSet invalid) {
        super(snapshotId, invalid, null, new Function1<Object, Unit>() { // from class: androidx.compose.runtime.snapshots.GlobalSnapshot.1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object state) {
                List $this$fastForEach$iv;
                Object lock$iv$iv = SnapshotKt.getLock();
                synchronized (lock$iv$iv) {
                    $this$fastForEach$iv = SnapshotKt.globalWriteObservers;
                    int size = $this$fastForEach$iv.size();
                    for (int index$iv = 0; index$iv < size; index$iv++) {
                        Object item$iv = $this$fastForEach$iv.get(index$iv);
                        Function1 it = (Function1) item$iv;
                        it.invoke(state);
                    }
                    Unit unit = Unit.INSTANCE;
                }
            }
        });
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot, androidx.compose.runtime.snapshots.Snapshot
    public Snapshot takeNestedSnapshot(Function1<Object, Unit> function1) {
        Snapshot takeNewSnapshot;
        Map observerMap$iv = null;
        PersistentList observers$iv = SnapshotObserverKt.access$getObservers$p();
        Function1 actualReadObserver$iv = function1;
        if (observers$iv != null) {
            Pair result$iv = SnapshotObserverKt.mergeObservers(observers$iv, null, true, function1, null);
            SnapshotInstanceObservers mappedObservers$iv = result$iv.getFirst();
            actualReadObserver$iv = mappedObservers$iv.getReadObserver();
            mappedObservers$iv.getWriteObserver();
            Map observerMap$iv2 = result$iv.getSecond();
            observerMap$iv = observerMap$iv2;
        }
        final Function1 actualReadObserver = actualReadObserver$iv;
        takeNewSnapshot = SnapshotKt.takeNewSnapshot(new Function1<SnapshotIdSet, ReadonlySnapshot>() { // from class: androidx.compose.runtime.snapshots.GlobalSnapshot$takeNestedSnapshot$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final ReadonlySnapshot invoke(SnapshotIdSet invalid) {
                long j;
                long j2;
                Object lock$iv$iv = SnapshotKt.getLock();
                synchronized (lock$iv$iv) {
                    j = SnapshotKt.nextSnapshotId;
                    j2 = SnapshotKt.nextSnapshotId;
                    SnapshotKt.nextSnapshotId = j2 + 1;
                }
                return new ReadonlySnapshot(j, invalid, actualReadObserver);
            }
        });
        Snapshot result$iv2 = (ReadonlySnapshot) takeNewSnapshot;
        if (observers$iv != null) {
            SnapshotObserverKt.dispatchCreatedObservers(observers$iv, null, result$iv2, observerMap$iv);
        }
        return result$iv2;
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot
    public MutableSnapshot takeNestedMutableSnapshot(Function1<Object, Unit> function1, Function1<Object, Unit> function12) {
        Snapshot takeNewSnapshot;
        Map observerMap$iv = null;
        PersistentList observers$iv = SnapshotObserverKt.access$getObservers$p();
        Function1 actualReadObserver$iv = function1;
        Function1 actualWriteObserver$iv = function12;
        if (observers$iv != null) {
            Pair result$iv = SnapshotObserverKt.mergeObservers(observers$iv, null, false, function1, function12);
            SnapshotInstanceObservers mappedObservers$iv = result$iv.getFirst();
            actualReadObserver$iv = mappedObservers$iv.getReadObserver();
            actualWriteObserver$iv = mappedObservers$iv.getWriteObserver();
            Map observerMap$iv2 = result$iv.getSecond();
            observerMap$iv = observerMap$iv2;
        }
        final Function1 actualReadObserver = actualReadObserver$iv;
        final Function1 actualWriteObserver = actualWriteObserver$iv;
        takeNewSnapshot = SnapshotKt.takeNewSnapshot(new Function1<SnapshotIdSet, MutableSnapshot>() { // from class: androidx.compose.runtime.snapshots.GlobalSnapshot$takeNestedMutableSnapshot$1$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final MutableSnapshot invoke(SnapshotIdSet invalid) {
                long j;
                long j2;
                Object lock$iv$iv = SnapshotKt.getLock();
                synchronized (lock$iv$iv) {
                    j = SnapshotKt.nextSnapshotId;
                    j2 = SnapshotKt.nextSnapshotId;
                    SnapshotKt.nextSnapshotId = j2 + 1;
                }
                return new MutableSnapshot(j, invalid, actualReadObserver, actualWriteObserver);
            }
        });
        Snapshot result$iv2 = (MutableSnapshot) takeNewSnapshot;
        if (observers$iv != null) {
            SnapshotObserverKt.dispatchCreatedObservers(observers$iv, null, result$iv2, observerMap$iv);
        }
        return (MutableSnapshot) result$iv2;
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot, androidx.compose.runtime.snapshots.Snapshot
    public void notifyObjectsInitialized$runtime_release() {
        SnapshotKt.advanceGlobalSnapshot();
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot, androidx.compose.runtime.snapshots.Snapshot
    /* renamed from: nestedDeactivated$runtime_release */
    public Void mo3848nestedDeactivated$runtime_release(Snapshot snapshot) {
        SnapshotStateMapKt.unsupported();
        throw new KotlinNothingValueException();
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot, androidx.compose.runtime.snapshots.Snapshot
    /* renamed from: nestedActivated$runtime_release */
    public Void mo3847nestedActivated$runtime_release(Snapshot snapshot) {
        SnapshotStateMapKt.unsupported();
        throw new KotlinNothingValueException();
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot
    public SnapshotApplyResult apply() {
        throw new IllegalStateException("Cannot apply the global snapshot directly. Call Snapshot.advanceGlobalSnapshot".toString());
    }

    @Override // androidx.compose.runtime.snapshots.MutableSnapshot, androidx.compose.runtime.snapshots.Snapshot
    public void dispose() {
        Object lock$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv) {
            releasePinnedSnapshotLocked$runtime_release();
            Unit unit = Unit.INSTANCE;
        }
    }
}
