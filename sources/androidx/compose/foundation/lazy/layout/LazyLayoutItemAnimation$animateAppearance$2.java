package androidx.compose.foundation.lazy.layout;

import androidx.compose.animation.core.FiniteAnimationSpec;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: LazyLayoutItemAnimation.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation$animateAppearance$2", f = "LazyLayoutItemAnimation.kt", i = {}, l = {183, 185}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes.dex */
public final class LazyLayoutItemAnimation$animateAppearance$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ GraphicsLayer $layer;
    final /* synthetic */ boolean $shouldResetValue;
    final /* synthetic */ FiniteAnimationSpec<Float> $spec;
    int label;
    final /* synthetic */ LazyLayoutItemAnimation this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LazyLayoutItemAnimation$animateAppearance$2(boolean z, LazyLayoutItemAnimation lazyLayoutItemAnimation, FiniteAnimationSpec<Float> finiteAnimationSpec, GraphicsLayer graphicsLayer, Continuation<? super LazyLayoutItemAnimation$animateAppearance$2> continuation) {
        super(2, continuation);
        this.$shouldResetValue = z;
        this.this$0 = lazyLayoutItemAnimation;
        this.$spec = finiteAnimationSpec;
        this.$layer = graphicsLayer;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new LazyLayoutItemAnimation$animateAppearance$2(this.$shouldResetValue, this.this$0, this.$spec, this.$layer, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((LazyLayoutItemAnimation$animateAppearance$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x006a A[RETURN] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r12) {
        /*
            r11 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r11.label
            r2 = 0
            switch(r1) {
                case 0: goto L1d;
                case 1: goto L17;
                case 2: goto L13;
                default: goto La;
            }
        La:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r0)
            throw r12
        L13:
            kotlin.ResultKt.throwOnFailure(r12)     // Catch: java.lang.Throwable -> L1b
            goto L6b
        L17:
            kotlin.ResultKt.throwOnFailure(r12)     // Catch: java.lang.Throwable -> L1b
            goto L3d
        L1b:
            r0 = move-exception
            goto L74
        L1d:
            kotlin.ResultKt.throwOnFailure(r12)
            boolean r1 = r11.$shouldResetValue     // Catch: java.lang.Throwable -> L1b
            if (r1 == 0) goto L3e
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation r1 = r11.this$0     // Catch: java.lang.Throwable -> L1b
            androidx.compose.animation.core.Animatable r1 = androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation.access$getVisibilityAnimation$p(r1)     // Catch: java.lang.Throwable -> L1b
            r3 = 0
            java.lang.Float r3 = kotlin.coroutines.jvm.internal.Boxing.boxFloat(r3)     // Catch: java.lang.Throwable -> L1b
            r4 = r11
            kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4     // Catch: java.lang.Throwable -> L1b
            r5 = 1
            r11.label = r5     // Catch: java.lang.Throwable -> L1b
            java.lang.Object r1 = r1.snapTo(r3, r4)     // Catch: java.lang.Throwable -> L1b
            if (r1 != r0) goto L3d
            return r0
        L3d:
        L3e:
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation r1 = r11.this$0     // Catch: java.lang.Throwable -> L1b
            androidx.compose.animation.core.Animatable r3 = androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation.access$getVisibilityAnimation$p(r1)     // Catch: java.lang.Throwable -> L1b
            r1 = 1065353216(0x3f800000, float:1.0)
            java.lang.Float r4 = kotlin.coroutines.jvm.internal.Boxing.boxFloat(r1)     // Catch: java.lang.Throwable -> L1b
            androidx.compose.animation.core.FiniteAnimationSpec<java.lang.Float> r1 = r11.$spec     // Catch: java.lang.Throwable -> L1b
            r5 = r1
            androidx.compose.animation.core.AnimationSpec r5 = (androidx.compose.animation.core.AnimationSpec) r5     // Catch: java.lang.Throwable -> L1b
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation$animateAppearance$2$1 r1 = new androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation$animateAppearance$2$1     // Catch: java.lang.Throwable -> L1b
            androidx.compose.ui.graphics.layer.GraphicsLayer r6 = r11.$layer     // Catch: java.lang.Throwable -> L1b
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation r7 = r11.this$0     // Catch: java.lang.Throwable -> L1b
            r1.<init>()     // Catch: java.lang.Throwable -> L1b
            r7 = r1
            kotlin.jvm.functions.Function1 r7 = (kotlin.jvm.functions.Function1) r7     // Catch: java.lang.Throwable -> L1b
            r8 = r11
            kotlin.coroutines.Continuation r8 = (kotlin.coroutines.Continuation) r8     // Catch: java.lang.Throwable -> L1b
            r1 = 2
            r11.label = r1     // Catch: java.lang.Throwable -> L1b
            r6 = 0
            r9 = 4
            r10 = 0
            java.lang.Object r1 = androidx.compose.animation.core.Animatable.animateTo$default(r3, r4, r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L1b
            if (r1 != r0) goto L6b
            return r0
        L6b:
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation r0 = r11.this$0
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation.access$setAppearanceAnimationInProgress(r0, r2)
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        L74:
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation r1 = r11.this$0
            androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation.access$setAppearanceAnimationInProgress(r1, r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.layout.LazyLayoutItemAnimation$animateAppearance$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
