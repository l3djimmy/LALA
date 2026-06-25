package androidx.compose.foundation.text;

import androidx.compose.foundation.gestures.PressGestureScope;
import androidx.compose.foundation.gestures.TapGestureDetectorKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.interaction.PressInteraction;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.ComposedModifierKt;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: TextFieldPressGestureFilter.kt */
@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\u001a4\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\t0\u0007H\u0000¨\u0006\n"}, d2 = {"tapPressTextFieldModifier", "Landroidx/compose/ui/Modifier;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "enabled", "", "onTap", "Lkotlin/Function1;", "Landroidx/compose/ui/geometry/Offset;", "", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldPressGestureFilterKt {
    public static /* synthetic */ Modifier tapPressTextFieldModifier$default(Modifier modifier, MutableInteractionSource mutableInteractionSource, boolean z, Function1 function1, int i, Object obj) {
        if ((i & 2) != 0) {
            z = true;
        }
        return tapPressTextFieldModifier(modifier, mutableInteractionSource, z, function1);
    }

    public static final Modifier tapPressTextFieldModifier(Modifier $this$tapPressTextFieldModifier, final MutableInteractionSource interactionSource, boolean enabled, final Function1<? super Offset, Unit> function1) {
        if (enabled) {
            return ComposedModifierKt.composed$default($this$tapPressTextFieldModifier, null, new Function3<Modifier, Composer, Integer, Modifier>() { // from class: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Modifier invoke(Modifier modifier, Composer composer, Integer num) {
                    return invoke(modifier, composer, num.intValue());
                }

                public final Modifier invoke(Modifier $this$composed, Composer $composer, int $changed) {
                    Object value$iv;
                    $composer.startReplaceGroup(-102778667);
                    ComposerKt.sourceInformation($composer, "C40@1627L24,41@1689L58,42@1777L27,43@1853L343,43@1817L379,52@2250L1561:TextFieldPressGestureFilter.kt#423gt5");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-102778667, $changed, -1, "androidx.compose.foundation.text.tapPressTextFieldModifier.<anonymous> (TextFieldPressGestureFilter.kt:40)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
                    ComposerKt.sourceInformationMarkerStart($composer, -954203484, "CC(remember):Effects.kt#9igjgp");
                    Object it$iv$iv = $composer.rememberedValue();
                    if (it$iv$iv == Composer.Companion.getEmpty()) {
                        Object value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer);
                        $composer.updateRememberedValue(value$iv$iv);
                        it$iv$iv = value$iv$iv;
                    }
                    final CoroutineScope scope = (CoroutineScope) it$iv$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    ComposerKt.sourceInformationMarkerStart($composer, 1794542806, "CC(remember):TextFieldPressGestureFilter.kt#9igjgp");
                    Object it$iv = $composer.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        value$iv = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
                        $composer.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    final MutableState pressedInteraction = (MutableState) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    final State onTapState = SnapshotStateKt.rememberUpdatedState(function1, $composer, 0);
                    MutableInteractionSource mutableInteractionSource = interactionSource;
                    ComposerKt.sourceInformationMarkerStart($composer, 1794548339, "CC(remember):TextFieldPressGestureFilter.kt#9igjgp");
                    boolean invalid$iv = $composer.changed(interactionSource);
                    final MutableInteractionSource mutableInteractionSource2 = interactionSource;
                    Object it$iv2 = $composer.rememberedValue();
                    if (invalid$iv || it$iv2 == Composer.Companion.getEmpty()) {
                        Object value$iv2 = (Function1) new Function1<DisposableEffectScope, DisposableEffectResult>() { // from class: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            {
                                super(1);
                            }

                            @Override // kotlin.jvm.functions.Function1
                            public final DisposableEffectResult invoke(DisposableEffectScope $this$DisposableEffect) {
                                final MutableState<PressInteraction.Press> mutableState = pressedInteraction;
                                final MutableInteractionSource mutableInteractionSource3 = mutableInteractionSource2;
                                return new DisposableEffectResult() { // from class: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$1$1$invoke$$inlined$onDispose$1
                                    @Override // androidx.compose.runtime.DisposableEffectResult
                                    public void dispose() {
                                        PressInteraction.Press oldValue = (PressInteraction.Press) MutableState.this.getValue();
                                        if (oldValue == null) {
                                            return;
                                        }
                                        PressInteraction.Cancel interaction = new PressInteraction.Cancel(oldValue);
                                        if (mutableInteractionSource3 != null) {
                                            mutableInteractionSource3.tryEmit(interaction);
                                        }
                                        MutableState.this.setValue(null);
                                    }
                                };
                            }
                        };
                        $composer.updateRememberedValue(value$iv2);
                        it$iv2 = value$iv2;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    EffectsKt.DisposableEffect(mutableInteractionSource, (Function1) it$iv2, $composer, 0);
                    Modifier.Companion companion = Modifier.Companion;
                    MutableInteractionSource mutableInteractionSource3 = interactionSource;
                    ComposerKt.sourceInformationMarkerStart($composer, 1794562261, "CC(remember):TextFieldPressGestureFilter.kt#9igjgp");
                    boolean invalid$iv2 = $composer.changedInstance(scope) | $composer.changed(interactionSource) | $composer.changed(onTapState);
                    final MutableInteractionSource mutableInteractionSource4 = interactionSource;
                    Object it$iv3 = $composer.rememberedValue();
                    if (invalid$iv2 || it$iv3 == Composer.Companion.getEmpty()) {
                        Object value$iv3 = (PointerInputEventHandler) new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1

                            /* compiled from: TextFieldPressGestureFilter.kt */
                            @Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/foundation/gestures/PressGestureScope;", "it", "Landroidx/compose/ui/geometry/Offset;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                            @DebugMetadata(c = "androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1", f = "TextFieldPressGestureFilter.kt", i = {}, l = {67}, m = "invokeSuspend", n = {}, s = {})
                            /* renamed from: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1  reason: invalid class name */
                            /* loaded from: classes.dex */
                            static final class AnonymousClass1 extends SuspendLambda implements Function3<PressGestureScope, Offset, Continuation<? super Unit>, Object> {
                                final /* synthetic */ MutableInteractionSource $interactionSource;
                                final /* synthetic */ MutableState<PressInteraction.Press> $pressedInteraction;
                                final /* synthetic */ CoroutineScope $scope;
                                /* synthetic */ long J$0;
                                private /* synthetic */ Object L$0;
                                int label;

                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                AnonymousClass1(CoroutineScope coroutineScope, MutableState<PressInteraction.Press> mutableState, MutableInteractionSource mutableInteractionSource, Continuation<? super AnonymousClass1> continuation) {
                                    super(3, continuation);
                                    this.$scope = coroutineScope;
                                    this.$pressedInteraction = mutableState;
                                    this.$interactionSource = mutableInteractionSource;
                                }

                                @Override // kotlin.jvm.functions.Function3
                                public /* bridge */ /* synthetic */ Object invoke(PressGestureScope pressGestureScope, Offset offset, Continuation<? super Unit> continuation) {
                                    return m1421invoked4ec7I(pressGestureScope, offset.m4058unboximpl(), continuation);
                                }

                                /* renamed from: invoke-d-4ec7I  reason: not valid java name */
                                public final Object m1421invoked4ec7I(PressGestureScope pressGestureScope, long j, Continuation<? super Unit> continuation) {
                                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.$scope, this.$pressedInteraction, this.$interactionSource, continuation);
                                    anonymousClass1.L$0 = pressGestureScope;
                                    anonymousClass1.J$0 = j;
                                    return anonymousClass1.invokeSuspend(Unit.INSTANCE);
                                }

                                /* JADX INFO: Access modifiers changed from: package-private */
                                /* compiled from: TextFieldPressGestureFilter.kt */
                                @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                                @DebugMetadata(c = "androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1$1", f = "TextFieldPressGestureFilter.kt", i = {1}, l = {60, 64}, m = "invokeSuspend", n = {"interaction"}, s = {"L$0"})
                                /* renamed from: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1$1  reason: invalid class name and collision with other inner class name */
                                /* loaded from: classes.dex */
                                public static final class C00241 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                                    final /* synthetic */ MutableInteractionSource $interactionSource;
                                    final /* synthetic */ long $it;
                                    final /* synthetic */ MutableState<PressInteraction.Press> $pressedInteraction;
                                    Object L$0;
                                    int label;

                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    C00241(MutableState<PressInteraction.Press> mutableState, long j, MutableInteractionSource mutableInteractionSource, Continuation<? super C00241> continuation) {
                                        super(2, continuation);
                                        this.$pressedInteraction = mutableState;
                                        this.$it = j;
                                        this.$interactionSource = mutableInteractionSource;
                                    }

                                    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                        return new C00241(this.$pressedInteraction, this.$it, this.$interactionSource, continuation);
                                    }

                                    @Override // kotlin.jvm.functions.Function2
                                    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                        return ((C00241) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                                    }

                                    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                    public final Object invokeSuspend(Object $result) {
                                        MutableState<PressInteraction.Press> mutableState;
                                        MutableState<PressInteraction.Press> mutableState2;
                                        boolean z;
                                        PressInteraction.Press interaction;
                                        PressInteraction.Press interaction2;
                                        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                        switch (this.label) {
                                            case 0:
                                                ResultKt.throwOnFailure($result);
                                                PressInteraction.Press oldValue = this.$pressedInteraction.getValue();
                                                if (oldValue != null) {
                                                    MutableInteractionSource mutableInteractionSource = this.$interactionSource;
                                                    mutableState = this.$pressedInteraction;
                                                    PressInteraction.Cancel interaction3 = new PressInteraction.Cancel(oldValue);
                                                    if (mutableInteractionSource != null) {
                                                        this.L$0 = mutableState;
                                                        this.label = 1;
                                                        if (mutableInteractionSource.emit(interaction3, this) == coroutine_suspended) {
                                                            return coroutine_suspended;
                                                        }
                                                        mutableState2 = mutableState;
                                                        z = false;
                                                        mutableState = mutableState2;
                                                    }
                                                    mutableState.setValue(null);
                                                    break;
                                                }
                                                break;
                                            case 1:
                                                z = false;
                                                mutableState2 = (MutableState) this.L$0;
                                                ResultKt.throwOnFailure($result);
                                                mutableState = mutableState2;
                                                mutableState.setValue(null);
                                                break;
                                            case 2:
                                                interaction2 = (PressInteraction.Press) this.L$0;
                                                ResultKt.throwOnFailure($result);
                                                interaction = interaction2;
                                                this.$pressedInteraction.setValue(interaction);
                                                return Unit.INSTANCE;
                                            default:
                                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                        }
                                        interaction = new PressInteraction.Press(this.$it, null);
                                        MutableInteractionSource mutableInteractionSource2 = this.$interactionSource;
                                        if (mutableInteractionSource2 != null) {
                                            this.L$0 = interaction;
                                            this.label = 2;
                                            if (mutableInteractionSource2.emit(interaction, this) == coroutine_suspended) {
                                                return coroutine_suspended;
                                            }
                                            interaction2 = interaction;
                                            interaction = interaction2;
                                        }
                                        this.$pressedInteraction.setValue(interaction);
                                        return Unit.INSTANCE;
                                    }
                                }

                                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                public final Object invokeSuspend(Object $result) {
                                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                    switch (this.label) {
                                        case 0:
                                            ResultKt.throwOnFailure($result);
                                            PressGestureScope $this$detectTapAndPress = (PressGestureScope) this.L$0;
                                            long it = this.J$0;
                                            BuildersKt__Builders_commonKt.launch$default(this.$scope, null, null, new C00241(this.$pressedInteraction, it, this.$interactionSource, null), 3, null);
                                            this.label = 1;
                                            Object tryAwaitRelease = $this$detectTapAndPress.tryAwaitRelease(this);
                                            if (tryAwaitRelease != coroutine_suspended) {
                                                $result = tryAwaitRelease;
                                                break;
                                            } else {
                                                return coroutine_suspended;
                                            }
                                        case 1:
                                            ResultKt.throwOnFailure($result);
                                            break;
                                        default:
                                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                    }
                                    boolean success = ((Boolean) $result).booleanValue();
                                    BuildersKt__Builders_commonKt.launch$default(this.$scope, null, null, new AnonymousClass2(this.$pressedInteraction, success, this.$interactionSource, null), 3, null);
                                    return Unit.INSTANCE;
                                }

                                /* JADX INFO: Access modifiers changed from: package-private */
                                /* compiled from: TextFieldPressGestureFilter.kt */
                                @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
                                @DebugMetadata(c = "androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1$2", f = "TextFieldPressGestureFilter.kt", i = {}, l = {Property.VERTICAL_SCALING}, m = "invokeSuspend", n = {}, s = {})
                                /* renamed from: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1$1$2  reason: invalid class name */
                                /* loaded from: classes.dex */
                                public static final class AnonymousClass2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
                                    final /* synthetic */ MutableInteractionSource $interactionSource;
                                    final /* synthetic */ MutableState<PressInteraction.Press> $pressedInteraction;
                                    final /* synthetic */ boolean $success;
                                    Object L$0;
                                    int label;

                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    AnonymousClass2(MutableState<PressInteraction.Press> mutableState, boolean z, MutableInteractionSource mutableInteractionSource, Continuation<? super AnonymousClass2> continuation) {
                                        super(2, continuation);
                                        this.$pressedInteraction = mutableState;
                                        this.$success = z;
                                        this.$interactionSource = mutableInteractionSource;
                                    }

                                    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                                        return new AnonymousClass2(this.$pressedInteraction, this.$success, this.$interactionSource, continuation);
                                    }

                                    @Override // kotlin.jvm.functions.Function2
                                    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
                                        return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
                                    }

                                    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                                    public final Object invokeSuspend(Object $result) {
                                        MutableState<PressInteraction.Press> mutableState;
                                        PressInteraction interaction;
                                        MutableState<PressInteraction.Press> mutableState2;
                                        boolean z;
                                        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                                        switch (this.label) {
                                            case 0:
                                                ResultKt.throwOnFailure($result);
                                                PressInteraction.Press oldValue = this.$pressedInteraction.getValue();
                                                if (oldValue != null) {
                                                    boolean z2 = this.$success;
                                                    MutableInteractionSource mutableInteractionSource = this.$interactionSource;
                                                    mutableState = this.$pressedInteraction;
                                                    if (z2) {
                                                        interaction = new PressInteraction.Release(oldValue);
                                                    } else {
                                                        interaction = new PressInteraction.Cancel(oldValue);
                                                    }
                                                    if (mutableInteractionSource != null) {
                                                        this.L$0 = mutableState;
                                                        this.label = 1;
                                                        if (mutableInteractionSource.emit(interaction, this) == coroutine_suspended) {
                                                            return coroutine_suspended;
                                                        }
                                                        mutableState2 = mutableState;
                                                        z = false;
                                                        mutableState = mutableState2;
                                                    }
                                                    mutableState.setValue(null);
                                                    break;
                                                }
                                                break;
                                            case 1:
                                                z = false;
                                                mutableState2 = (MutableState) this.L$0;
                                                ResultKt.throwOnFailure($result);
                                                mutableState = mutableState2;
                                                mutableState.setValue(null);
                                                break;
                                            default:
                                                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                        }
                                        return Unit.INSTANCE;
                                    }
                                }
                            }

                            @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                            public final Object invoke(PointerInputScope $this$pointerInput, Continuation<? super Unit> continuation) {
                                final State<Function1<Offset, Unit>> state = onTapState;
                                Object detectTapAndPress = TapGestureDetectorKt.detectTapAndPress($this$pointerInput, new AnonymousClass1(CoroutineScope.this, pressedInteraction, mutableInteractionSource4, null), new Function1<Offset, Unit>() { // from class: androidx.compose.foundation.text.TextFieldPressGestureFilterKt$tapPressTextFieldModifier$1$2$1.2
                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    /* JADX WARN: Multi-variable type inference failed */
                                    {
                                        super(1);
                                    }

                                    @Override // kotlin.jvm.functions.Function1
                                    public /* bridge */ /* synthetic */ Unit invoke(Offset offset) {
                                        m1422invokek4lQ0M(offset.m4058unboximpl());
                                        return Unit.INSTANCE;
                                    }

                                    /* renamed from: invoke-k-4lQ0M  reason: not valid java name */
                                    public final void m1422invokek4lQ0M(long it) {
                                        state.getValue().invoke(Offset.m4037boximpl(it));
                                    }
                                }, continuation);
                                return detectTapAndPress == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? detectTapAndPress : Unit.INSTANCE;
                            }
                        };
                        $composer.updateRememberedValue(value$iv3);
                        it$iv3 = value$iv3;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer);
                    Modifier pointerInput = SuspendingPointerInputFilterKt.pointerInput(companion, mutableInteractionSource3, (PointerInputEventHandler) it$iv3);
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                    $composer.endReplaceGroup();
                    return pointerInput;
                }
            }, 1, null);
        }
        return $this$tapPressTextFieldModifier;
    }
}
