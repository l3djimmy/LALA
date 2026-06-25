package androidx.compose.foundation.lazy.layout;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: LazyLayoutScrollDeltaBetweenPasses.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.lazy.layout.LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2", f = "LazyLayoutScrollDeltaBetweenPasses.kt", i = {}, l = {Property.WIDTH}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    int label;
    final /* synthetic */ LazyLayoutScrollDeltaBetweenPasses this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2(LazyLayoutScrollDeltaBetweenPasses lazyLayoutScrollDeltaBetweenPasses, Continuation<? super LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2> continuation) {
        super(2, continuation);
        this.this$0 = lazyLayoutScrollDeltaBetweenPasses;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2(this.this$0, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: InlineMethods
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to process method for inline: androidx.compose.animation.core.SuspendAnimationKt.animateTo$default(androidx.compose.animation.core.AnimationState, java.lang.Object, androidx.compose.animation.core.AnimationSpec, boolean, kotlin.jvm.functions.Function1, kotlin.coroutines.Continuation, int, java.lang.Object):java.lang.Object
        	at jadx.core.dex.visitors.InlineMethods.processInvokeInsn(InlineMethods.java:76)
        	at jadx.core.dex.visitors.InlineMethods.visit(InlineMethods.java:51)
        Caused by: java.util.ConcurrentModificationException
        	at java.base/java.util.ArrayList.removeIf(Unknown Source)
        */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            r10 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r10.label
            switch(r1) {
                case 0: goto L16;
                case 1: goto L12;
                default: goto L9;
            }
        L9:
            java.lang.IllegalStateException r11 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r11.<init>(r0)
            throw r11
        L12:
            kotlin.ResultKt.throwOnFailure(r11)
            goto L48
        L16:
            kotlin.ResultKt.throwOnFailure(r11)
            androidx.compose.foundation.lazy.layout.LazyLayoutScrollDeltaBetweenPasses r1 = r10.this$0
            androidx.compose.animation.core.AnimationState r2 = androidx.compose.foundation.lazy.layout.LazyLayoutScrollDeltaBetweenPasses.access$get_scrollDeltaBetweenPasses$p(r1)
            r1 = 0
            java.lang.Float r3 = kotlin.coroutines.jvm.internal.Boxing.boxFloat(r1)
            r4 = 1056964608(0x3f000000, float:0.5)
            java.lang.Float r4 = kotlin.coroutines.jvm.internal.Boxing.boxFloat(r4)
            r5 = 0
            r6 = 1137180672(0x43c80000, float:400.0)
            r7 = 1
            androidx.compose.animation.core.SpringSpec r1 = androidx.compose.animation.core.AnimationSpecKt.spring$default(r1, r6, r4, r7, r5)
            r4 = r1
            androidx.compose.animation.core.AnimationSpec r4 = (androidx.compose.animation.core.AnimationSpec) r4
            r1 = r7
            r7 = r10
            kotlin.coroutines.Continuation r7 = (kotlin.coroutines.Continuation) r7
            r10.label = r1
            r5 = 1
            r6 = 0
            r8 = 8
            r9 = 0
            java.lang.Object r1 = androidx.compose.animation.core.SuspendAnimationKt.animateTo$default(r2, r3, r4, r5, r6, r7, r8, r9)
            if (r1 != r0) goto L48
            return r0
        L48:
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.layout.LazyLayoutScrollDeltaBetweenPasses$updateScrollDeltaForApproach$2$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
