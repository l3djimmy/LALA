package androidx.compose.runtime.internal;

import androidx.collection.MutableIntList;
import androidx.collection.MutableScatterMap;
import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterMapKt;
import androidx.collection.ScatterSetKt;
import androidx.compose.runtime.ComposeNodeLifecycleCallback;
import androidx.compose.runtime.RecomposeScopeImpl;
import androidx.compose.runtime.RememberManager;
import androidx.compose.runtime.RememberObserver;
import androidx.compose.runtime.RememberObserverHolder;
import androidx.compose.runtime.Stack;
import androidx.compose.runtime.collection.MutableVector;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: RememberEventDispatcher.kt */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0011\b\u0000\u0018\u00002\u00020\u0001B\u0013\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J(\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u00192\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!H\u0016J\u0006\u0010$\u001a\u00020\u001dJ\u0016\u0010%\u001a\u00020\u001d2\f\u0010&\u001a\b\u0012\u0004\u0012\u00020\n0\tH\u0002J\u0006\u0010'\u001a\u00020\u001dJ\u0006\u0010(\u001a\u00020\u001dJ\u0010\u0010)\u001a\u00020\u001d2\u0006\u0010*\u001a\u00020\u0012H\u0016J(\u0010+\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\n2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!H\u0016J\u0010\u0010,\u001a\u00020\u001d2\u0006\u0010 \u001a\u00020!H\u0002J(\u0010-\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\f2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!H\u0002J(\u0010\u0017\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\u00192\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020!2\u0006\u0010#\u001a\u00020!H\u0016J\u0010\u0010.\u001a\u00020\u001d2\u0006\u0010*\u001a\u00020\u0012H\u0016J\u0010\u0010\u001a\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020\nH\u0016J\u0016\u0010/\u001a\u00020\u001d2\f\u00100\u001a\b\u0012\u0004\u0012\u00020\u001d0\u001cH\u0016J\u0010\u00101\u001a\u00020\u001d2\u0006\u0010*\u001a\u00020\u0012H\u0016R\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\f0\tX\u0082\u0004¢\u0006\u0002\n\u0000R$\u0010\r\u001a\u0010\u0012\n\u0012\b\u0012\u0004\u0012\u00020\n0\t\u0018\u00010\u000eX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u000fR\u001c\u0010\u0010\u001a\u0010\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u0013\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\f0\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\u0019\u0018\u00010\u0018X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\n0\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u001b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u001d0\u001c0\tX\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00062"}, d2 = {"Landroidx/compose/runtime/internal/RememberEventDispatcher;", "Landroidx/compose/runtime/RememberManager;", "abandoning", "", "Landroidx/compose/runtime/RememberObserver;", "(Ljava/util/Set;)V", "afters", "Landroidx/collection/MutableIntList;", "currentRememberingList", "Landroidx/compose/runtime/collection/MutableVector;", "Landroidx/compose/runtime/RememberObserverHolder;", "leaving", "", "nestedRemembersLists", "Landroidx/compose/runtime/Stack;", "Ljava/util/ArrayList;", "pausedPlaceholders", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/runtime/RecomposeScopeImpl;", "Landroidx/compose/runtime/internal/PausedCompositionRemembers;", "pending", "", "priorities", "releasing", "Landroidx/collection/MutableScatterSet;", "Landroidx/compose/runtime/ComposeNodeLifecycleCallback;", "remembering", "sideEffects", "Lkotlin/Function0;", "", "deactivating", "instance", "endRelativeOrder", "", "priority", "endRelativeAfter", "dispatchAbandons", "dispatchRememberList", "list", "dispatchRememberObservers", "dispatchSideEffects", "endResumingScope", "scope", "forgetting", "processPendingLeaving", "recordLeaving", "rememberPausingScope", "sideEffect", "effect", "startResumingScope", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RememberEventDispatcher implements RememberManager {
    public static final int $stable = 8;
    private final Set<RememberObserver> abandoning;
    private ArrayList<T> nestedRemembersLists;
    private MutableScatterMap<RecomposeScopeImpl, PausedCompositionRemembers> pausedPlaceholders;
    private MutableScatterSet<ComposeNodeLifecycleCallback> releasing;
    private final MutableVector<RememberObserverHolder> remembering = new MutableVector<>(new RememberObserverHolder[16], 0);
    private MutableVector<RememberObserverHolder> currentRememberingList = this.remembering;
    private final MutableVector<Object> leaving = new MutableVector<>(new Object[16], 0);
    private final MutableVector<Function0<Unit>> sideEffects = new MutableVector<>(new Function0[16], 0);
    private final List<Object> pending = new ArrayList();
    private final MutableIntList priorities = new MutableIntList(0, 1, null);
    private final MutableIntList afters = new MutableIntList(0, 1, null);

    public RememberEventDispatcher(Set<RememberObserver> set) {
        this.abandoning = set;
    }

    @Override // androidx.compose.runtime.RememberManager
    public void remembering(RememberObserverHolder instance) {
        this.currentRememberingList.add(instance);
    }

    @Override // androidx.compose.runtime.RememberManager
    public void forgetting(RememberObserverHolder instance, int endRelativeOrder, int priority, int endRelativeAfter) {
        recordLeaving(instance, endRelativeOrder, priority, endRelativeAfter);
    }

    @Override // androidx.compose.runtime.RememberManager
    public void sideEffect(Function0<Unit> function0) {
        MutableVector this_$iv = this.sideEffects;
        this_$iv.add(function0);
    }

    @Override // androidx.compose.runtime.RememberManager
    public void deactivating(ComposeNodeLifecycleCallback instance, int endRelativeOrder, int priority, int endRelativeAfter) {
        recordLeaving(instance, endRelativeOrder, priority, endRelativeAfter);
    }

    @Override // androidx.compose.runtime.RememberManager
    public void releasing(ComposeNodeLifecycleCallback instance, int endRelativeOrder, int priority, int endRelativeAfter) {
        MutableScatterSet it = this.releasing;
        if (it == null) {
            it = ScatterSetKt.mutableScatterSetOf();
            this.releasing = it;
        }
        it.plusAssign((MutableScatterSet) instance);
        recordLeaving(instance, endRelativeOrder, priority, endRelativeAfter);
    }

    @Override // androidx.compose.runtime.RememberManager
    public void rememberPausingScope(RecomposeScopeImpl scope) {
        PausedCompositionRemembers pausedPlaceholder = new PausedCompositionRemembers(this.abandoning);
        MutableScatterMap it = this.pausedPlaceholders;
        if (it == null) {
            it = ScatterMapKt.mutableScatterMapOf();
            this.pausedPlaceholders = it;
        }
        it.set(scope, pausedPlaceholder);
        this.currentRememberingList.add(new RememberObserverHolder(pausedPlaceholder, null));
    }

    @Override // androidx.compose.runtime.RememberManager
    public void startResumingScope(RecomposeScopeImpl scope) {
        MutableScatterMap<RecomposeScopeImpl, PausedCompositionRemembers> mutableScatterMap = this.pausedPlaceholders;
        PausedCompositionRemembers placeholder = mutableScatterMap != null ? mutableScatterMap.get(scope) : null;
        if (placeholder != null) {
            ArrayList it = this.nestedRemembersLists;
            if (it == null) {
                it = Stack.m3716constructorimpl$default(null, 1, null);
                this.nestedRemembersLists = it;
            }
            Stack.m3726pushimpl(it, this.currentRememberingList);
            this.currentRememberingList = placeholder.getPausedRemembers();
        }
    }

    @Override // androidx.compose.runtime.RememberManager
    public void endResumingScope(RecomposeScopeImpl scope) {
        MutableVector it;
        MutableScatterMap pausedPlaceholders = this.pausedPlaceholders;
        if (pausedPlaceholders != null) {
            PausedCompositionRemembers placeholder = pausedPlaceholders.get(scope);
            if (placeholder != null) {
                ArrayList<T> arrayList = this.nestedRemembersLists;
                if (arrayList != 0 && (it = (MutableVector) Stack.m3725popimpl(arrayList)) != null) {
                    this.currentRememberingList = it;
                }
                pausedPlaceholders.remove(scope);
            }
        }
    }

    public final void dispatchRememberObservers() {
        Object token$iv;
        processPendingLeaving(Integer.MIN_VALUE);
        MutableVector this_$iv = this.leaving;
        MutableVector this_$iv2 = this_$iv.getSize() != 0 ? 1 : null;
        if (this_$iv2 != null) {
            token$iv = Trace.INSTANCE.beginSection("Compose:onForgotten");
            try {
                MutableScatterSet releasing = this.releasing;
                for (int i = this.leaving.getSize() - 1; -1 < i; i--) {
                    MutableVector this_$iv3 = this.leaving;
                    Object instance = this_$iv3.content[i];
                    if (instance instanceof RememberObserverHolder) {
                        RememberObserver wrapped = ((RememberObserverHolder) instance).getWrapped();
                        this.abandoning.remove(wrapped);
                        wrapped.onForgotten();
                    }
                    if (instance instanceof ComposeNodeLifecycleCallback) {
                        if (releasing != null && releasing.contains(instance)) {
                            ((ComposeNodeLifecycleCallback) instance).onRelease();
                        } else {
                            ((ComposeNodeLifecycleCallback) instance).onDeactivate();
                        }
                    }
                }
                Unit unit = Unit.INSTANCE;
            } finally {
            }
        }
        MutableVector this_$iv4 = this.remembering;
        if (this_$iv4.getSize() != 0) {
            token$iv = Trace.INSTANCE.beginSection("Compose:onRemembered");
            try {
                dispatchRememberList(this.remembering);
                Unit unit2 = Unit.INSTANCE;
            } finally {
            }
        }
    }

    private final void dispatchRememberList(MutableVector<RememberObserverHolder> mutableVector) {
        Object[] content$iv = mutableVector.content;
        int size$iv = mutableVector.getSize();
        for (int i$iv = 0; i$iv < size$iv; i$iv++) {
            RememberObserverHolder instance = (RememberObserverHolder) content$iv[i$iv];
            RememberObserver wrapped = instance.getWrapped();
            this.abandoning.remove(wrapped);
            wrapped.onRemembered();
        }
    }

    public final void dispatchSideEffects() {
        if (this.sideEffects.getSize() != 0) {
            Object token$iv = Trace.INSTANCE.beginSection("Compose:sideeffects");
            try {
                MutableVector this_$iv = this.sideEffects;
                Object[] content$iv = this_$iv.content;
                int size$iv = this_$iv.getSize();
                for (int i$iv = 0; i$iv < size$iv; i$iv++) {
                    Function0 sideEffect = (Function0) content$iv[i$iv];
                    sideEffect.invoke();
                }
                this.sideEffects.clear();
                Unit unit = Unit.INSTANCE;
            } finally {
                Trace.INSTANCE.endSection(token$iv);
            }
        }
    }

    public final void dispatchAbandons() {
        if (!this.abandoning.isEmpty()) {
            Object token$iv = Trace.INSTANCE.beginSection("Compose:abandons");
            try {
                Iterator iterator = this.abandoning.iterator();
                while (iterator.hasNext()) {
                    RememberObserver instance = iterator.next();
                    iterator.remove();
                    instance.onAbandoned();
                }
                Unit unit = Unit.INSTANCE;
            } finally {
                Trace.INSTANCE.endSection(token$iv);
            }
        }
    }

    private final void recordLeaving(Object instance, int endRelativeOrder, int priority, int endRelativeAfter) {
        processPendingLeaving(endRelativeOrder);
        boolean z = false;
        if (endRelativeAfter >= 0 && endRelativeAfter < endRelativeOrder) {
            z = true;
        }
        if (z) {
            this.pending.add(instance);
            this.priorities.add(priority);
            this.afters.add(endRelativeAfter);
            return;
        }
        this.leaving.add(instance);
    }

    private final void processPendingLeaving(int endRelativeOrder) {
        if (!this.pending.isEmpty()) {
            int index = 0;
            List toAdd = null;
            MutableIntList toAddAfter = null;
            MutableIntList toAddPriority = null;
            while (index < this.afters._size) {
                if (endRelativeOrder <= this.afters.get(index)) {
                    Object instance = this.pending.remove(index);
                    int endRelativeAfter = this.afters.removeAt(index);
                    int priority = this.priorities.removeAt(index);
                    if (toAdd == null) {
                        toAdd = CollectionsKt.mutableListOf(instance);
                        MutableIntList it = new MutableIntList(0, 1, null);
                        it.add(endRelativeAfter);
                        toAddAfter = it;
                        MutableIntList it2 = new MutableIntList(0, 1, null);
                        it2.add(priority);
                        toAddPriority = it2;
                    } else {
                        Intrinsics.checkNotNull(toAddPriority, "null cannot be cast to non-null type androidx.collection.MutableIntList");
                        Intrinsics.checkNotNull(toAddAfter, "null cannot be cast to non-null type androidx.collection.MutableIntList");
                        toAdd.add(instance);
                        toAddAfter.add(endRelativeAfter);
                        toAddPriority.add(priority);
                    }
                } else {
                    index++;
                }
            }
            if (toAdd != null) {
                Intrinsics.checkNotNull(toAddPriority, "null cannot be cast to non-null type androidx.collection.MutableIntList");
                Intrinsics.checkNotNull(toAddAfter, "null cannot be cast to non-null type androidx.collection.MutableIntList");
                int size = toAdd.size() - 1;
                for (int i = 0; i < size; i++) {
                    int size2 = toAdd.size();
                    for (int j = i + 1; j < size2; j++) {
                        int iAfter = toAddAfter.get(i);
                        int jAfter = toAddAfter.get(j);
                        if (iAfter < jAfter || (jAfter == iAfter && toAddPriority.get(i) < toAddPriority.get(j))) {
                            RememberEventDispatcherKt.swap(toAdd, i, j);
                            RememberEventDispatcherKt.swap(toAddPriority, i, j);
                            RememberEventDispatcherKt.swap(toAddAfter, i, j);
                        }
                    }
                }
                MutableVector this_$iv = this.leaving;
                this_$iv.addAll(this_$iv.getSize(), toAdd);
            }
        }
    }
}
