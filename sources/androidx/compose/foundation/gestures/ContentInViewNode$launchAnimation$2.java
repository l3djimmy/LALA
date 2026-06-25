package androidx.compose.foundation.gestures;

import androidx.compose.foundation.MutatePriority;
import androidx.compose.foundation.gestures.ContentInViewNode;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.input.nestedscroll.NestedScrollSource;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.JobKt;
import kotlinx.coroutines.JobKt__JobKt;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ContentInViewNode.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.gestures.ContentInViewNode$launchAnimation$2", f = "ContentInViewNode.kt", i = {}, l = {215}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class ContentInViewNode$launchAnimation$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ UpdatableAnimationState $animationState;
    final /* synthetic */ BringIntoViewSpec $bringIntoViewSpec;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ ContentInViewNode this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ContentInViewNode$launchAnimation$2(ContentInViewNode contentInViewNode, UpdatableAnimationState updatableAnimationState, BringIntoViewSpec bringIntoViewSpec, Continuation<? super ContentInViewNode$launchAnimation$2> continuation) {
        super(2, continuation);
        this.this$0 = contentInViewNode;
        this.$animationState = updatableAnimationState;
        this.$bringIntoViewSpec = bringIntoViewSpec;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ContentInViewNode$launchAnimation$2 contentInViewNode$launchAnimation$2 = new ContentInViewNode$launchAnimation$2(this.this$0, this.$animationState, this.$bringIntoViewSpec, continuation);
        contentInViewNode$launchAnimation$2.L$0 = obj;
        return contentInViewNode$launchAnimation$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((ContentInViewNode$launchAnimation$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v4 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        ScrollingLogic scrollingLogic;
        CancellationException cancellationException;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        ?? r1 = this.label;
        try {
            switch (r1) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    CoroutineScope $this$launch = (CoroutineScope) this.L$0;
                    Job animationJob = JobKt.getJob($this$launch.getCoroutineContext());
                    try {
                        this.this$0.isAnimationRunning = true;
                        scrollingLogic = this.this$0.scrollingLogic;
                        this.label = 1;
                        if (scrollingLogic.scroll(MutatePriority.Default, new AnonymousClass1(this.$animationState, this.this$0, this.$bringIntoViewSpec, animationJob, null), this) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        cancellationException = null;
                        this.this$0.bringIntoViewRequests.resumeAndRemoveAll();
                        this.this$0.isAnimationRunning = false;
                        this.this$0.bringIntoViewRequests.cancelAndRemoveAll(cancellationException);
                        this.this$0.trackingFocusedChild = false;
                        return Unit.INSTANCE;
                    } catch (CancellationException e) {
                        e = e;
                        throw e;
                    } catch (Throwable th) {
                        e = th;
                        r1 = 0;
                        this.this$0.isAnimationRunning = false;
                        this.this$0.bringIntoViewRequests.cancelAndRemoveAll(r1);
                        this.this$0.trackingFocusedChild = false;
                        throw e;
                    }
                case 1:
                    cancellationException = null;
                    try {
                        ResultKt.throwOnFailure($result);
                        this.this$0.bringIntoViewRequests.resumeAndRemoveAll();
                        this.this$0.isAnimationRunning = false;
                        this.this$0.bringIntoViewRequests.cancelAndRemoveAll(cancellationException);
                        this.this$0.trackingFocusedChild = false;
                        return Unit.INSTANCE;
                    } catch (CancellationException e2) {
                        e = e2;
                        throw e;
                    }
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (Throwable th2) {
            e = th2;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* compiled from: ContentInViewNode.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/foundation/gestures/NestedScrollScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "androidx.compose.foundation.gestures.ContentInViewNode$launchAnimation$2$1", f = "ContentInViewNode.kt", i = {}, l = {221}, m = "invokeSuspend", n = {}, s = {})
    /* renamed from: androidx.compose.foundation.gestures.ContentInViewNode$launchAnimation$2$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<NestedScrollScope, Continuation<? super Unit>, Object> {
        final /* synthetic */ Job $animationJob;
        final /* synthetic */ UpdatableAnimationState $animationState;
        final /* synthetic */ BringIntoViewSpec $bringIntoViewSpec;
        private /* synthetic */ Object L$0;
        int label;
        final /* synthetic */ ContentInViewNode this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(UpdatableAnimationState updatableAnimationState, ContentInViewNode contentInViewNode, BringIntoViewSpec bringIntoViewSpec, Job job, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$animationState = updatableAnimationState;
            this.this$0 = contentInViewNode;
            this.$bringIntoViewSpec = bringIntoViewSpec;
            this.$animationJob = job;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.$animationState, this.this$0, this.$bringIntoViewSpec, this.$animationJob, continuation);
            anonymousClass1.L$0 = obj;
            return anonymousClass1;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(NestedScrollScope nestedScrollScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(nestedScrollScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) {
            float calculateScrollDelta;
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    final NestedScrollScope $this$scroll = (NestedScrollScope) this.L$0;
                    UpdatableAnimationState updatableAnimationState = this.$animationState;
                    calculateScrollDelta = this.this$0.calculateScrollDelta(this.$bringIntoViewSpec);
                    updatableAnimationState.setValue(calculateScrollDelta);
                    UpdatableAnimationState updatableAnimationState2 = this.$animationState;
                    final ContentInViewNode contentInViewNode = this.this$0;
                    final UpdatableAnimationState updatableAnimationState3 = this.$animationState;
                    final Job job = this.$animationJob;
                    final ContentInViewNode contentInViewNode2 = this.this$0;
                    final UpdatableAnimationState updatableAnimationState4 = this.$animationState;
                    final BringIntoViewSpec bringIntoViewSpec = this.$bringIntoViewSpec;
                    this.label = 1;
                    if (updatableAnimationState2.animateToZero(new Function1<Float, Unit>() { // from class: androidx.compose.foundation.gestures.ContentInViewNode.launchAnimation.2.1.1
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(Float f) {
                            invoke(f.floatValue());
                            return Unit.INSTANCE;
                        }

                        public final void invoke(float delta) {
                            boolean z;
                            ScrollingLogic $this$invoke_u24lambda_u240;
                            z = ContentInViewNode.this.reverseDirection;
                            float scrollMultiplier = z ? 1.0f : -1.0f;
                            float adjustedDelta = scrollMultiplier * delta;
                            $this$invoke_u24lambda_u240 = ContentInViewNode.this.scrollingLogic;
                            float consumedScroll = $this$invoke_u24lambda_u240.m782toFloatk4lQ0M($this$invoke_u24lambda_u240.m780reverseIfNeededMKHz9U($this$scroll.mo736scrollByOzD1aCk($this$invoke_u24lambda_u240.m780reverseIfNeededMKHz9U($this$invoke_u24lambda_u240.m783toOffsettuRUvjQ(adjustedDelta)), NestedScrollSource.Companion.m5405getUserInputWNlRxjI()))) * scrollMultiplier;
                            if (Math.abs(consumedScroll) < Math.abs(delta)) {
                                JobKt__JobKt.cancel$default(job, "Scroll animation cancelled because scroll was not consumed (" + consumedScroll + " < " + delta + ')', null, 2, null);
                            }
                        }
                    }, new Function0<Unit>() { // from class: androidx.compose.foundation.gestures.ContentInViewNode.launchAnimation.2.1.2
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
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
                            boolean z;
                            boolean z2;
                            float calculateScrollDelta2;
                            Rect focusedChildBounds;
                            BringIntoViewRequestPriorityQueue this_$iv = ContentInViewNode.this.bringIntoViewRequests;
                            ContentInViewNode contentInViewNode3 = ContentInViewNode.this;
                            while (true) {
                                MutableVector this_$iv$iv = this_$iv.requests;
                                z = true;
                                MutableVector this_$iv$iv2 = this_$iv$iv.getSize() != 0 ? 1 : null;
                                if (this_$iv$iv2 != null) {
                                    Rect bounds = ((ContentInViewNode.Request) this_$iv.requests.last()).getCurrentBounds().invoke();
                                    if (!(bounds == null ? true : ContentInViewNode.m675isMaxVisibleO0kMr_c$default(contentInViewNode3, bounds, 0L, 1, null))) {
                                        break;
                                    }
                                    MutableVector mutableVector = this_$iv.requests;
                                    MutableVector this_$iv$iv3 = this_$iv.requests;
                                    Unit unit = Unit.INSTANCE;
                                    Result.Companion companion = Result.Companion;
                                    ((ContentInViewNode.Request) mutableVector.removeAt(this_$iv$iv3.getSize() - 1)).getContinuation().resumeWith(Result.m7341constructorimpl(unit));
                                } else {
                                    break;
                                }
                            }
                            z2 = ContentInViewNode.this.trackingFocusedChild;
                            if (z2) {
                                focusedChildBounds = ContentInViewNode.this.getFocusedChildBounds();
                                if (focusedChildBounds == null || !ContentInViewNode.m675isMaxVisibleO0kMr_c$default(ContentInViewNode.this, focusedChildBounds, 0L, 1, null)) {
                                    z = false;
                                }
                                if (z) {
                                    ContentInViewNode.this.trackingFocusedChild = false;
                                }
                            }
                            UpdatableAnimationState updatableAnimationState5 = updatableAnimationState4;
                            calculateScrollDelta2 = ContentInViewNode.this.calculateScrollDelta(bringIntoViewSpec);
                            updatableAnimationState5.setValue(calculateScrollDelta2);
                        }
                    }, this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    break;
                case 1:
                    ResultKt.throwOnFailure($result);
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            return Unit.INSTANCE;
        }
    }
}
