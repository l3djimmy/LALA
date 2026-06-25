package androidx.compose.foundation.gestures;

import androidx.compose.foundation.ComposeFoundationFlags;
import androidx.compose.ui.input.nestedscroll.NestedScrollSource;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: Scrollable.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/foundation/gestures/NestedScrollScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$2", f = "Scrollable.kt", i = {}, l = {814}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class ScrollingLogic$doFlingAnimation$2 extends SuspendLambda implements Function2<NestedScrollScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ long $available;
    final /* synthetic */ Ref.LongRef $result;
    long J$0;
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    int label;
    final /* synthetic */ ScrollingLogic this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ScrollingLogic$doFlingAnimation$2(ScrollingLogic scrollingLogic, Ref.LongRef longRef, long j, Continuation<? super ScrollingLogic$doFlingAnimation$2> continuation) {
        super(2, continuation);
        this.this$0 = scrollingLogic;
        this.$result = longRef;
        this.$available = j;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ScrollingLogic$doFlingAnimation$2 scrollingLogic$doFlingAnimation$2 = new ScrollingLogic$doFlingAnimation$2(this.this$0, this.$result, this.$available, continuation);
        scrollingLogic$doFlingAnimation$2.L$0 = obj;
        return scrollingLogic$doFlingAnimation$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(NestedScrollScope nestedScrollScope, Continuation<? super Unit> continuation) {
        return ((ScrollingLogic$doFlingAnimation$2) create(nestedScrollScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        ScrollingLogic scrollingLogic;
        Ref.LongRef longRef;
        FlingBehavior $this$invokeSuspend_u24lambda_u241_u24lambda_u240;
        float m775toFloatTH1AsA0;
        ScrollingLogic scrollingLogic2;
        long j;
        long m776updateQWom1Mo;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                final NestedScrollScope nestedScrollScope = (NestedScrollScope) this.L$0;
                final ScrollingLogic scrollingLogic3 = this.this$0;
                ScrollScope scrollScope = new ScrollScope() { // from class: androidx.compose.foundation.gestures.ScrollingLogic$doFlingAnimation$2$reverseScope$1
                    @Override // androidx.compose.foundation.gestures.ScrollScope
                    public float scrollBy(float pixels) {
                        boolean shouldCancelFling;
                        if (ComposeFoundationFlags.NewNestedFlingPropagationEnabled) {
                            if (!(Math.abs(pixels) == 0.0f)) {
                                shouldCancelFling = ScrollingLogic.this.shouldCancelFling(pixels);
                                if (shouldCancelFling) {
                                    throw new FlingCancellationException();
                                }
                            }
                        }
                        return ScrollingLogic.this.reverseIfNeeded(ScrollingLogic.this.m782toFloatk4lQ0M(nestedScrollScope.mo737scrollByWithOverscrollOzD1aCk(ScrollingLogic.this.m780reverseIfNeededMKHz9U(ScrollingLogic.this.m783toOffsettuRUvjQ(pixels)), NestedScrollSource.Companion.m5404getSideEffectWNlRxjI())));
                    }
                };
                scrollingLogic = this.this$0;
                longRef = this.$result;
                long j2 = this.$available;
                $this$invokeSuspend_u24lambda_u241_u24lambda_u240 = scrollingLogic.flingBehavior;
                long j3 = longRef.element;
                m775toFloatTH1AsA0 = scrollingLogic.m775toFloatTH1AsA0(j2);
                float reverseIfNeeded = scrollingLogic.reverseIfNeeded(m775toFloatTH1AsA0);
                this.L$0 = scrollingLogic;
                this.L$1 = scrollingLogic;
                this.L$2 = longRef;
                this.J$0 = j3;
                this.label = 1;
                Object performFling = $this$invokeSuspend_u24lambda_u241_u24lambda_u240.performFling(scrollScope, reverseIfNeeded, this);
                if (performFling != coroutine_suspended) {
                    $result = performFling;
                    scrollingLogic2 = scrollingLogic;
                    j = j3;
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                j = this.J$0;
                longRef = (Ref.LongRef) this.L$2;
                scrollingLogic = (ScrollingLogic) this.L$1;
                scrollingLogic2 = (ScrollingLogic) this.L$0;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        m776updateQWom1Mo = scrollingLogic.m776updateQWom1Mo(j, scrollingLogic2.reverseIfNeeded(((Number) $result).floatValue()));
        longRef.element = m776updateQWom1Mo;
        return Unit.INSTANCE;
    }
}
