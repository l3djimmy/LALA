package androidx.compose.runtime.snapshots;

import androidx.autofill.HintConstants;
import androidx.camera.view.PreviewView$1$$ExternalSyntheticBackportWithForwarding0;
import androidx.collection.MutableObjectIntMap;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ObjectIntMap;
import androidx.collection.ScatterMap;
import androidx.collection.ScatterSet;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DerivedState;
import androidx.compose.runtime.DerivedStateObserver;
import androidx.compose.runtime.PreconditionsKt;
import androidx.compose.runtime.SnapshotMutationPolicy;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.collection.ScatterSetWrapper;
import androidx.compose.runtime.collection.ScopeMap;
import androidx.compose.runtime.internal.Thread_jvmKt;
import androidx.compose.runtime.snapshots.ReaderKind;
import androidx.compose.runtime.snapshots.SnapshotStateObserver;
import androidx.exifinterface.media.ExifInterface;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Deprecated;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
/* compiled from: SnapshotStateObserver.kt */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0010\u0001\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001:\u00018B.\u0012'\u0010\u0002\u001a#\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\f\b\u0006\u0012\b\b\u0007\u0012\u0004\b\b(\b\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0002\u0010\tJ\u0016\u0010\u001e\u001a\u00020\u00052\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020\u00010\fH\u0002J\u0006\u0010 \u001a\u00020\u0005J\u000e\u0010 \u001a\u00020\u00052\u0006\u0010!\u001a\u00020\u0001J)\u0010\"\u001a\u00020\u00052!\u0010#\u001a\u001d\u0012\u0013\u0012\u00110\u0001¢\u0006\f\b\u0006\u0012\b\b\u0007\u0012\u0004\b\b(!\u0012\u0004\u0012\u00020\u00150\u0003J\b\u0010$\u001a\u00020\u0015H\u0002J&\u0010%\u001a\u00020\u0011\"\b\b\u0000\u0010&*\u00020\u00012\u0012\u0010'\u001a\u000e\u0012\u0004\u0012\u0002H&\u0012\u0004\u0012\u00020\u00050\u0003H\u0002J\u001d\u0010(\u001a\u00020\u00052\u0012\u0010)\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00050\u0003H\u0082\bJ\u001e\u0010*\u001a\u00020\u00052\f\u0010+\u001a\b\u0012\u0004\u0012\u00020\u00010\f2\u0006\u0010,\u001a\u00020\rH\u0007J?\u0010-\u001a\u00020\u0005\"\b\b\u0000\u0010&*\u00020\u00012\u0006\u0010!\u001a\u0002H&2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u0002H&\u0012\u0004\u0012\u00020\u00050\u00032\f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0002\u0010/J\u0010\u00100\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\fH\u0002J\u001d\u00101\u001a\u00020\u00052\u0012\u0010)\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00150\u0003H\u0082\bJ\b\u00102\u001a\u000203H\u0002J\b\u00104\u001a\u00020\u0005H\u0002J\u0006\u00105\u001a\u00020\u0005J\u0006\u00106\u001a\u00020\u0005J\u0016\u00107\u001a\u00020\u00052\f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007R&\u0010\n\u001a\u001a\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\f\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00050\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00110\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R/\u0010\u0002\u001a#\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\f\b\u0006\u0012\b\b\u0007\u0012\u0004\b\b(\b\u0012\u0004\u0012\u00020\u00050\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\"\u0010\u0019\u001a\u0016\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u001aj\n\u0012\u0006\u0012\u0004\u0018\u00010\u0001`\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u001c\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00050\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000¨\u00069"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotStateObserver;", "", "onChangedExecutor", "Lkotlin/Function1;", "Lkotlin/Function0;", "", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "callback", "(Lkotlin/jvm/functions/Function1;)V", "applyObserver", "Lkotlin/Function2;", "", "Landroidx/compose/runtime/snapshots/Snapshot;", "applyUnsubscribe", "Landroidx/compose/runtime/snapshots/ObserverHandle;", "currentMap", "Landroidx/compose/runtime/snapshots/SnapshotStateObserver$ObservedScopeMap;", "currentMapThreadId", "", "isPaused", "", "observedScopeMaps", "Landroidx/compose/runtime/collection/MutableVector;", "observedScopeMapsLock", "pendingChanges", "Ljava/util/concurrent/atomic/AtomicReference;", "Landroidx/compose/runtime/internal/AtomicReference;", "readObserver", "sendingNotifications", "addChanges", "set", "clear", "scope", "clearIf", "predicate", "drainChanges", "ensureMap", ExifInterface.GPS_DIRECTION_TRUE, "onChanged", "forEachScopeMap", "block", "notifyChanges", "changes", "snapshot", "observeReads", "onValueChangedForScope", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V", "removeChanges", "removeScopeMapIf", "report", "", "sendNotifications", "start", "stop", "withNoObservations", "ObservedScopeMap", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class SnapshotStateObserver {
    public static final int $stable = 8;
    private ObserverHandle applyUnsubscribe;
    private ObservedScopeMap currentMap;
    private boolean isPaused;
    private final Function1<Function0<Unit>, Unit> onChangedExecutor;
    private boolean sendingNotifications;
    private final AtomicReference<Object> pendingChanges = new AtomicReference<>(null);
    private final Function2<Set<? extends Object>, Snapshot, Unit> applyObserver = new Function2<Set<? extends Object>, Snapshot, Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotStateObserver$applyObserver$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(2);
        }

        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Unit invoke(Set<? extends Object> set, Snapshot snapshot) {
            invoke2(set, snapshot);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(Set<? extends Object> set, Snapshot snapshot) {
            boolean drainChanges;
            SnapshotStateObserver.this.addChanges(set);
            drainChanges = SnapshotStateObserver.this.drainChanges();
            if (drainChanges) {
                SnapshotStateObserver.this.sendNotifications();
            }
        }
    };
    private final Function1<Object, Unit> readObserver = new Function1<Object, Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotStateObserver$readObserver$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(Object p1) {
            invoke2(p1);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(Object state) {
            boolean z;
            Object lock$iv;
            SnapshotStateObserver.ObservedScopeMap observedScopeMap;
            z = SnapshotStateObserver.this.isPaused;
            if (!z) {
                lock$iv = SnapshotStateObserver.this.observedScopeMapsLock;
                SnapshotStateObserver snapshotStateObserver = SnapshotStateObserver.this;
                synchronized (lock$iv) {
                    observedScopeMap = snapshotStateObserver.currentMap;
                    Intrinsics.checkNotNull(observedScopeMap);
                    observedScopeMap.recordRead(state);
                    Unit unit = Unit.INSTANCE;
                }
            }
        }
    };
    private final MutableVector<ObservedScopeMap> observedScopeMaps = new MutableVector<>(new ObservedScopeMap[16], 0);
    private final Object observedScopeMapsLock = new Object();
    private long currentMapThreadId = -1;

    /* JADX WARN: Multi-variable type inference failed */
    public SnapshotStateObserver(Function1<? super Function0<Unit>, Unit> function1) {
        this.onChangedExecutor = function1;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean drainChanges() {
        boolean z;
        boolean z2;
        Object lock$iv = this.observedScopeMapsLock;
        synchronized (lock$iv) {
            z = this.sendingNotifications;
        }
        if (z) {
            return false;
        }
        boolean hasValues = false;
        while (true) {
            Set notifications = removeChanges();
            if (notifications == null) {
                return hasValues;
            }
            Object lock$iv$iv = this.observedScopeMapsLock;
            synchronized (lock$iv$iv) {
                MutableVector this_$iv$iv = this.observedScopeMaps;
                Object[] content$iv$iv = this_$iv$iv.content;
                int size$iv$iv = this_$iv$iv.getSize();
                for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                    ObservedScopeMap scopeMap = (ObservedScopeMap) content$iv$iv[i$iv$iv];
                    if (!scopeMap.recordInvalidation(notifications) && !hasValues) {
                        z2 = false;
                        hasValues = z2;
                    }
                    z2 = true;
                    hasValues = z2;
                }
                Unit unit = Unit.INSTANCE;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void sendNotifications() {
        this.onChangedExecutor.invoke(new Function0<Unit>() { // from class: androidx.compose.runtime.snapshots.SnapshotStateObserver$sendNotifications$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2() {
                Object lock$iv;
                boolean z;
                boolean drainChanges;
                MutableVector this_$iv;
                do {
                    lock$iv = SnapshotStateObserver.this.observedScopeMapsLock;
                    SnapshotStateObserver snapshotStateObserver = SnapshotStateObserver.this;
                    synchronized (lock$iv) {
                        z = snapshotStateObserver.sendingNotifications;
                        if (!z) {
                            snapshotStateObserver.sendingNotifications = true;
                            this_$iv = snapshotStateObserver.observedScopeMaps;
                            Object[] content$iv = this_$iv.content;
                            int size$iv = this_$iv.getSize();
                            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                                SnapshotStateObserver.ObservedScopeMap scopeMap = (SnapshotStateObserver.ObservedScopeMap) content$iv[i$iv];
                                scopeMap.notifyInvalidatedScopes();
                            }
                            snapshotStateObserver.sendingNotifications = false;
                        }
                        Unit unit = Unit.INSTANCE;
                    }
                    drainChanges = SnapshotStateObserver.this.drainChanges();
                } while (drainChanges);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    public final void addChanges(Set<? extends Object> set) {
        Object old;
        Collection plus;
        do {
            old = this.pendingChanges.get();
            if (old == null) {
                plus = set;
            } else if (old instanceof Set) {
                plus = CollectionsKt.listOf((Object[]) new Set[]{old, set});
            } else if (!(old instanceof List)) {
                report();
                throw new KotlinNothingValueException();
            } else {
                plus = CollectionsKt.plus((Collection) old, (Iterable) CollectionsKt.listOf(set));
            }
        } while (!PreviewView$1$$ExternalSyntheticBackportWithForwarding0.m(this.pendingChanges, old, plus));
    }

    private final Set<Object> removeChanges() {
        Object old;
        Set result;
        Object obj;
        do {
            old = this.pendingChanges.get();
            Object obj2 = null;
            if (old == null) {
                return null;
            }
            if (old instanceof Set) {
                result = (Set) old;
                obj = null;
            } else if (old instanceof List) {
                result = (Set) ((List) old).get(0);
                if (((List) old).size() == 2) {
                    obj2 = ((List) old).get(1);
                } else if (((List) old).size() > 2) {
                    obj2 = ((List) old).subList(1, ((List) old).size());
                }
                obj = obj2;
            } else {
                report();
                throw new KotlinNothingValueException();
            }
        } while (!PreviewView$1$$ExternalSyntheticBackportWithForwarding0.m(this.pendingChanges, old, obj));
        return result;
    }

    private final Void report() {
        ComposerKt.composeRuntimeError("Unexpected notification");
        throw new KotlinNothingValueException();
    }

    private final void forEachScopeMap(Function1<? super ObservedScopeMap, Unit> function1) {
        Object lock$iv = this.observedScopeMapsLock;
        synchronized (lock$iv) {
            MutableVector this_$iv = this.observedScopeMaps;
            Object[] content$iv = this_$iv.content;
            int size$iv = this_$iv.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                function1.invoke(content$iv[i$iv]);
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    private final void removeScopeMapIf(Function1<? super ObservedScopeMap, Boolean> function1) {
        Object lock$iv = this.observedScopeMapsLock;
        synchronized (lock$iv) {
            MutableVector this_$iv = this.observedScopeMaps;
            int gap$iv = 0;
            int size$iv = this_$iv.getSize();
            for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                if (function1.invoke(this_$iv.content[i$iv]).booleanValue()) {
                    gap$iv++;
                } else if (gap$iv > 0) {
                    this_$iv.content[i$iv - gap$iv] = this_$iv.content[i$iv];
                }
            }
            ArraysKt.fill(this_$iv.content, (Object) null, size$iv - gap$iv, size$iv);
            this_$iv.setSize(size$iv - gap$iv);
            Unit unit = Unit.INSTANCE;
        }
    }

    public final <T> void observeReads(T t, Function1<? super T, Unit> function1, Function0<Unit> function0) {
        ObservedScopeMap scopeMap;
        Object lock$iv = this.observedScopeMapsLock;
        synchronized (lock$iv) {
            scopeMap = ensureMap(function1);
        }
        boolean oldPaused = this.isPaused;
        ObservedScopeMap oldMap = this.currentMap;
        long oldThreadId = this.currentMapThreadId;
        if (oldThreadId != -1) {
            boolean value$iv = oldThreadId == Thread_jvmKt.currentThreadId();
            if (!value$iv) {
                PreconditionsKt.throwIllegalArgumentException("Detected multithreaded access to SnapshotStateObserver: previousThreadId=" + oldThreadId + "), currentThread={id=" + Thread_jvmKt.currentThreadId() + ", name=" + Thread_jvmKt.currentThreadName() + "}. Note that observation on multiple threads in layout/draw is not supported. Make sure your measure/layout/draw for each Owner (AndroidComposeView) is executed on the same thread.");
            }
        }
        try {
            this.isPaused = false;
            this.currentMap = scopeMap;
            this.currentMapThreadId = Thread_jvmKt.currentThreadId();
            scopeMap.observe(t, this.readObserver, function0);
        } finally {
            this.currentMap = oldMap;
            this.isPaused = oldPaused;
            this.currentMapThreadId = oldThreadId;
        }
    }

    @Deprecated(message = "Replace with Snapshot.withoutReadObservation()", replaceWith = @ReplaceWith(expression = "Snapshot.withoutReadObservation(block)", imports = {"androidx.compose.runtime.snapshots.Snapshot"}))
    public final void withNoObservations(Function0<Unit> function0) {
        boolean oldPaused = this.isPaused;
        this.isPaused = true;
        try {
            function0.invoke();
        } finally {
            this.isPaused = oldPaused;
        }
    }

    public final void clear(Object scope) {
        Object lock$iv$iv = this.observedScopeMapsLock;
        synchronized (lock$iv$iv) {
            MutableVector this_$iv$iv = this.observedScopeMaps;
            int gap$iv$iv = 0;
            int size$iv$iv = this_$iv$iv.getSize();
            for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                ObservedScopeMap it = this_$iv$iv.content[i$iv$iv];
                it.clearScopeObservations(scope);
                if (!it.hasScopeObservations()) {
                    gap$iv$iv++;
                } else if (gap$iv$iv > 0) {
                    this_$iv$iv.content[i$iv$iv - gap$iv$iv] = this_$iv$iv.content[i$iv$iv];
                }
            }
            ArraysKt.fill(this_$iv$iv.content, (Object) null, size$iv$iv - gap$iv$iv, size$iv$iv);
            this_$iv$iv.setSize(size$iv$iv - gap$iv$iv);
            Unit unit = Unit.INSTANCE;
        }
    }

    public final void clearIf(Function1<Object, Boolean> function1) {
        Object lock$iv$iv = this.observedScopeMapsLock;
        synchronized (lock$iv$iv) {
            MutableVector this_$iv$iv = this.observedScopeMaps;
            int gap$iv$iv = 0;
            int size$iv$iv = this_$iv$iv.getSize();
            for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                ObservedScopeMap scopeMap = this_$iv$iv.content[i$iv$iv];
                scopeMap.removeScopeIf(function1);
                if (!scopeMap.hasScopeObservations()) {
                    gap$iv$iv++;
                } else if (gap$iv$iv > 0) {
                    this_$iv$iv.content[i$iv$iv - gap$iv$iv] = this_$iv$iv.content[i$iv$iv];
                }
            }
            ArraysKt.fill(this_$iv$iv.content, (Object) null, size$iv$iv - gap$iv$iv, size$iv$iv);
            this_$iv$iv.setSize(size$iv$iv - gap$iv$iv);
            Unit unit = Unit.INSTANCE;
        }
    }

    public final void start() {
        this.applyUnsubscribe = Snapshot.Companion.registerApplyObserver(this.applyObserver);
    }

    public final void stop() {
        ObserverHandle observerHandle = this.applyUnsubscribe;
        if (observerHandle != null) {
            observerHandle.dispose();
        }
    }

    public final void notifyChanges(Set<? extends Object> set, Snapshot snapshot) {
        this.applyObserver.invoke(set, snapshot);
    }

    public final void clear() {
        Object lock$iv$iv = this.observedScopeMapsLock;
        synchronized (lock$iv$iv) {
            MutableVector this_$iv$iv = this.observedScopeMaps;
            Object[] content$iv$iv = this_$iv$iv.content;
            int size$iv$iv = this_$iv$iv.getSize();
            for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
                ObservedScopeMap scopeMap = (ObservedScopeMap) content$iv$iv[i$iv$iv];
                scopeMap.clear();
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    private final <T> ObservedScopeMap ensureMap(Function1<? super T, Unit> function1) {
        ObservedScopeMap observedScopeMap;
        MutableVector this_$iv = this.observedScopeMaps;
        ObservedScopeMap[] observedScopeMapArr = this_$iv.content;
        int size$iv = this_$iv.getSize();
        int i$iv = 0;
        while (true) {
            if (i$iv < size$iv) {
                observedScopeMap = observedScopeMapArr[i$iv];
                ObservedScopeMap it = observedScopeMap;
                if (it.getOnChanged() == function1) {
                    break;
                }
                i$iv++;
            } else {
                observedScopeMap = null;
                break;
            }
        }
        ObservedScopeMap scopeMap = observedScopeMap;
        if (scopeMap == null) {
            Intrinsics.checkNotNull(function1, "null cannot be cast to non-null type kotlin.Function1<kotlin.Any, kotlin.Unit>");
            ObservedScopeMap map = new ObservedScopeMap((Function1) TypeIntrinsics.beforeCheckcastToFunctionOfArity(function1, 1));
            this.observedScopeMaps.add(map);
            return map;
        }
        return scopeMap;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: SnapshotStateObserver.kt */
    @Metadata(d1 = {"\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0002\u0018\u00002\u00020\u0001B\u0019\u0012\u0012\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\u0006\u0010 \u001a\u00020\u0004J\u0010\u0010!\u001a\u00020\u00042\u0006\u0010\"\u001a\u00020\u0001H\u0002J\u000e\u0010#\u001a\u00020\u00042\u0006\u0010\"\u001a\u00020\u0001J\u0006\u0010$\u001a\u00020%J\u0006\u0010&\u001a\u00020\u0004J0\u0010'\u001a\u00020\u00042\u0006\u0010\"\u001a\u00020\u00012\u0012\u0010(\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00040\u00032\f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00040*J\u0014\u0010+\u001a\u00020%2\f\u0010,\u001a\b\u0012\u0004\u0012\u00020\u00010-J\u000e\u0010.\u001a\u00020\u00042\u0006\u0010/\u001a\u00020\u0001J.\u0010.\u001a\u00020\u00042\u0006\u0010/\u001a\u00020\u00012\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0006\u001a\u00020\u00012\f\u00100\u001a\b\u0012\u0004\u0012\u00020\u00010\bH\u0002J\u0018\u00101\u001a\u00020\u00042\u0006\u0010\"\u001a\u00020\u00012\u0006\u0010/\u001a\u00020\u0001H\u0002J)\u00102\u001a\u00020\u00042!\u00103\u001a\u001d\u0012\u0013\u0012\u00110\u0001¢\u0006\f\b4\u0012\b\b5\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020%0\u0003J\u0012\u00106\u001a\u00020\u00042\n\u00107\u001a\u0006\u0012\u0002\b\u00030\rR\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0001X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0001\u0018\u00010\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R&\u0010\u000b\u001a\u0012\u0012\u0004\u0012\u00020\u0001\u0012\b\u0012\u0006\u0012\u0002\b\u00030\r0\fX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000eR\u000e\u0010\u000f\u001a\u00020\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u0010\u001a\u00020\u0011¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00010\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\u001d\u0010\u0002\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R6\u0010\u0018\u001a*\u0012\b\u0012\u0006\u0012\u0002\b\u00030\r\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0019j\u0014\u0012\b\u0012\u0006\u0012\u0002\b\u00030\r\u0012\u0006\u0012\u0004\u0018\u00010\u0001`\u001aX\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\u001b\u001a\u0014\u0012\u0004\u0012\u00020\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00010\b0\u001cX\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u001d\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\r0\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\"\u0010\u001f\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00010\fX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000e\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00068"}, d2 = {"Landroidx/compose/runtime/snapshots/SnapshotStateObserver$ObservedScopeMap;", "", "onChanged", "Lkotlin/Function1;", "", "(Lkotlin/jvm/functions/Function1;)V", "currentScope", "currentScopeReads", "Landroidx/collection/MutableObjectIntMap;", "currentToken", "", "dependencyToDerivedStates", "Landroidx/compose/runtime/collection/ScopeMap;", "Landroidx/compose/runtime/DerivedState;", "Landroidx/collection/MutableScatterMap;", "deriveStateScopeCount", "derivedStateObserver", "Landroidx/compose/runtime/DerivedStateObserver;", "getDerivedStateObserver", "()Landroidx/compose/runtime/DerivedStateObserver;", "invalidated", "Landroidx/collection/MutableScatterSet;", "getOnChanged", "()Lkotlin/jvm/functions/Function1;", "recordedDerivedStateValues", "Ljava/util/HashMap;", "Lkotlin/collections/HashMap;", "scopeToValues", "Landroidx/collection/MutableScatterMap;", "statesToReread", "Landroidx/compose/runtime/collection/MutableVector;", "valueToScopes", "clear", "clearObsoleteStateReads", "scope", "clearScopeObservations", "hasScopeObservations", "", "notifyInvalidatedScopes", "observe", "readObserver", "block", "Lkotlin/Function0;", "recordInvalidation", "changes", "", "recordRead", "value", "recordedValues", "removeObservation", "removeScopeIf", "predicate", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "rereadDerivedState", "derivedState", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class ObservedScopeMap {
        private Object currentScope;
        private MutableObjectIntMap<Object> currentScopeReads;
        private int deriveStateScopeCount;
        private final Function1<Object, Unit> onChanged;
        private int currentToken = -1;
        private final MutableScatterMap<Object, Object> valueToScopes = ScopeMap.m3831constructorimpl$default(null, 1, null);
        private final MutableScatterMap<Object, MutableObjectIntMap<Object>> scopeToValues = new MutableScatterMap<>(0, 1, null);
        private final MutableScatterSet<Object> invalidated = new MutableScatterSet<>(0, 1, null);
        private final MutableVector<DerivedState<?>> statesToReread = new MutableVector<>(new DerivedState[16], 0);
        private final DerivedStateObserver derivedStateObserver = new DerivedStateObserver() { // from class: androidx.compose.runtime.snapshots.SnapshotStateObserver$ObservedScopeMap$derivedStateObserver$1
            @Override // androidx.compose.runtime.DerivedStateObserver
            public void start(DerivedState<?> derivedState) {
                int i;
                SnapshotStateObserver.ObservedScopeMap observedScopeMap = SnapshotStateObserver.ObservedScopeMap.this;
                i = observedScopeMap.deriveStateScopeCount;
                observedScopeMap.deriveStateScopeCount = i + 1;
            }

            @Override // androidx.compose.runtime.DerivedStateObserver
            public void done(DerivedState<?> derivedState) {
                int i;
                SnapshotStateObserver.ObservedScopeMap observedScopeMap = SnapshotStateObserver.ObservedScopeMap.this;
                i = observedScopeMap.deriveStateScopeCount;
                observedScopeMap.deriveStateScopeCount = i - 1;
            }
        };
        private final MutableScatterMap<Object, Object> dependencyToDerivedStates = ScopeMap.m3831constructorimpl$default(null, 1, null);
        private final HashMap<DerivedState<?>, Object> recordedDerivedStateValues = new HashMap<>();

        public ObservedScopeMap(Function1<Object, Unit> function1) {
            this.onChanged = function1;
        }

        public final Function1<Object, Unit> getOnChanged() {
            return this.onChanged;
        }

        public final DerivedStateObserver getDerivedStateObserver() {
            return this.derivedStateObserver;
        }

        public final void recordRead(Object value) {
            Object scope = this.currentScope;
            Intrinsics.checkNotNull(scope);
            int i = this.currentToken;
            MutableObjectIntMap it = this.currentScopeReads;
            if (it == null) {
                it = new MutableObjectIntMap(0, 1, null);
                this.currentScopeReads = it;
                this.scopeToValues.set(scope, it);
                Unit unit = Unit.INSTANCE;
            }
            recordRead(value, i, scope, it);
        }

        private final void recordRead(Object value, int currentToken, Object currentScope, MutableObjectIntMap<Object> mutableObjectIntMap) {
            int i;
            int i2;
            if (this.deriveStateScopeCount > 0) {
                return;
            }
            int previousToken = mutableObjectIntMap.put(value, currentToken, -1);
            if (!(value instanceof DerivedState) || previousToken == currentToken) {
                i = 2;
            } else {
                DerivedState.Record record = ((DerivedState) value).getCurrentRecord();
                this.recordedDerivedStateValues.put(value, record.getCurrentValue());
                ObjectIntMap dependencies = record.getDependencies();
                MutableScatterMap dependencyToDerivedStates = this.dependencyToDerivedStates;
                ScopeMap.m3839removeScopeimpl(dependencyToDerivedStates, value);
                ObjectIntMap this_$iv = dependencies;
                int $i$f$forEachKey = 0;
                Object[] k$iv = this_$iv.keys;
                ObjectIntMap this_$iv$iv = this_$iv;
                long[] m$iv$iv = this_$iv$iv.metadata;
                i = 2;
                int lastIndex$iv$iv = m$iv$iv.length - 2;
                int i$iv$iv = 0;
                if (0 <= lastIndex$iv$iv) {
                    while (true) {
                        long slot$iv$iv = m$iv$iv[i$iv$iv];
                        ObjectIntMap this_$iv2 = this_$iv;
                        int $i$f$forEachKey2 = $i$f$forEachKey;
                        Object[] k$iv2 = k$iv;
                        ObjectIntMap this_$iv$iv2 = this_$iv$iv;
                        long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                        if ($this$maskEmptyOrDeleted$iv$iv$iv != -9187201950435737472L) {
                            int i3 = 8;
                            int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                            int j$iv$iv = 0;
                            while (j$iv$iv < bitCount$iv$iv) {
                                long value$iv$iv$iv = slot$iv$iv & 255;
                                if (!(value$iv$iv$iv < 128)) {
                                    i2 = i3;
                                } else {
                                    int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                                    i2 = i3;
                                    StateObject dependency = (StateObject) k$iv2[index$iv$iv];
                                    if (dependency instanceof StateObjectImpl) {
                                        ReaderKind.Companion companion = ReaderKind.Companion;
                                        ((StateObjectImpl) dependency).m3864recordReadInh_f27i8$runtime_release(ReaderKind.m3851constructorimpl(2));
                                    }
                                    ScopeMap.m3825addimpl(dependencyToDerivedStates, dependency, value);
                                }
                                slot$iv$iv >>= i2;
                                j$iv$iv++;
                                i3 = i2;
                            }
                            if (bitCount$iv$iv != i3) {
                                break;
                            }
                        }
                        if (i$iv$iv == lastIndex$iv$iv) {
                            break;
                        }
                        i$iv$iv++;
                        k$iv = k$iv2;
                        this_$iv$iv = this_$iv$iv2;
                        this_$iv = this_$iv2;
                        $i$f$forEachKey = $i$f$forEachKey2;
                    }
                }
            }
            if (previousToken == -1) {
                if (value instanceof StateObjectImpl) {
                    ReaderKind.Companion companion2 = ReaderKind.Companion;
                    ((StateObjectImpl) value).m3864recordReadInh_f27i8$runtime_release(ReaderKind.m3851constructorimpl(i));
                }
                ScopeMap.m3825addimpl(this.valueToScopes, value, currentScope);
            }
        }

        public final void observe(Object scope, Function1<Object, Unit> function1, Function0<Unit> function0) {
            Object previousScope = this.currentScope;
            MutableObjectIntMap previousReads = this.currentScopeReads;
            int previousToken = this.currentToken;
            this.currentScope = scope;
            this.currentScopeReads = this.scopeToValues.get(scope);
            if (this.currentToken == -1) {
                this.currentToken = Long.hashCode(SnapshotKt.currentSnapshot().getSnapshotId());
            }
            DerivedStateObserver observer$iv = this.derivedStateObserver;
            MutableVector observers$iv = SnapshotStateKt.derivedStateObservers();
            try {
                observers$iv.add(observer$iv);
                Snapshot.Companion.observe(function1, null, function0);
                observers$iv.removeAt(observers$iv.getSize() - 1);
                Object obj = this.currentScope;
                Intrinsics.checkNotNull(obj);
                clearObsoleteStateReads(obj);
                this.currentScope = previousScope;
                this.currentScopeReads = previousReads;
                this.currentToken = previousToken;
            } catch (Throwable th) {
                observers$iv.removeAt(observers$iv.getSize() - 1);
                throw th;
            }
        }

        private final void clearObsoleteStateReads(Object scope) {
            int currentToken;
            int $i$f$removeIf;
            int currentToken2;
            int $i$f$removeIf2;
            int i;
            int currentToken3 = this.currentToken;
            MutableObjectIntMap this_$iv = this.currentScopeReads;
            if (this_$iv == null) {
                return;
            }
            int $i$f$removeIf3 = 0;
            MutableObjectIntMap this_$iv$iv = this_$iv;
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
                    currentToken = currentToken3;
                    $i$f$removeIf = $i$f$removeIf3;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            currentToken2 = currentToken3;
                            $i$f$removeIf2 = $i$f$removeIf3;
                            i = i2;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i2;
                            Object value = this_$iv.keys[index$iv$iv];
                            $i$f$removeIf2 = $i$f$removeIf3;
                            int token = this_$iv.values[index$iv$iv];
                            boolean z = token != currentToken3;
                            boolean willRemove = z;
                            if (!willRemove) {
                                currentToken2 = currentToken3;
                            } else {
                                currentToken2 = currentToken3;
                                removeObservation(scope, value);
                            }
                            if (z) {
                                this_$iv.removeValueAt(index$iv$iv);
                            }
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        i2 = i;
                        $i$f$removeIf3 = $i$f$removeIf2;
                        currentToken3 = currentToken2;
                    }
                    currentToken = currentToken3;
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
                currentToken3 = currentToken;
            }
        }

        public final void clearScopeObservations(Object scope) {
            int i;
            MutableObjectIntMap recordedValues = this.scopeToValues.remove(scope);
            if (recordedValues == null) {
                return;
            }
            MutableObjectIntMap this_$iv = recordedValues;
            Object[] k$iv = this_$iv.keys;
            int[] v$iv = this_$iv.values;
            long[] m$iv$iv = this_$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 > lastIndex$iv$iv) {
                return;
            }
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                MutableObjectIntMap recordedValues2 = recordedValues;
                ObjectIntMap this_$iv2 = this_$iv;
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
                            Object value = k$iv[index$iv$iv];
                            int i3 = v$iv[index$iv$iv];
                            removeObservation(scope, value);
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
                recordedValues = recordedValues2;
                this_$iv = this_$iv2;
            }
        }

        public final void removeScopeIf(Function1<Object, Boolean> function1) {
            int $i$f$removeIf;
            ScatterMap this_$iv$iv;
            int $i$f$forEachIndexed;
            long[] m$iv$iv;
            int $i$f$removeIf2;
            ScatterMap this_$iv$iv2;
            int $i$f$forEachIndexed2;
            long[] m$iv$iv2;
            long $this$maskEmptyOrDeleted$iv$iv$iv;
            char c;
            int j$iv$iv;
            MutableScatterMap this_$iv = this.scopeToValues;
            int $i$f$removeIf3 = 0;
            MutableScatterMap this_$iv$iv3 = this_$iv;
            int $i$f$forEachIndexed3 = 0;
            long[] m$iv$iv3 = this_$iv$iv3.metadata;
            int lastIndex$iv$iv = m$iv$iv3.length - 2;
            int i$iv$iv = 0;
            if (0 > lastIndex$iv$iv) {
                return;
            }
            while (true) {
                long slot$iv$iv = m$iv$iv3[i$iv$iv];
                char c2 = 7;
                long $this$maskEmptyOrDeleted$iv$iv$iv2 = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv2 != -9187201950435737472L) {
                    int i = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv2 = 0;
                    while (j$iv$iv2 < bitCount$iv$iv) {
                        long value$iv$iv$iv = slot$iv$iv & 255;
                        if (!(value$iv$iv$iv < 128)) {
                            $i$f$removeIf2 = $i$f$removeIf3;
                            this_$iv$iv2 = this_$iv$iv3;
                            $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                            m$iv$iv2 = m$iv$iv3;
                            $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                            c = c2;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv2;
                            Object scope = this_$iv.keys[index$iv$iv];
                            ObjectIntMap valueSet = (MutableObjectIntMap) this_$iv.values[index$iv$iv];
                            c = c2;
                            Boolean invoke = function1.invoke(scope);
                            boolean willRemove = invoke.booleanValue();
                            if (!willRemove) {
                                $i$f$removeIf2 = $i$f$removeIf3;
                                this_$iv$iv2 = this_$iv$iv3;
                                $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                m$iv$iv2 = m$iv$iv3;
                                $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                            } else {
                                int i2 = i;
                                ObjectIntMap this_$iv2 = valueSet;
                                $i$f$removeIf2 = $i$f$removeIf3;
                                Object[] k$iv = this_$iv2.keys;
                                int[] v$iv = this_$iv2.values;
                                this_$iv$iv2 = this_$iv$iv3;
                                long[] m$iv$iv4 = this_$iv2.metadata;
                                int lastIndex$iv$iv2 = m$iv$iv4.length - 2;
                                int i$iv$iv2 = 0;
                                if (0 <= lastIndex$iv$iv2) {
                                    while (true) {
                                        long slot$iv$iv2 = m$iv$iv4[i$iv$iv2];
                                        $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                        m$iv$iv2 = m$iv$iv3;
                                        $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                                        long $this$maskEmptyOrDeleted$iv$iv$iv3 = ((~slot$iv$iv2) << c) & slot$iv$iv2 & (-9187201950435737472L);
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
                                                    Object value = k$iv[index$iv$iv2];
                                                    int i3 = v$iv[index$iv$iv2];
                                                    removeObservation(scope, value);
                                                }
                                                slot$iv$iv2 >>= i2;
                                                j$iv$iv3 = j$iv$iv + 1;
                                            }
                                            int j$iv$iv4 = i2;
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
                                        i2 = 8;
                                    }
                                } else {
                                    $i$f$forEachIndexed2 = $i$f$forEachIndexed3;
                                    m$iv$iv2 = m$iv$iv3;
                                    $this$maskEmptyOrDeleted$iv$iv$iv = slot$iv$iv;
                                }
                            }
                            if (invoke.booleanValue()) {
                                this_$iv.removeValueAt(index$iv$iv);
                            }
                        }
                        slot$iv$iv = $this$maskEmptyOrDeleted$iv$iv$iv >> 8;
                        j$iv$iv2++;
                        i = 8;
                        c2 = c;
                        $i$f$removeIf3 = $i$f$removeIf2;
                        this_$iv$iv3 = this_$iv$iv2;
                        $i$f$forEachIndexed3 = $i$f$forEachIndexed2;
                        m$iv$iv3 = m$iv$iv2;
                    }
                    $i$f$removeIf = $i$f$removeIf3;
                    this_$iv$iv = this_$iv$iv3;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    m$iv$iv = m$iv$iv3;
                    if (bitCount$iv$iv != i) {
                        return;
                    }
                } else {
                    $i$f$removeIf = $i$f$removeIf3;
                    this_$iv$iv = this_$iv$iv3;
                    $i$f$forEachIndexed = $i$f$forEachIndexed3;
                    m$iv$iv = m$iv$iv3;
                }
                if (i$iv$iv == lastIndex$iv$iv) {
                    return;
                }
                i$iv$iv++;
                $i$f$removeIf3 = $i$f$removeIf;
                this_$iv$iv3 = this_$iv$iv;
                $i$f$forEachIndexed3 = $i$f$forEachIndexed;
                m$iv$iv3 = m$iv$iv;
            }
        }

        public final boolean hasScopeObservations() {
            return this.scopeToValues.isNotEmpty();
        }

        private final void removeObservation(Object scope, Object value) {
            ScopeMap.m3838removeimpl(this.valueToScopes, value, scope);
            if ((value instanceof DerivedState) && !ScopeMap.m3832containsimpl(this.valueToScopes, value)) {
                ScopeMap.m3839removeScopeimpl(this.dependencyToDerivedStates, value);
                this.recordedDerivedStateValues.remove(value);
            }
        }

        public final void clear() {
            ScopeMap.m3829clearimpl(this.valueToScopes);
            this.scopeToValues.clear();
            ScopeMap.m3829clearimpl(this.dependencyToDerivedStates);
            this.recordedDerivedStateValues.clear();
        }

        public final boolean recordInvalidation(Set<? extends Object> set) {
            MutableScatterMap dependencyToDerivedStates;
            HashMap recordedDerivedStateValues;
            Iterable $this$forEach$iv$iv;
            boolean z;
            Iterator it;
            MutableScatterMap valueToScopes;
            int j$iv$iv$iv;
            int j$iv$iv$iv2;
            int i;
            int i2;
            Object value$iv;
            ScatterSet this_$iv$iv;
            int j$iv$iv$iv3;
            int i3;
            int i4;
            Object value$iv2;
            ScatterSet this_$iv$iv2;
            int j$iv$iv$iv4;
            ScatterSet this_$iv$iv3;
            String str;
            ScatterSet this_$iv$iv$iv;
            long[] m$iv$iv$iv;
            int lastIndex$iv$iv$iv;
            int i$iv$iv$iv;
            int j$iv$iv$iv5;
            ScatterSet this_$iv$iv4;
            String str2;
            int bitCount$iv$iv$iv;
            ScatterSet this_$iv$iv$iv2;
            long[] m$iv$iv$iv2;
            int lastIndex$iv$iv$iv2;
            int i$iv$iv$iv2;
            Object value;
            Object value2;
            int j$iv$iv$iv6;
            ScatterSet this_$iv$iv5;
            String str3;
            int bitCount$iv$iv$iv2;
            int j$iv$iv$iv7;
            int i$iv$iv$iv3;
            int j$iv$iv$iv8;
            boolean hasValues = false;
            MutableScatterMap dependencyToDerivedStates2 = this.dependencyToDerivedStates;
            HashMap recordedDerivedStateValues2 = this.recordedDerivedStateValues;
            MutableScatterMap valueToScopes2 = this.valueToScopes;
            MutableScatterSet invalidated = this.invalidated;
            Set $this$fastForEach$iv = set;
            int $i$f$fastForEach = 0;
            String str4 = "null cannot be cast to non-null type androidx.compose.runtime.DerivedState<kotlin.Any?>";
            if ($this$fastForEach$iv instanceof ScatterSetWrapper) {
                ScatterSet this_$iv$iv6 = ((ScatterSetWrapper) $this$fastForEach$iv).getSet$runtime_release();
                Object[] elements$iv$iv = this_$iv$iv6.elements;
                ScatterSet this_$iv$iv$iv3 = this_$iv$iv6;
                long[] m$iv$iv$iv3 = this_$iv$iv$iv3.metadata;
                int lastIndex$iv$iv$iv3 = m$iv$iv$iv3.length - 2;
                int i$iv$iv$iv4 = 0;
                if (0 <= lastIndex$iv$iv$iv3) {
                    while (true) {
                        long slot$iv$iv$iv = m$iv$iv$iv3[i$iv$iv$iv4];
                        Object[] elements$iv$iv2 = elements$iv$iv;
                        int i5 = 8;
                        Set $this$fastForEach$iv2 = $this$fastForEach$iv;
                        int $i$f$fastForEach2 = $i$f$fastForEach;
                        if ((((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                            int bitCount$iv$iv$iv3 = 8 - ((~(i$iv$iv$iv4 - lastIndex$iv$iv$iv3)) >>> 31);
                            int j$iv$iv$iv9 = 0;
                            while (j$iv$iv$iv9 < bitCount$iv$iv$iv3) {
                                long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                                int $i$f$isFull = value$iv$iv$iv$iv < 128 ? 1 : 0;
                                if ($i$f$isFull != 0) {
                                    int index$iv$iv$iv = (i$iv$iv$iv4 << 3) + j$iv$iv$iv9;
                                    int index$iv$iv = index$iv$iv$iv;
                                    boolean hasValues2 = hasValues;
                                    Object value3 = elements$iv$iv2[index$iv$iv];
                                    j$iv$iv$iv5 = j$iv$iv$iv9;
                                    if (value3 instanceof StateObjectImpl) {
                                        ReaderKind.Companion companion = ReaderKind.Companion;
                                        int index$iv$iv$iv2 = ReaderKind.m3851constructorimpl(2);
                                        if (!((StateObjectImpl) value3).m3863isReadInh_f27i8$runtime_release(index$iv$iv$iv2)) {
                                            this_$iv$iv4 = this_$iv$iv6;
                                            str2 = str4;
                                            bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                            this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                            m$iv$iv$iv2 = m$iv$iv$iv3;
                                            lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                            i$iv$iv$iv2 = i$iv$iv$iv4;
                                            hasValues = hasValues2;
                                        }
                                    }
                                    if (ScopeMap.m3832containsimpl(dependencyToDerivedStates2, value3)) {
                                        Object value$iv3 = dependencyToDerivedStates2.get(value3);
                                        if (value$iv3 == null) {
                                            this_$iv$iv4 = this_$iv$iv6;
                                            str2 = str4;
                                            bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                            this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                            m$iv$iv$iv2 = m$iv$iv$iv3;
                                            lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                            i$iv$iv$iv2 = i$iv$iv$iv4;
                                        } else if (value$iv3 instanceof MutableScatterSet) {
                                            ScatterSet this_$iv$iv7 = (MutableScatterSet) value$iv3;
                                            Object[] elements$iv$iv3 = this_$iv$iv7.elements;
                                            long[] m$iv$iv$iv4 = this_$iv$iv7.metadata;
                                            int lastIndex$iv$iv$iv4 = m$iv$iv$iv4.length - 2;
                                            int i$iv$iv$iv5 = 0;
                                            if (0 <= lastIndex$iv$iv$iv4) {
                                                while (true) {
                                                    long slot$iv$iv$iv2 = m$iv$iv$iv4[i$iv$iv$iv5];
                                                    int index$iv$iv2 = index$iv$iv;
                                                    this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                                    m$iv$iv$iv2 = m$iv$iv$iv3;
                                                    lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                                    long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv2) << 7) & slot$iv$iv$iv2 & (-9187201950435737472L);
                                                    if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                                                        int bitCount$iv$iv$iv4 = 8 - ((~(i$iv$iv$iv5 - lastIndex$iv$iv$iv4)) >>> 31);
                                                        int j$iv$iv$iv10 = 0;
                                                        while (j$iv$iv$iv10 < bitCount$iv$iv$iv4) {
                                                            long value$iv$iv$iv$iv2 = slot$iv$iv$iv2 & 255;
                                                            if (value$iv$iv$iv$iv2 < 128) {
                                                                int index$iv$iv$iv3 = (i$iv$iv$iv5 << 3) + j$iv$iv$iv10;
                                                                this_$iv$iv5 = this_$iv$iv6;
                                                                DerivedState derivedState = (DerivedState) elements$iv$iv3[index$iv$iv$iv3];
                                                                Intrinsics.checkNotNull(derivedState, str4);
                                                                j$iv$iv$iv7 = j$iv$iv$iv10;
                                                                Object previousValue = recordedDerivedStateValues2.get(derivedState);
                                                                SnapshotMutationPolicy policy = derivedState.getPolicy();
                                                                if (policy == null) {
                                                                    policy = SnapshotStateKt.structuralEqualityPolicy();
                                                                }
                                                                SnapshotMutationPolicy policy2 = policy;
                                                                if (policy2.equivalent(derivedState.getCurrentRecord().getCurrentValue(), previousValue)) {
                                                                    str3 = str4;
                                                                    bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                    i$iv$iv$iv3 = i$iv$iv$iv4;
                                                                    this.statesToReread.add(derivedState);
                                                                } else {
                                                                    Object value$iv4 = valueToScopes2.get(derivedState);
                                                                    if (value$iv4 == null) {
                                                                        str3 = str4;
                                                                        bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                        i$iv$iv$iv3 = i$iv$iv$iv4;
                                                                    } else if (value$iv4 instanceof MutableScatterSet) {
                                                                        ScatterSet this_$iv$iv8 = (MutableScatterSet) value$iv4;
                                                                        Object[] elements$iv$iv4 = this_$iv$iv8.elements;
                                                                        long[] m$iv$iv$iv5 = this_$iv$iv8.metadata;
                                                                        int lastIndex$iv$iv$iv5 = m$iv$iv$iv5.length - 2;
                                                                        int i$iv$iv$iv6 = 0;
                                                                        if (0 <= lastIndex$iv$iv$iv5) {
                                                                            while (true) {
                                                                                long slot$iv$iv$iv3 = m$iv$iv$iv5[i$iv$iv$iv6];
                                                                                SnapshotMutationPolicy policy3 = policy2;
                                                                                i$iv$iv$iv3 = i$iv$iv$iv4;
                                                                                str3 = str4;
                                                                                bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                                if ((((~slot$iv$iv$iv3) << 7) & slot$iv$iv$iv3 & (-9187201950435737472L)) != -9187201950435737472L) {
                                                                                    int bitCount$iv$iv$iv5 = 8 - ((~(i$iv$iv$iv6 - lastIndex$iv$iv$iv5)) >>> 31);
                                                                                    int j$iv$iv$iv11 = 0;
                                                                                    while (j$iv$iv$iv11 < bitCount$iv$iv$iv5) {
                                                                                        long value$iv$iv$iv$iv3 = slot$iv$iv$iv3 & 255;
                                                                                        if (value$iv$iv$iv$iv3 < 128) {
                                                                                            int index$iv$iv$iv4 = (i$iv$iv$iv6 << 3) + j$iv$iv$iv11;
                                                                                            j$iv$iv$iv8 = j$iv$iv$iv11;
                                                                                            Object scope = elements$iv$iv4[index$iv$iv$iv4];
                                                                                            invalidated.add(scope);
                                                                                            hasValues2 = true;
                                                                                        } else {
                                                                                            j$iv$iv$iv8 = j$iv$iv$iv11;
                                                                                        }
                                                                                        slot$iv$iv$iv3 >>= i5;
                                                                                        j$iv$iv$iv11 = j$iv$iv$iv8 + 1;
                                                                                    }
                                                                                    int j$iv$iv$iv12 = i5;
                                                                                    if (bitCount$iv$iv$iv5 != j$iv$iv$iv12) {
                                                                                        break;
                                                                                    }
                                                                                }
                                                                                if (i$iv$iv$iv6 != lastIndex$iv$iv$iv5) {
                                                                                    i$iv$iv$iv6++;
                                                                                    str4 = str3;
                                                                                    bitCount$iv$iv$iv3 = bitCount$iv$iv$iv2;
                                                                                    i$iv$iv$iv4 = i$iv$iv$iv3;
                                                                                    policy2 = policy3;
                                                                                    i5 = 8;
                                                                                }
                                                                            }
                                                                        } else {
                                                                            str3 = str4;
                                                                            bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                            i$iv$iv$iv3 = i$iv$iv$iv4;
                                                                        }
                                                                    } else {
                                                                        str3 = str4;
                                                                        bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                        i$iv$iv$iv3 = i$iv$iv$iv4;
                                                                        invalidated.add(value$iv4);
                                                                        hasValues2 = true;
                                                                    }
                                                                }
                                                            } else {
                                                                this_$iv$iv5 = this_$iv$iv6;
                                                                str3 = str4;
                                                                bitCount$iv$iv$iv2 = bitCount$iv$iv$iv3;
                                                                j$iv$iv$iv7 = j$iv$iv$iv10;
                                                                i$iv$iv$iv3 = i$iv$iv$iv4;
                                                            }
                                                            slot$iv$iv$iv2 >>= 8;
                                                            j$iv$iv$iv10 = j$iv$iv$iv7 + 1;
                                                            i5 = 8;
                                                            this_$iv$iv6 = this_$iv$iv5;
                                                            str4 = str3;
                                                            bitCount$iv$iv$iv3 = bitCount$iv$iv$iv2;
                                                            i$iv$iv$iv4 = i$iv$iv$iv3;
                                                        }
                                                        this_$iv$iv4 = this_$iv$iv6;
                                                        str2 = str4;
                                                        bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                                        i$iv$iv$iv2 = i$iv$iv$iv4;
                                                        if (bitCount$iv$iv$iv4 != i5) {
                                                            break;
                                                        }
                                                    } else {
                                                        this_$iv$iv4 = this_$iv$iv6;
                                                        str2 = str4;
                                                        bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                                        i$iv$iv$iv2 = i$iv$iv$iv4;
                                                    }
                                                    if (i$iv$iv$iv5 == lastIndex$iv$iv$iv4) {
                                                        break;
                                                    }
                                                    i$iv$iv$iv5++;
                                                    m$iv$iv$iv3 = m$iv$iv$iv2;
                                                    lastIndex$iv$iv$iv3 = lastIndex$iv$iv$iv2;
                                                    this_$iv$iv$iv3 = this_$iv$iv$iv2;
                                                    index$iv$iv = index$iv$iv2;
                                                    this_$iv$iv6 = this_$iv$iv4;
                                                    str4 = str2;
                                                    bitCount$iv$iv$iv3 = bitCount$iv$iv$iv;
                                                    i$iv$iv$iv4 = i$iv$iv$iv2;
                                                    i5 = 8;
                                                }
                                            } else {
                                                this_$iv$iv4 = this_$iv$iv6;
                                                str2 = str4;
                                                bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                                this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                                m$iv$iv$iv2 = m$iv$iv$iv3;
                                                lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                                i$iv$iv$iv2 = i$iv$iv$iv4;
                                            }
                                        } else {
                                            this_$iv$iv4 = this_$iv$iv6;
                                            str2 = str4;
                                            bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                            this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                            m$iv$iv$iv2 = m$iv$iv$iv3;
                                            lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                            i$iv$iv$iv2 = i$iv$iv$iv4;
                                            DerivedState derivedState2 = (DerivedState) value$iv3;
                                            Object previousValue2 = recordedDerivedStateValues2.get(derivedState2);
                                            SnapshotMutationPolicy policy4 = derivedState2.getPolicy();
                                            if (policy4 == null) {
                                                policy4 = SnapshotStateKt.structuralEqualityPolicy();
                                            }
                                            if (policy4.equivalent(derivedState2.getCurrentRecord().getCurrentValue(), previousValue2)) {
                                                this.statesToReread.add(derivedState2);
                                            } else {
                                                int i6 = 0;
                                                Object value$iv5 = valueToScopes2.get(derivedState2);
                                                if (value$iv5 != null) {
                                                    if (value$iv5 instanceof MutableScatterSet) {
                                                        ScatterSet this_$iv$iv9 = (MutableScatterSet) value$iv5;
                                                        Object[] elements$iv$iv5 = this_$iv$iv9.elements;
                                                        long[] m$iv$iv$iv6 = this_$iv$iv9.metadata;
                                                        int lastIndex$iv$iv$iv6 = m$iv$iv$iv6.length - 2;
                                                        int i$iv$iv$iv7 = 0;
                                                        if (0 <= lastIndex$iv$iv$iv6) {
                                                            while (true) {
                                                                long slot$iv$iv$iv4 = m$iv$iv$iv6[i$iv$iv$iv7];
                                                                SnapshotMutationPolicy policy5 = policy4;
                                                                int i7 = i6;
                                                                Object value$iv6 = value$iv5;
                                                                ScatterSet this_$iv$iv10 = this_$iv$iv9;
                                                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv2 = ((~slot$iv$iv$iv4) << 7) & slot$iv$iv$iv4 & (-9187201950435737472L);
                                                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv2 != -9187201950435737472L) {
                                                                    int bitCount$iv$iv$iv6 = 8 - ((~(i$iv$iv$iv7 - lastIndex$iv$iv$iv6)) >>> 31);
                                                                    int j$iv$iv$iv13 = 0;
                                                                    while (j$iv$iv$iv13 < bitCount$iv$iv$iv6) {
                                                                        long value$iv$iv$iv$iv4 = slot$iv$iv$iv4 & 255;
                                                                        if (value$iv$iv$iv$iv4 < 128) {
                                                                            int index$iv$iv$iv5 = (i$iv$iv$iv7 << 3) + j$iv$iv$iv13;
                                                                            j$iv$iv$iv6 = j$iv$iv$iv13;
                                                                            Object scope2 = elements$iv$iv5[index$iv$iv$iv5];
                                                                            invalidated.add(scope2);
                                                                            hasValues2 = true;
                                                                        } else {
                                                                            j$iv$iv$iv6 = j$iv$iv$iv13;
                                                                        }
                                                                        slot$iv$iv$iv4 >>= 8;
                                                                        j$iv$iv$iv13 = j$iv$iv$iv6 + 1;
                                                                    }
                                                                    if (bitCount$iv$iv$iv6 != 8) {
                                                                        break;
                                                                    }
                                                                }
                                                                if (i$iv$iv$iv7 == lastIndex$iv$iv$iv6) {
                                                                    break;
                                                                }
                                                                i$iv$iv$iv7++;
                                                                value$iv5 = value$iv6;
                                                                this_$iv$iv9 = this_$iv$iv10;
                                                                policy4 = policy5;
                                                                i6 = i7;
                                                            }
                                                        }
                                                    } else {
                                                        invalidated.add(value$iv5);
                                                        hasValues2 = true;
                                                    }
                                                }
                                            }
                                        }
                                    } else {
                                        this_$iv$iv4 = this_$iv$iv6;
                                        str2 = str4;
                                        bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                        this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                        m$iv$iv$iv2 = m$iv$iv$iv3;
                                        lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                        i$iv$iv$iv2 = i$iv$iv$iv4;
                                    }
                                    int i8 = 0;
                                    Object value$iv7 = valueToScopes2.get(value3);
                                    if (value$iv7 == null) {
                                        hasValues = hasValues2;
                                    } else if (value$iv7 instanceof MutableScatterSet) {
                                        ScatterSet this_$iv$iv11 = (MutableScatterSet) value$iv7;
                                        int $i$f$forEach = 0;
                                        Object[] elements$iv$iv6 = this_$iv$iv11.elements;
                                        long[] m$iv$iv$iv7 = this_$iv$iv11.metadata;
                                        int lastIndex$iv$iv$iv7 = m$iv$iv$iv7.length - 2;
                                        int i$iv$iv$iv8 = 0;
                                        if (0 <= lastIndex$iv$iv$iv7) {
                                            while (true) {
                                                long slot$iv$iv$iv5 = m$iv$iv$iv7[i$iv$iv$iv8];
                                                int i9 = i8;
                                                Object value$iv8 = value$iv7;
                                                ScatterSet this_$iv$iv12 = this_$iv$iv11;
                                                int $i$f$forEach2 = $i$f$forEach;
                                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv3 = ((~slot$iv$iv$iv5) << 7) & slot$iv$iv$iv5 & (-9187201950435737472L);
                                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv3 != -9187201950435737472L) {
                                                    int bitCount$iv$iv$iv7 = 8 - ((~(i$iv$iv$iv8 - lastIndex$iv$iv$iv7)) >>> 31);
                                                    int j$iv$iv$iv14 = 0;
                                                    while (j$iv$iv$iv14 < bitCount$iv$iv$iv7) {
                                                        long value$iv$iv$iv$iv5 = slot$iv$iv$iv5 & 255;
                                                        if (value$iv$iv$iv$iv5 < 128) {
                                                            int index$iv$iv$iv6 = (i$iv$iv$iv8 << 3) + j$iv$iv$iv14;
                                                            value2 = value3;
                                                            invalidated.add(elements$iv$iv6[index$iv$iv$iv6]);
                                                            hasValues2 = true;
                                                        } else {
                                                            value2 = value3;
                                                        }
                                                        slot$iv$iv$iv5 >>= 8;
                                                        j$iv$iv$iv14++;
                                                        value3 = value2;
                                                    }
                                                    value = value3;
                                                    if (bitCount$iv$iv$iv7 != 8) {
                                                        break;
                                                    }
                                                } else {
                                                    value = value3;
                                                }
                                                if (i$iv$iv$iv8 == lastIndex$iv$iv$iv7) {
                                                    break;
                                                }
                                                i$iv$iv$iv8++;
                                                this_$iv$iv11 = this_$iv$iv12;
                                                $i$f$forEach = $i$f$forEach2;
                                                i8 = i9;
                                                value$iv7 = value$iv8;
                                                value3 = value;
                                            }
                                        }
                                        hasValues = hasValues2;
                                    } else {
                                        invalidated.add(value$iv7);
                                        hasValues = true;
                                    }
                                } else {
                                    j$iv$iv$iv5 = j$iv$iv$iv9;
                                    this_$iv$iv4 = this_$iv$iv6;
                                    str2 = str4;
                                    bitCount$iv$iv$iv = bitCount$iv$iv$iv3;
                                    this_$iv$iv$iv2 = this_$iv$iv$iv3;
                                    m$iv$iv$iv2 = m$iv$iv$iv3;
                                    lastIndex$iv$iv$iv2 = lastIndex$iv$iv$iv3;
                                    i$iv$iv$iv2 = i$iv$iv$iv4;
                                }
                                slot$iv$iv$iv >>= 8;
                                j$iv$iv$iv9 = j$iv$iv$iv5 + 1;
                                i5 = 8;
                                m$iv$iv$iv3 = m$iv$iv$iv2;
                                lastIndex$iv$iv$iv3 = lastIndex$iv$iv$iv2;
                                this_$iv$iv$iv3 = this_$iv$iv$iv2;
                                this_$iv$iv6 = this_$iv$iv4;
                                str4 = str2;
                                bitCount$iv$iv$iv3 = bitCount$iv$iv$iv;
                                i$iv$iv$iv4 = i$iv$iv$iv2;
                            }
                            this_$iv$iv3 = this_$iv$iv6;
                            str = str4;
                            this_$iv$iv$iv = this_$iv$iv$iv3;
                            m$iv$iv$iv = m$iv$iv$iv3;
                            lastIndex$iv$iv$iv = lastIndex$iv$iv$iv3;
                            i$iv$iv$iv = i$iv$iv$iv4;
                            if (bitCount$iv$iv$iv3 != i5) {
                                break;
                            }
                        } else {
                            this_$iv$iv3 = this_$iv$iv6;
                            str = str4;
                            this_$iv$iv$iv = this_$iv$iv$iv3;
                            m$iv$iv$iv = m$iv$iv$iv3;
                            lastIndex$iv$iv$iv = lastIndex$iv$iv$iv3;
                            i$iv$iv$iv = i$iv$iv$iv4;
                        }
                        lastIndex$iv$iv$iv3 = lastIndex$iv$iv$iv;
                        int i$iv$iv$iv9 = i$iv$iv$iv;
                        if (i$iv$iv$iv9 == lastIndex$iv$iv$iv3) {
                            break;
                        }
                        i$iv$iv$iv4 = i$iv$iv$iv9 + 1;
                        $this$fastForEach$iv = $this$fastForEach$iv2;
                        $i$f$fastForEach = $i$f$fastForEach2;
                        elements$iv$iv = elements$iv$iv2;
                        m$iv$iv$iv3 = m$iv$iv$iv;
                        this_$iv$iv$iv3 = this_$iv$iv$iv;
                        this_$iv$iv6 = this_$iv$iv3;
                        str4 = str;
                    }
                }
            } else {
                Set $this$forEach$iv$iv2 = $this$fastForEach$iv;
                boolean z2 = false;
                Iterator it2 = $this$forEach$iv$iv2.iterator();
                while (it2.hasNext()) {
                    Object element$iv$iv = it2.next();
                    int i10 = 0;
                    if (element$iv$iv instanceof StateObjectImpl) {
                        ReaderKind.Companion companion2 = ReaderKind.Companion;
                        if (!((StateObjectImpl) element$iv$iv).m3863isReadInh_f27i8$runtime_release(ReaderKind.m3851constructorimpl(2))) {
                            dependencyToDerivedStates = dependencyToDerivedStates2;
                            recordedDerivedStateValues = recordedDerivedStateValues2;
                            valueToScopes = valueToScopes2;
                            $this$forEach$iv$iv = $this$forEach$iv$iv2;
                            z = z2;
                            it = it2;
                            dependencyToDerivedStates2 = dependencyToDerivedStates;
                            recordedDerivedStateValues2 = recordedDerivedStateValues;
                            valueToScopes2 = valueToScopes;
                            it2 = it;
                            $this$forEach$iv$iv2 = $this$forEach$iv$iv;
                            z2 = z;
                        }
                    }
                    if (ScopeMap.m3832containsimpl(dependencyToDerivedStates2, element$iv$iv)) {
                        int i11 = 0;
                        Object value$iv9 = dependencyToDerivedStates2.get(element$iv$iv);
                        if (value$iv9 == null) {
                            dependencyToDerivedStates = dependencyToDerivedStates2;
                            recordedDerivedStateValues = recordedDerivedStateValues2;
                            $this$forEach$iv$iv = $this$forEach$iv$iv2;
                            z = z2;
                            it = it2;
                        } else if (value$iv9 instanceof MutableScatterSet) {
                            ScatterSet this_$iv$iv13 = (MutableScatterSet) value$iv9;
                            boolean hasValues3 = hasValues;
                            Object[] elements$iv$iv7 = this_$iv$iv13.elements;
                            dependencyToDerivedStates = dependencyToDerivedStates2;
                            long[] m$iv$iv$iv8 = this_$iv$iv13.metadata;
                            int lastIndex$iv$iv$iv8 = m$iv$iv$iv8.length - 2;
                            int i$iv$iv$iv10 = 0;
                            if (0 <= lastIndex$iv$iv$iv8) {
                                while (true) {
                                    long slot$iv$iv$iv6 = m$iv$iv$iv8[i$iv$iv$iv10];
                                    $this$forEach$iv$iv = $this$forEach$iv$iv2;
                                    z = z2;
                                    it = it2;
                                    Object element$iv$iv2 = element$iv$iv;
                                    long $this$maskEmptyOrDeleted$iv$iv$iv$iv4 = ((~slot$iv$iv$iv6) << 7) & slot$iv$iv$iv6 & (-9187201950435737472L);
                                    if ($this$maskEmptyOrDeleted$iv$iv$iv$iv4 != -9187201950435737472L) {
                                        int bitCount$iv$iv$iv8 = 8 - ((~(i$iv$iv$iv10 - lastIndex$iv$iv$iv8)) >>> 31);
                                        int j$iv$iv$iv15 = 0;
                                        while (j$iv$iv$iv15 < bitCount$iv$iv$iv8) {
                                            long value$iv$iv$iv$iv6 = slot$iv$iv$iv6 & 255;
                                            if (value$iv$iv$iv$iv6 < 128) {
                                                int index$iv$iv$iv7 = (i$iv$iv$iv10 << 3) + j$iv$iv$iv15;
                                                j$iv$iv$iv3 = j$iv$iv$iv15;
                                                DerivedState derivedState3 = (DerivedState) elements$iv$iv7[index$iv$iv$iv7];
                                                Intrinsics.checkNotNull(derivedState3, "null cannot be cast to non-null type androidx.compose.runtime.DerivedState<kotlin.Any?>");
                                                Object previousValue3 = recordedDerivedStateValues2.get(derivedState3);
                                                SnapshotMutationPolicy policy6 = derivedState3.getPolicy();
                                                if (policy6 == null) {
                                                    policy6 = SnapshotStateKt.structuralEqualityPolicy();
                                                }
                                                SnapshotMutationPolicy policy7 = policy6;
                                                i3 = i10;
                                                SnapshotMutationPolicy policy8 = policy7;
                                                if (policy8.equivalent(derivedState3.getCurrentRecord().getCurrentValue(), previousValue3)) {
                                                    i4 = i11;
                                                    value$iv2 = value$iv9;
                                                    this_$iv$iv2 = this_$iv$iv13;
                                                    this.statesToReread.add(derivedState3);
                                                } else {
                                                    Object value$iv10 = valueToScopes2.get(derivedState3);
                                                    if (value$iv10 == null) {
                                                        i4 = i11;
                                                        value$iv2 = value$iv9;
                                                        this_$iv$iv2 = this_$iv$iv13;
                                                    } else if (value$iv10 instanceof MutableScatterSet) {
                                                        ScatterSet this_$iv$iv14 = (MutableScatterSet) value$iv10;
                                                        Object[] elements$iv$iv8 = this_$iv$iv14.elements;
                                                        long[] m$iv$iv$iv9 = this_$iv$iv14.metadata;
                                                        int lastIndex$iv$iv$iv9 = m$iv$iv$iv9.length - 2;
                                                        int i$iv$iv$iv11 = 0;
                                                        if (0 <= lastIndex$iv$iv$iv9) {
                                                            while (true) {
                                                                long slot$iv$iv$iv7 = m$iv$iv$iv9[i$iv$iv$iv11];
                                                                SnapshotMutationPolicy policy9 = policy8;
                                                                i4 = i11;
                                                                value$iv2 = value$iv9;
                                                                this_$iv$iv2 = this_$iv$iv13;
                                                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv5 = ((~slot$iv$iv$iv7) << 7) & slot$iv$iv$iv7 & (-9187201950435737472L);
                                                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv5 != -9187201950435737472L) {
                                                                    int bitCount$iv$iv$iv9 = 8 - ((~(i$iv$iv$iv11 - lastIndex$iv$iv$iv9)) >>> 31);
                                                                    int j$iv$iv$iv16 = 0;
                                                                    while (j$iv$iv$iv16 < bitCount$iv$iv$iv9) {
                                                                        long value$iv$iv$iv$iv7 = slot$iv$iv$iv7 & 255;
                                                                        if (value$iv$iv$iv$iv7 < 128) {
                                                                            int index$iv$iv$iv8 = (i$iv$iv$iv11 << 3) + j$iv$iv$iv16;
                                                                            j$iv$iv$iv4 = j$iv$iv$iv16;
                                                                            Object scope3 = elements$iv$iv8[index$iv$iv$iv8];
                                                                            invalidated.add(scope3);
                                                                            hasValues3 = true;
                                                                        } else {
                                                                            j$iv$iv$iv4 = j$iv$iv$iv16;
                                                                        }
                                                                        slot$iv$iv$iv7 >>= 8;
                                                                        j$iv$iv$iv16 = j$iv$iv$iv4 + 1;
                                                                    }
                                                                    if (bitCount$iv$iv$iv9 != 8) {
                                                                        break;
                                                                    }
                                                                }
                                                                if (i$iv$iv$iv11 != lastIndex$iv$iv$iv9) {
                                                                    i$iv$iv$iv11++;
                                                                    value$iv9 = value$iv2;
                                                                    this_$iv$iv13 = this_$iv$iv2;
                                                                    i11 = i4;
                                                                    policy8 = policy9;
                                                                }
                                                            }
                                                        } else {
                                                            i4 = i11;
                                                            value$iv2 = value$iv9;
                                                            this_$iv$iv2 = this_$iv$iv13;
                                                        }
                                                    } else {
                                                        i4 = i11;
                                                        value$iv2 = value$iv9;
                                                        this_$iv$iv2 = this_$iv$iv13;
                                                        invalidated.add(value$iv10);
                                                        hasValues3 = true;
                                                    }
                                                }
                                            } else {
                                                j$iv$iv$iv3 = j$iv$iv$iv15;
                                                i3 = i10;
                                                i4 = i11;
                                                value$iv2 = value$iv9;
                                                this_$iv$iv2 = this_$iv$iv13;
                                            }
                                            slot$iv$iv$iv6 >>= 8;
                                            j$iv$iv$iv15 = j$iv$iv$iv3 + 1;
                                            i10 = i3;
                                            value$iv9 = value$iv2;
                                            this_$iv$iv13 = this_$iv$iv2;
                                            i11 = i4;
                                        }
                                        i = i10;
                                        i2 = i11;
                                        value$iv = value$iv9;
                                        this_$iv$iv = this_$iv$iv13;
                                        if (bitCount$iv$iv$iv8 != 8) {
                                            break;
                                        }
                                    } else {
                                        i = i10;
                                        i2 = i11;
                                        value$iv = value$iv9;
                                        this_$iv$iv = this_$iv$iv13;
                                    }
                                    if (i$iv$iv$iv10 == lastIndex$iv$iv$iv8) {
                                        break;
                                    }
                                    i$iv$iv$iv10++;
                                    it2 = it;
                                    element$iv$iv = element$iv$iv2;
                                    $this$forEach$iv$iv2 = $this$forEach$iv$iv;
                                    z2 = z;
                                    i10 = i;
                                    value$iv9 = value$iv;
                                    this_$iv$iv13 = this_$iv$iv;
                                    i11 = i2;
                                }
                            } else {
                                $this$forEach$iv$iv = $this$forEach$iv$iv2;
                                z = z2;
                                it = it2;
                            }
                            recordedDerivedStateValues = recordedDerivedStateValues2;
                            hasValues = hasValues3;
                        } else {
                            boolean hasValues4 = hasValues;
                            dependencyToDerivedStates = dependencyToDerivedStates2;
                            $this$forEach$iv$iv = $this$forEach$iv$iv2;
                            z = z2;
                            it = it2;
                            DerivedState derivedState4 = (DerivedState) value$iv9;
                            Object previousValue4 = recordedDerivedStateValues2.get(derivedState4);
                            SnapshotMutationPolicy policy10 = derivedState4.getPolicy();
                            if (policy10 == null) {
                                policy10 = SnapshotStateKt.structuralEqualityPolicy();
                            }
                            if (policy10.equivalent(derivedState4.getCurrentRecord().getCurrentValue(), previousValue4)) {
                                recordedDerivedStateValues = recordedDerivedStateValues2;
                                this.statesToReread.add(derivedState4);
                            } else {
                                int i12 = 0;
                                Object value$iv11 = valueToScopes2.get(derivedState4);
                                if (value$iv11 == null) {
                                    recordedDerivedStateValues = recordedDerivedStateValues2;
                                } else if (value$iv11 instanceof MutableScatterSet) {
                                    ScatterSet this_$iv$iv15 = (MutableScatterSet) value$iv11;
                                    Object[] elements$iv$iv9 = this_$iv$iv15.elements;
                                    long[] m$iv$iv$iv10 = this_$iv$iv15.metadata;
                                    recordedDerivedStateValues = recordedDerivedStateValues2;
                                    int lastIndex$iv$iv$iv10 = m$iv$iv$iv10.length - 2;
                                    int i$iv$iv$iv12 = 0;
                                    if (0 <= lastIndex$iv$iv$iv10) {
                                        while (true) {
                                            long slot$iv$iv$iv8 = m$iv$iv$iv10[i$iv$iv$iv12];
                                            Object previousValue5 = previousValue4;
                                            SnapshotMutationPolicy policy11 = policy10;
                                            int i13 = i12;
                                            Object value$iv12 = value$iv11;
                                            long $this$maskEmptyOrDeleted$iv$iv$iv$iv6 = ((~slot$iv$iv$iv8) << 7) & slot$iv$iv$iv8 & (-9187201950435737472L);
                                            if ($this$maskEmptyOrDeleted$iv$iv$iv$iv6 != -9187201950435737472L) {
                                                int bitCount$iv$iv$iv10 = 8 - ((~(i$iv$iv$iv12 - lastIndex$iv$iv$iv10)) >>> 31);
                                                int j$iv$iv$iv17 = 0;
                                                while (j$iv$iv$iv17 < bitCount$iv$iv$iv10) {
                                                    long value$iv$iv$iv$iv8 = slot$iv$iv$iv8 & 255;
                                                    if (value$iv$iv$iv$iv8 < 128) {
                                                        int index$iv$iv$iv9 = (i$iv$iv$iv12 << 3) + j$iv$iv$iv17;
                                                        j$iv$iv$iv2 = j$iv$iv$iv17;
                                                        Object scope4 = elements$iv$iv9[index$iv$iv$iv9];
                                                        invalidated.add(scope4);
                                                        hasValues4 = true;
                                                    } else {
                                                        j$iv$iv$iv2 = j$iv$iv$iv17;
                                                    }
                                                    slot$iv$iv$iv8 >>= 8;
                                                    j$iv$iv$iv17 = j$iv$iv$iv2 + 1;
                                                }
                                                if (bitCount$iv$iv$iv10 != 8) {
                                                    break;
                                                }
                                            }
                                            if (i$iv$iv$iv12 == lastIndex$iv$iv$iv10) {
                                                break;
                                            }
                                            i$iv$iv$iv12++;
                                            previousValue4 = previousValue5;
                                            i12 = i13;
                                            value$iv11 = value$iv12;
                                            policy10 = policy11;
                                        }
                                    }
                                } else {
                                    recordedDerivedStateValues = recordedDerivedStateValues2;
                                    invalidated.add(value$iv11);
                                    hasValues4 = true;
                                }
                            }
                            hasValues = hasValues4;
                        }
                    } else {
                        dependencyToDerivedStates = dependencyToDerivedStates2;
                        recordedDerivedStateValues = recordedDerivedStateValues2;
                        $this$forEach$iv$iv = $this$forEach$iv$iv2;
                        z = z2;
                        it = it2;
                    }
                    int dependencyToDerivedStates3 = 0;
                    Object value$iv13 = valueToScopes2.get(element$iv$iv);
                    if (value$iv13 == null) {
                        valueToScopes = valueToScopes2;
                    } else if (value$iv13 instanceof MutableScatterSet) {
                        ScatterSet this_$iv$iv16 = (MutableScatterSet) value$iv13;
                        Object[] elements$iv$iv10 = this_$iv$iv16.elements;
                        long[] m$iv$iv$iv11 = this_$iv$iv16.metadata;
                        int lastIndex$iv$iv$iv11 = m$iv$iv$iv11.length - 2;
                        int i$iv$iv$iv13 = 0;
                        if (0 <= lastIndex$iv$iv$iv11) {
                            while (true) {
                                long slot$iv$iv$iv9 = m$iv$iv$iv11[i$iv$iv$iv13];
                                boolean hasValues5 = hasValues;
                                int i14 = dependencyToDerivedStates3;
                                Object value$iv14 = value$iv13;
                                valueToScopes = valueToScopes2;
                                long $this$maskEmptyOrDeleted$iv$iv$iv$iv7 = ((~slot$iv$iv$iv9) << 7) & slot$iv$iv$iv9 & (-9187201950435737472L);
                                if ($this$maskEmptyOrDeleted$iv$iv$iv$iv7 != -9187201950435737472L) {
                                    int bitCount$iv$iv$iv11 = 8 - ((~(i$iv$iv$iv13 - lastIndex$iv$iv$iv11)) >>> 31);
                                    int j$iv$iv$iv18 = 0;
                                    while (j$iv$iv$iv18 < bitCount$iv$iv$iv11) {
                                        long value$iv$iv$iv$iv9 = slot$iv$iv$iv9 & 255;
                                        if (value$iv$iv$iv$iv9 < 128) {
                                            int index$iv$iv$iv10 = (i$iv$iv$iv13 << 3) + j$iv$iv$iv18;
                                            j$iv$iv$iv = j$iv$iv$iv18;
                                            Object scope5 = elements$iv$iv10[index$iv$iv$iv10];
                                            invalidated.add(scope5);
                                            hasValues5 = true;
                                        } else {
                                            j$iv$iv$iv = j$iv$iv$iv18;
                                        }
                                        slot$iv$iv$iv9 >>= 8;
                                        j$iv$iv$iv18 = j$iv$iv$iv + 1;
                                    }
                                    if (bitCount$iv$iv$iv11 != 8) {
                                        hasValues = hasValues5;
                                        break;
                                    }
                                    hasValues = hasValues5;
                                } else {
                                    hasValues = hasValues5;
                                }
                                if (i$iv$iv$iv13 != lastIndex$iv$iv$iv11) {
                                    i$iv$iv$iv13++;
                                    dependencyToDerivedStates3 = i14;
                                    valueToScopes2 = valueToScopes;
                                    value$iv13 = value$iv14;
                                }
                            }
                        } else {
                            valueToScopes = valueToScopes2;
                        }
                    } else {
                        valueToScopes = valueToScopes2;
                        invalidated.add(value$iv13);
                        hasValues = true;
                    }
                    dependencyToDerivedStates2 = dependencyToDerivedStates;
                    recordedDerivedStateValues2 = recordedDerivedStateValues;
                    valueToScopes2 = valueToScopes;
                    it2 = it;
                    $this$forEach$iv$iv2 = $this$forEach$iv$iv;
                    z2 = z;
                }
            }
            if (this.statesToReread.getSize() != 0) {
                MutableVector this_$iv = this.statesToReread;
                Object[] content$iv = this_$iv.content;
                int size$iv = this_$iv.getSize();
                for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                    DerivedState it3 = (DerivedState) content$iv[i$iv];
                    rereadDerivedState(it3);
                }
                this.statesToReread.clear();
            }
            return hasValues;
        }

        public final void rereadDerivedState(DerivedState<?> derivedState) {
            Object value$iv;
            ScatterSet this_$iv$iv;
            int i;
            Object value$iv2;
            ScatterSet this_$iv$iv2;
            int j$iv$iv$iv;
            MutableObjectIntMap it;
            MutableScatterMap scopeToValues = this.scopeToValues;
            int token = Long.hashCode(SnapshotKt.currentSnapshot().getSnapshotId());
            MutableScatterMap arg0$iv = this.valueToScopes;
            int i2 = 0;
            Object value$iv3 = arg0$iv.get(derivedState);
            if (value$iv3 == null) {
                return;
            }
            if (!(value$iv3 instanceof MutableScatterSet)) {
                MutableObjectIntMap<Object> it2 = scopeToValues.get(value$iv3);
                if (it2 == null) {
                    it2 = new MutableObjectIntMap(0, 1, null);
                    scopeToValues.set(value$iv3, it2);
                    Unit unit = Unit.INSTANCE;
                }
                recordRead(derivedState, token, value$iv3, it2);
                return;
            }
            ScatterSet this_$iv$iv3 = (MutableScatterSet) value$iv3;
            int $i$f$forEach = 0;
            Object[] elements$iv$iv = this_$iv$iv3.elements;
            long[] m$iv$iv$iv = this_$iv$iv3.metadata;
            int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
            int i$iv$iv$iv = 0;
            if (0 > lastIndex$iv$iv$iv) {
                return;
            }
            while (true) {
                long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                int $i$f$forEach2 = $i$f$forEach;
                MutableScatterMap arg0$iv2 = arg0$iv;
                int i3 = i2;
                if ((((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i4 = 8;
                    int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                    int j$iv$iv$iv2 = 0;
                    while (j$iv$iv$iv2 < bitCount$iv$iv$iv) {
                        long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                        int $i$f$isFull = value$iv$iv$iv$iv < 128 ? 1 : 0;
                        if ($i$f$isFull != 0) {
                            int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv2;
                            i = i4;
                            Object scope = elements$iv$iv[index$iv$iv$iv];
                            MutableObjectIntMap<Object> mutableObjectIntMap = scopeToValues.get(scope);
                            if (mutableObjectIntMap == null) {
                                value$iv2 = value$iv3;
                                this_$iv$iv2 = this_$iv$iv3;
                                j$iv$iv$iv = j$iv$iv$iv2;
                                it = new MutableObjectIntMap(0, 1, null);
                                scopeToValues.set(scope, it);
                                Unit unit2 = Unit.INSTANCE;
                            } else {
                                value$iv2 = value$iv3;
                                this_$iv$iv2 = this_$iv$iv3;
                                j$iv$iv$iv = j$iv$iv$iv2;
                                it = mutableObjectIntMap;
                            }
                            recordRead(derivedState, token, scope, it);
                        } else {
                            i = i4;
                            value$iv2 = value$iv3;
                            this_$iv$iv2 = this_$iv$iv3;
                            j$iv$iv$iv = j$iv$iv$iv2;
                        }
                        slot$iv$iv$iv >>= i;
                        j$iv$iv$iv2 = j$iv$iv$iv + 1;
                        i4 = i;
                        value$iv3 = value$iv2;
                        this_$iv$iv3 = this_$iv$iv2;
                    }
                    value$iv = value$iv3;
                    this_$iv$iv = this_$iv$iv3;
                    if (bitCount$iv$iv$iv != i4) {
                        return;
                    }
                } else {
                    value$iv = value$iv3;
                    this_$iv$iv = this_$iv$iv3;
                }
                if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                    return;
                }
                i$iv$iv$iv++;
                arg0$iv = arg0$iv2;
                i2 = i3;
                $i$f$forEach = $i$f$forEach2;
                value$iv3 = value$iv;
                this_$iv$iv3 = this_$iv$iv;
            }
        }

        public final void notifyInvalidatedScopes() {
            MutableScatterSet invalidated;
            int i;
            ScatterSet invalidated2 = this.invalidated;
            ScatterSet this_$iv = invalidated2;
            Function1 block$iv = this.onChanged;
            Object[] elements$iv = this_$iv.elements;
            long[] m$iv$iv = this_$iv.metadata;
            int lastIndex$iv$iv = m$iv$iv.length - 2;
            int i$iv$iv = 0;
            if (0 <= lastIndex$iv$iv) {
                while (true) {
                    long slot$iv$iv = m$iv$iv[i$iv$iv];
                    invalidated = invalidated2;
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
                                block$iv.invoke(elements$iv[index$iv$iv]);
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
                    invalidated2 = invalidated;
                }
            } else {
                invalidated = invalidated2;
            }
            invalidated.clear();
        }
    }
}
