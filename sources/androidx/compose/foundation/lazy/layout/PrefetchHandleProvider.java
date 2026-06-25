package androidx.compose.foundation.lazy.layout;

import android.os.Trace;
import androidx.compose.foundation.internal.InlineClassHelperKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutPrefetchState;
import androidx.compose.ui.layout.SubcomposeLayoutState;
import androidx.compose.ui.node.TraversableNode;
import androidx.compose.ui.unit.Constraints;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.TimeSource;
/* compiled from: LazyLayoutPrefetchState.kt */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0001\u0017B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ(\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010ø\u0001\u0000¢\u0006\u0004\b\u0011\u0010\u0012J(\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0018"}, d2 = {"Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider;", "", "itemContentFactory", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemContentFactory;", "subcomposeLayoutState", "Landroidx/compose/ui/layout/SubcomposeLayoutState;", "executor", "Landroidx/compose/foundation/lazy/layout/PrefetchScheduler;", "(Landroidx/compose/foundation/lazy/layout/LazyLayoutItemContentFactory;Landroidx/compose/ui/layout/SubcomposeLayoutState;Landroidx/compose/foundation/lazy/layout/PrefetchScheduler;)V", "createNestedPrefetchRequest", "Landroidx/compose/foundation/lazy/layout/PrefetchRequest;", "index", "", "constraints", "Landroidx/compose/ui/unit/Constraints;", "prefetchMetrics", "Landroidx/compose/foundation/lazy/layout/PrefetchMetrics;", "createNestedPrefetchRequest-VKLhPVY", "(IJLandroidx/compose/foundation/lazy/layout/PrefetchMetrics;)Landroidx/compose/foundation/lazy/layout/PrefetchRequest;", "schedulePrefetch", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState$PrefetchHandle;", "schedulePrefetch-VKLhPVY", "(IJLandroidx/compose/foundation/lazy/layout/PrefetchMetrics;)Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState$PrefetchHandle;", "HandleAndRequestImpl", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PrefetchHandleProvider {
    public static final int $stable = 8;
    private final PrefetchScheduler executor;
    private final LazyLayoutItemContentFactory itemContentFactory;
    private final SubcomposeLayoutState subcomposeLayoutState;

    public PrefetchHandleProvider(LazyLayoutItemContentFactory itemContentFactory, SubcomposeLayoutState subcomposeLayoutState, PrefetchScheduler executor) {
        this.itemContentFactory = itemContentFactory;
        this.subcomposeLayoutState = subcomposeLayoutState;
        this.executor = executor;
    }

    /* renamed from: schedulePrefetch-VKLhPVY  reason: not valid java name */
    public final LazyLayoutPrefetchState.PrefetchHandle m1183schedulePrefetchVKLhPVY(int index, long constraints, PrefetchMetrics prefetchMetrics) {
        HandleAndRequestImpl it = new HandleAndRequestImpl(this, index, constraints, prefetchMetrics, null);
        this.executor.schedulePrefetch(it);
        return it;
    }

    /* renamed from: createNestedPrefetchRequest-VKLhPVY  reason: not valid java name */
    public final PrefetchRequest m1182createNestedPrefetchRequestVKLhPVY(int index, long constraints, PrefetchMetrics prefetchMetrics) {
        return new HandleAndRequestImpl(this, index, constraints, prefetchMetrics, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: LazyLayoutPrefetchState.kt */
    @Metadata(d1 = {"\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\t\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0083\u0004\u0018\u00002\u00020\u00012\u00020\u0002:\u00011B\u001d\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0002\u0010\tJ\b\u0010\u001c\u001a\u00020\u001dH\u0016J\b\u0010\u001e\u001a\u00020\u001dH\u0016J\u001a\u0010\u001f\u001a\u00020\u001d2\u0006\u0010 \u001a\u00020!2\b\u0010\"\u001a\u0004\u0018\u00010#H\u0002J\u001a\u0010$\u001a\u00020\u001d2\u0006\u0010\u0005\u001a\u00020\u0006H\u0002ø\u0001\u0000¢\u0006\u0004\b%\u0010&J\u0010\u0010'\u001a\u00020\u001d2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\u0012\u0010(\u001a\f\u0018\u00010\u0016R\u00060\u0000R\u00020\u0017H\u0002J\u0018\u0010)\u001a\u00020\u000f2\u0006\u0010*\u001a\u00020\u000b2\u0006\u0010+\u001a\u00020\u000bH\u0002J\b\u0010,\u001a\u00020-H\u0016J\b\u0010.\u001a\u00020\u001dH\u0002J\f\u0010/\u001a\u00020\u000f*\u000200H\u0016R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\u0005\u001a\u00020\u0006X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\fR\u000e\u0010\r\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u00020\u000f8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\u0015\u001a\f\u0018\u00010\u0016R\u00060\u0000R\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u001a\u001a\u00020\u001bX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\f\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u00062"}, d2 = {"Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider$HandleAndRequestImpl;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState$PrefetchHandle;", "Landroidx/compose/foundation/lazy/layout/PrefetchRequest;", "index", "", "constraints", "Landroidx/compose/ui/unit/Constraints;", "prefetchMetrics", "Landroidx/compose/foundation/lazy/layout/PrefetchMetrics;", "(Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider;IJLandroidx/compose/foundation/lazy/layout/PrefetchMetrics;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "availableTimeNanos", "", "J", "elapsedTimeNanos", "hasResolvedNestedPrefetches", "", "isCanceled", "isComposed", "()Z", "isMeasured", "isUrgent", "nestedPrefetchController", "Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider$HandleAndRequestImpl$NestedPrefetchController;", "Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider;", "precomposeHandle", "Landroidx/compose/ui/layout/SubcomposeLayoutState$PrecomposedSlotHandle;", "startTime", "Lkotlin/time/TimeSource$Monotonic$ValueTimeMark;", "cancel", "", "markAsUrgent", "performFullComposition", "itemProvider", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemProvider;", "contentType", "", "performMeasure", "performMeasure-BRTryo0", "(J)V", "resetAvailableTimeTo", "resolveNestedPrefetchStates", "shouldExecute", "available", "average", "toString", "", "updateElapsedAndAvailableTime", "execute", "Landroidx/compose/foundation/lazy/layout/PrefetchRequestScope;", "NestedPrefetchController", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public final class HandleAndRequestImpl implements LazyLayoutPrefetchState.PrefetchHandle, PrefetchRequest {
        private long availableTimeNanos;
        private final long constraints;
        private long elapsedTimeNanos;
        private boolean hasResolvedNestedPrefetches;
        private final int index;
        private boolean isCanceled;
        private boolean isMeasured;
        private boolean isUrgent;
        private NestedPrefetchController nestedPrefetchController;
        private SubcomposeLayoutState.PrecomposedSlotHandle precomposeHandle;
        private final PrefetchMetrics prefetchMetrics;
        private long startTime;

        public /* synthetic */ HandleAndRequestImpl(PrefetchHandleProvider prefetchHandleProvider, int i, long j, PrefetchMetrics prefetchMetrics, DefaultConstructorMarker defaultConstructorMarker) {
            this(i, j, prefetchMetrics);
        }

        private HandleAndRequestImpl(int index, long constraints, PrefetchMetrics prefetchMetrics) {
            this.index = index;
            this.constraints = constraints;
            this.prefetchMetrics = prefetchMetrics;
            this.startTime = TimeSource.Monotonic.INSTANCE.m8799markNowz9LOYto();
        }

        private final boolean isComposed() {
            return this.precomposeHandle != null;
        }

        @Override // androidx.compose.foundation.lazy.layout.LazyLayoutPrefetchState.PrefetchHandle
        public void cancel() {
            if (!this.isCanceled) {
                this.isCanceled = true;
                SubcomposeLayoutState.PrecomposedSlotHandle precomposedSlotHandle = this.precomposeHandle;
                if (precomposedSlotHandle != null) {
                    precomposedSlotHandle.dispose();
                }
                this.precomposeHandle = null;
            }
        }

        @Override // androidx.compose.foundation.lazy.layout.LazyLayoutPrefetchState.PrefetchHandle
        public void markAsUrgent() {
            this.isUrgent = true;
        }

        private final boolean shouldExecute(long available, long average) {
            return (this.isUrgent && available > 0) || average < available;
        }

        private final void resetAvailableTimeTo(long availableTimeNanos) {
            this.availableTimeNanos = availableTimeNanos;
            this.startTime = TimeSource.Monotonic.INSTANCE.m8799markNowz9LOYto();
            this.elapsedTimeNanos = 0L;
        }

        private final void updateElapsedAndAvailableTime() {
            long now = TimeSource.Monotonic.INSTANCE.m8799markNowz9LOYto();
            this.elapsedTimeNanos = Duration.m8700getInWholeNanosecondsimpl(TimeSource.Monotonic.ValueTimeMark.m8810minus6eNON_k(now, this.startTime));
            this.availableTimeNanos -= this.elapsedTimeNanos;
            this.startTime = now;
        }

        /* JADX WARN: Removed duplicated region for block: B:13:0x002a A[RETURN] */
        /* JADX WARN: Removed duplicated region for block: B:14:0x002b  */
        @Override // androidx.compose.foundation.lazy.layout.PrefetchRequest
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public boolean execute(androidx.compose.foundation.lazy.layout.PrefetchRequestScope r10) {
            /*
                Method dump skipped, instructions count: 247
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.layout.PrefetchHandleProvider.HandleAndRequestImpl.execute(androidx.compose.foundation.lazy.layout.PrefetchRequestScope):boolean");
        }

        private final void performFullComposition(LazyLayoutItemProvider itemProvider, Object contentType) {
            boolean value$iv = this.precomposeHandle == null;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalArgumentException("Request was already composed!");
            }
            Object key = itemProvider.getKey(this.index);
            Function2 content = PrefetchHandleProvider.this.itemContentFactory.getContent(this.index, key, contentType);
            this.precomposeHandle = PrefetchHandleProvider.this.subcomposeLayoutState.precompose(key, content);
        }

        /* renamed from: performMeasure-BRTryo0  reason: not valid java name */
        private final void m1184performMeasureBRTryo0(long constraints) {
            boolean value$iv = !this.isCanceled;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalArgumentException("Callers should check whether the request is still valid before calling performMeasure()");
            }
            boolean value$iv2 = this.isMeasured;
            if (!(!value$iv2)) {
                InlineClassHelperKt.throwIllegalArgumentException("Request was already measured!");
            }
            this.isMeasured = true;
            SubcomposeLayoutState.PrecomposedSlotHandle handle = this.precomposeHandle;
            if (handle != null) {
                int placeablesCount = handle.getPlaceablesCount();
                for (int i = 0; i < placeablesCount; i++) {
                    int placeableIndex = i;
                    handle.mo5663premeasure0kLqBqw(placeableIndex, constraints);
                }
                return;
            }
            InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("performComposition() must be called before performMeasure()");
            throw new KotlinNothingValueException();
        }

        private final NestedPrefetchController resolveNestedPrefetchStates() {
            SubcomposeLayoutState.PrecomposedSlotHandle precomposedSlotHandle = this.precomposeHandle;
            if (precomposedSlotHandle != null) {
                final Ref.ObjectRef nestedStates = new Ref.ObjectRef();
                precomposedSlotHandle.traverseDescendants("androidx.compose.foundation.lazy.layout.TraversablePrefetchStateNode", new Function1<TraversableNode, TraversableNode.Companion.TraverseDescendantsAction>() { // from class: androidx.compose.foundation.lazy.layout.PrefetchHandleProvider$HandleAndRequestImpl$resolveNestedPrefetchStates$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    /* JADX WARN: Multi-variable type inference failed */
                    @Override // kotlin.jvm.functions.Function1
                    public final TraversableNode.Companion.TraverseDescendantsAction invoke(TraversableNode it) {
                        T t;
                        Intrinsics.checkNotNull(it, "null cannot be cast to non-null type androidx.compose.foundation.lazy.layout.TraversablePrefetchStateNode");
                        LazyLayoutPrefetchState prefetchState = ((TraversablePrefetchStateNode) it).getPrefetchState();
                        Ref.ObjectRef<List<LazyLayoutPrefetchState>> objectRef = nestedStates;
                        List<LazyLayoutPrefetchState> list = nestedStates.element;
                        if (list != null) {
                            list.add(prefetchState);
                            t = list;
                        } else {
                            t = CollectionsKt.mutableListOf(prefetchState);
                        }
                        objectRef.element = t;
                        return TraversableNode.Companion.TraverseDescendantsAction.SkipSubtreeAndContinueTraversal;
                    }
                });
                List it = (List) nestedStates.element;
                if (it != null) {
                    return new NestedPrefetchController(it);
                }
                return null;
            }
            InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("Should precompose before resolving nested prefetch states");
            throw new KotlinNothingValueException();
        }

        public String toString() {
            return "HandleAndRequestImpl { index = " + this.index + ", constraints = " + ((Object) Constraints.m6831toStringimpl(this.constraints)) + ", isComposed = " + isComposed() + ", isMeasured = " + this.isMeasured + ", isCanceled = " + this.isCanceled + " }";
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* compiled from: LazyLayoutPrefetchState.kt */
        @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0000\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0013\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\n\u0010\r\u001a\u00020\u000e*\u00020\u000fR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010\b\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020\n\u0018\u00010\u00030\tX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u000bR\u000e\u0010\f\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider$HandleAndRequestImpl$NestedPrefetchController;", "", "states", "", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState;", "(Landroidx/compose/foundation/lazy/layout/PrefetchHandleProvider$HandleAndRequestImpl;Ljava/util/List;)V", "requestIndex", "", "requestsByState", "", "Landroidx/compose/foundation/lazy/layout/PrefetchRequest;", "[Ljava/util/List;", "stateIndex", "executeNestedPrefetches", "", "Landroidx/compose/foundation/lazy/layout/PrefetchRequestScope;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
        /* loaded from: classes.dex */
        public final class NestedPrefetchController {
            private int requestIndex;
            private final List<PrefetchRequest>[] requestsByState;
            private int stateIndex;
            private final List<LazyLayoutPrefetchState> states;

            public NestedPrefetchController(List<LazyLayoutPrefetchState> list) {
                this.states = list;
                this.requestsByState = new List[this.states.size()];
                boolean value$iv = !this.states.isEmpty();
                if (value$iv) {
                    return;
                }
                InlineClassHelperKt.throwIllegalArgumentException("NestedPrefetchController shouldn't be created with no states");
            }

            public final boolean executeNestedPrefetches(PrefetchRequestScope $this$executeNestedPrefetches) {
                if (this.stateIndex >= this.states.size()) {
                    return false;
                }
                boolean value$iv = !HandleAndRequestImpl.this.isCanceled;
                if (!value$iv) {
                    InlineClassHelperKt.throwIllegalStateException("Should not execute nested prefetch on canceled request");
                }
                Trace.beginSection("compose:lazy:prefetch:nested");
                while (this.stateIndex < this.states.size()) {
                    try {
                        if (this.requestsByState[this.stateIndex] == null) {
                            if ($this$executeNestedPrefetches.availableTimeNanos() <= 0) {
                                return true;
                            }
                            this.requestsByState[this.stateIndex] = this.states.get(this.stateIndex).collectNestedPrefetchRequests$foundation_release();
                        }
                        List nestedRequests = this.requestsByState[this.stateIndex];
                        Intrinsics.checkNotNull(nestedRequests);
                        while (this.requestIndex < nestedRequests.size()) {
                            PrefetchRequest $this$executeNestedPrefetches_u24lambda_u243_u24lambda_u242 = nestedRequests.get(this.requestIndex);
                            boolean hasMoreWork = $this$executeNestedPrefetches_u24lambda_u243_u24lambda_u242.execute($this$executeNestedPrefetches);
                            if (hasMoreWork) {
                                return true;
                            }
                            this.requestIndex++;
                        }
                        this.requestIndex = 0;
                        this.stateIndex++;
                    } finally {
                        Trace.endSection();
                    }
                }
                Unit unit = Unit.INSTANCE;
                return false;
            }
        }
    }
}
