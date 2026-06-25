package androidx.compose.runtime.snapshots.tooling;

import androidx.autofill.HintConstants;
import androidx.collection.ScatterSet;
import androidx.compose.runtime.collection.ScatterSetWrapperKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.ExtensionsKt;
import androidx.compose.runtime.external.kotlinx.collections.immutable.PersistentList;
import androidx.compose.runtime.snapshots.ObserverHandle;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.runtime.snapshots.SnapshotKt;
import androidx.compose.runtime.snapshots.StateObject;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.SetsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: SnapshotObserver.kt */
@Metadata(d1 = {"\u0000^\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a°\u0001\u0010\u0005\u001a\u0002H\u0006\"\b\b\u0000\u0010\u0006*\u00020\u00072\b\u0010\b\u001a\u0004\u0018\u00010\u00072\u0016\b\b\u0010\t\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n2\u0016\b\b\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n2\u0006\u0010\u000e\u001a\u00020\u000f2T\b\u0004\u0010\u0010\u001aN\u0012!\u0012\u001f\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\t\u0012!\u0012\u001f\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\r\u0012\u0004\u0012\u0002H\u00060\u0011H\u0081\b¢\u0006\u0002\u0010\u0014\u001a \u0010\u0015\u001a\u00020\f2\u0006\u0010\u0016\u001a\u00020\u00072\u000e\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018H\u0000\u001a\u0010\u0010\u001a\u001a\u00020\f2\u0006\u0010\u0016\u001a\u00020\u0007H\u0000\u001aB\u0010\u001b\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n2\u0014\u0010\u001c\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n2\u0014\u0010\u001d\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\nH\u0002\u001a:\u0010\u001e\u001a\u00020\f*\b\u0012\u0004\u0012\u00020\u00020\u00012\b\u0010\b\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u001f\u001a\u00020\u00072\u0014\u0010 \u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\"\u0018\u00010!H\u0001\u001aj\u0010\u001b\u001a\u001c\u0012\u0004\u0012\u00020\"\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\"\u0018\u00010!0#*\b\u0012\u0004\u0012\u00020\u00020\u00012\b\u0010\b\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u000e\u001a\u00020\u000f2\u0014\u0010\t\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\n2\u0014\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\nH\u0001\u001a\u0014\u0010$\u001a\u00020%*\u00020&2\u0006\u0010'\u001a\u00020\u0002H\u0007\" \u0010\u0000\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u00018\u0002@\u0002X\u0083\u000e¢\u0006\b\n\u0000\u0012\u0004\b\u0003\u0010\u0004¨\u0006("}, d2 = {"observers", "Landroidx/compose/runtime/external/kotlinx/collections/immutable/PersistentList;", "Landroidx/compose/runtime/snapshots/tooling/SnapshotObserver;", "getObservers$annotations", "()V", "creatingSnapshot", "R", "Landroidx/compose/runtime/snapshots/Snapshot;", "parent", "readObserver", "Lkotlin/Function1;", "", "", "writeObserver", "readonly", "", "block", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "(Landroidx/compose/runtime/snapshots/Snapshot;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/jvm/functions/Function2;)Landroidx/compose/runtime/snapshots/Snapshot;", "dispatchObserverOnApplied", "snapshot", "changes", "Landroidx/collection/ScatterSet;", "Landroidx/compose/runtime/snapshots/StateObject;", "dispatchObserverOnPreDispose", "mergeObservers", "a", "b", "dispatchCreatedObservers", "result", "observerMap", "", "Landroidx/compose/runtime/snapshots/tooling/SnapshotInstanceObservers;", "Lkotlin/Pair;", "observeSnapshots", "Landroidx/compose/runtime/snapshots/ObserverHandle;", "Landroidx/compose/runtime/snapshots/Snapshot$Companion;", "snapshotObserver", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotObserverKt {
    private static PersistentList<? extends SnapshotObserver> observers;

    public static final /* synthetic */ PersistentList access$getObservers$p() {
        return observers;
    }

    private static /* synthetic */ void getObservers$annotations() {
    }

    public static final ObserverHandle observeSnapshots(Snapshot.Companion $this$observeSnapshots, final SnapshotObserver snapshotObserver) {
        Object lock$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv) {
            PersistentList<? extends SnapshotObserver> persistentList = observers;
            if (persistentList == null) {
                persistentList = ExtensionsKt.persistentListOf();
            }
            observers = persistentList.add((PersistentList<? extends SnapshotObserver>) snapshotObserver);
            Unit unit = Unit.INSTANCE;
        }
        return new ObserverHandle() { // from class: androidx.compose.runtime.snapshots.tooling.SnapshotObserverKt$$ExternalSyntheticLambda0
            @Override // androidx.compose.runtime.snapshots.ObserverHandle
            public final void dispose() {
                SnapshotObserverKt.observeSnapshots$lambda$3(SnapshotObserver.this);
            }
        };
    }

    public static final void observeSnapshots$lambda$3(SnapshotObserver $snapshotObserver) {
        Object lock$iv$iv = SnapshotKt.getLock();
        synchronized (lock$iv$iv) {
            PersistentList<? extends SnapshotObserver> persistentList = observers;
            PersistentList persistentList2 = null;
            PersistentList newObservers = persistentList != null ? persistentList.remove((PersistentList<? extends SnapshotObserver>) $snapshotObserver) : null;
            if (newObservers != null) {
                PersistentList it = newObservers;
                if (!it.isEmpty()) {
                    persistentList2 = newObservers;
                }
            }
            observers = persistentList2;
            Unit unit = Unit.INSTANCE;
        }
    }

    public static final <R extends Snapshot> R creatingSnapshot(Snapshot parent, Function1<Object, Unit> function1, Function1<Object, Unit> function12, boolean readonly, Function2<? super Function1<Object, Unit>, ? super Function1<Object, Unit>, ? extends R> function2) {
        Map observerMap = null;
        PersistentList observers2 = observers;
        Function1 actualReadObserver = function1;
        Function1 actualWriteObserver = function12;
        if (observers2 != null) {
            Pair result = mergeObservers(observers2, parent, readonly, function1, function12);
            SnapshotInstanceObservers mappedObservers = result.getFirst();
            actualReadObserver = mappedObservers.getReadObserver();
            actualWriteObserver = mappedObservers.getWriteObserver();
            Map observerMap2 = result.getSecond();
            observerMap = observerMap2;
        }
        R invoke = function2.invoke(actualReadObserver, actualWriteObserver);
        if (observers2 != null) {
            dispatchCreatedObservers(observers2, parent, invoke, observerMap);
        }
        return invoke;
    }

    public static final Pair<SnapshotInstanceObservers, Map<SnapshotObserver, SnapshotInstanceObservers>> mergeObservers(PersistentList<? extends SnapshotObserver> persistentList, Snapshot parent, boolean readonly, Function1<Object, Unit> function1, Function1<Object, Unit> function12) {
        Map map;
        Function1<Object, Unit> function13 = function1;
        Function1<Object, Unit> function14 = function12;
        Map map2 = null;
        PersistentList<? extends SnapshotObserver> $this$fastForEach$iv = persistentList;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            SnapshotObserver observer = (SnapshotObserver) item$iv;
            SnapshotInstanceObservers instance = observer.onPreCreate(parent, readonly);
            if (instance != null) {
                function13 = mergeObservers(instance.getReadObserver(), function13);
                function14 = mergeObservers(instance.getWriteObserver(), function14);
                if (map2 != null) {
                    map = map2;
                } else {
                    Map newMap = new LinkedHashMap();
                    map2 = newMap;
                    map = map2;
                }
                map2.put(observer, instance);
                map2 = map;
            }
        }
        return TuplesKt.to(new SnapshotInstanceObservers(function13, function14), map2);
    }

    private static final Function1<Object, Unit> mergeObservers(final Function1<Object, Unit> function1, final Function1<Object, Unit> function12) {
        if (function1 == null || function12 == null) {
            return function1 == null ? function12 : function1;
        }
        return new Function1<Object, Unit>() { // from class: androidx.compose.runtime.snapshots.tooling.SnapshotObserverKt$mergeObservers$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
                invoke2(p1);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Object it) {
                function1.invoke(it);
                function12.invoke(it);
            }
        };
    }

    public static final void dispatchCreatedObservers(PersistentList<? extends SnapshotObserver> persistentList, Snapshot parent, Snapshot result, Map<SnapshotObserver, SnapshotInstanceObservers> map) {
        PersistentList<? extends SnapshotObserver> $this$fastForEach$iv = persistentList;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            SnapshotObserver observer = (SnapshotObserver) item$iv;
            SnapshotInstanceObservers instance = map != null ? map.get(observer) : null;
            observer.onCreated(result, parent, instance);
        }
    }

    public static final void dispatchObserverOnPreDispose(Snapshot snapshot) {
        List list = observers;
        if (list == null) {
            return;
        }
        List $this$fastForEach$iv = list;
        int size = $this$fastForEach$iv.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            SnapshotObserver observer = (SnapshotObserver) item$iv;
            observer.onPreDispose(snapshot);
        }
    }

    public static final void dispatchObserverOnApplied(Snapshot snapshot, ScatterSet<StateObject> scatterSet) {
        Set wrappedChanges;
        List observers2 = observers;
        List list = observers2;
        if (!(list == null || list.isEmpty())) {
            if (scatterSet == null || (wrappedChanges = ScatterSetWrapperKt.wrapIntoSet(scatterSet)) == null) {
                wrappedChanges = SetsKt.emptySet();
            }
            List $this$fastForEach$iv = observers2;
            int size = $this$fastForEach$iv.size();
            for (int index$iv = 0; index$iv < size; index$iv++) {
                Object item$iv = $this$fastForEach$iv.get(index$iv);
                SnapshotObserver observer = (SnapshotObserver) item$iv;
                observer.onApplied(snapshot, wrappedChanges);
            }
        }
    }
}
