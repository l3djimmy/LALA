package androidx.compose.foundation.lazy.layout;

import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.runtime.saveable.SaveableStateHolder;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.SubcomposeLayoutKt;
import androidx.compose.ui.layout.SubcomposeLayoutState;
import androidx.compose.ui.layout.SubcomposeMeasureScope;
import androidx.compose.ui.unit.Constraints;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
/* compiled from: LazyLayout.kt */
@Metadata(d1 = {"\u0000<\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001aP\u0010\u0002\u001a\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\b\b\u0002\u0010\u0007\u001a\u00020\b2\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\u001d\u0010\u000b\u001a\u0019\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000f0\f¢\u0006\u0002\b\u0010H\u0007¢\u0006\u0002\u0010\u0011\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"MaxItemsToRetainForReuse", "", "LazyLayout", "", "itemProvider", "Lkotlin/Function0;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutItemProvider;", "modifier", "Landroidx/compose/ui/Modifier;", "prefetchState", "Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState;", "measurePolicy", "Lkotlin/Function2;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;", "Landroidx/compose/ui/unit/Constraints;", "Landroidx/compose/ui/layout/MeasureResult;", "Lkotlin/ExtensionFunctionType;", "(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/layout/LazyLayoutPrefetchState;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyLayoutKt {
    private static final int MaxItemsToRetainForReuse = 7;

    public static final void LazyLayout(final Function0<? extends LazyLayoutItemProvider> function0, final Modifier modifier, final LazyLayoutPrefetchState prefetchState, final Function2<? super LazyLayoutMeasureScope, ? super Constraints, ? extends MeasureResult> function2, Composer $composer, final int $changed, final int i) {
        Composer $composer2 = $composer.startRestartGroup(2002163445);
        ComposerKt.sourceInformation($composer2, "C(LazyLayout)P(!1,2,3)53@2280L34,55@2352L1209,55@2320L1241:LazyLayout.kt#wow0x6");
        int $dirty = $changed;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(function0) ? 4 : 2;
        }
        int i2 = i & 2;
        if (i2 != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(modifier) ? 32 : 16;
        }
        int i3 = i & 4;
        if (i3 != 0) {
            $dirty |= 384;
        } else if (($changed & 384) == 0) {
            $dirty |= $composer2.changed(prefetchState) ? 256 : 128;
        }
        if ((i & 8) != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer2.changedInstance(function2) ? 2048 : 1024;
        }
        int $dirty2 = $dirty;
        if ($composer2.shouldExecute(($dirty2 & 1171) != 1170, $dirty2 & 1)) {
            if (i2 != 0) {
                modifier = Modifier.Companion;
            }
            if (i3 != 0) {
                prefetchState = null;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2002163445, $dirty2, -1, "androidx.compose.foundation.lazy.layout.LazyLayout (LazyLayout.kt:52)");
            }
            final State currentItemProvider = SnapshotStateKt.rememberUpdatedState(function0, $composer2, $dirty2 & 14);
            LazySaveableStateHolderKt.LazySaveableStateHolderProvider(ComposableLambdaKt.rememberComposableLambda(-1488997347, true, new Function3<SaveableStateHolder, Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Unit invoke(SaveableStateHolder saveableStateHolder, Composer composer, Integer num) {
                    invoke(saveableStateHolder, composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(SaveableStateHolder saveableStateHolder, Composer $composer3, int $changed2) {
                    ComposerKt.sourceInformation($composer3, "C56@2410L114,59@2561L101,74@3281L264,71@3154L401:LazyLayout.kt#wow0x6");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-1488997347, $changed2, -1, "androidx.compose.foundation.lazy.layout.LazyLayout.<anonymous> (LazyLayout.kt:56)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer3, 6580179, "CC(remember):LazyLayout.kt#9igjgp");
                    final State<Function0<LazyLayoutItemProvider>> state = currentItemProvider;
                    Object it$iv = $composer3.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = new LazyLayoutItemContentFactory(saveableStateHolder, new Function0<LazyLayoutItemProvider>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$1$itemContentFactory$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            /* JADX WARN: Multi-variable type inference failed */
                            {
                                super(0);
                            }

                            /* JADX WARN: Can't rename method to resolve collision */
                            @Override // kotlin.jvm.functions.Function0
                            public final LazyLayoutItemProvider invoke() {
                                return state.getValue().invoke();
                            }
                        });
                        $composer3.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    final LazyLayoutItemContentFactory itemContentFactory = (LazyLayoutItemContentFactory) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    ComposerKt.sourceInformationMarkerStart($composer3, 6584998, "CC(remember):LazyLayout.kt#9igjgp");
                    Object it$iv2 = $composer3.rememberedValue();
                    if (it$iv2 == Composer.Companion.getEmpty()) {
                        Object value$iv2 = new SubcomposeLayoutState(new LazyLayoutItemReusePolicy(itemContentFactory));
                        $composer3.updateRememberedValue(value$iv2);
                        it$iv2 = value$iv2;
                    }
                    final SubcomposeLayoutState subcomposeLayoutState = (SubcomposeLayoutState) it$iv2;
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    if (LazyLayoutPrefetchState.this != null) {
                        $composer3.startReplaceGroup(204281539);
                        ComposerKt.sourceInformation($composer3, "64@2894L240,64@2809L325");
                        final PrefetchScheduler executor = LazyLayoutPrefetchState.this.getPrefetchScheduler$foundation_release();
                        if (executor == null) {
                            $composer3.startReplaceGroup(6591363);
                            ComposerKt.sourceInformation($composer3, "63@2762L34");
                            executor = PrefetchScheduler_androidKt.rememberDefaultPrefetchScheduler($composer3, 0);
                        } else {
                            $composer3.startReplaceGroup(6590278);
                        }
                        $composer3.endReplaceGroup();
                        Object[] objArr = {LazyLayoutPrefetchState.this, itemContentFactory, subcomposeLayoutState, executor};
                        ComposerKt.sourceInformationMarkerStart($composer3, 6595793, "CC(remember):LazyLayout.kt#9igjgp");
                        boolean invalid$iv = $composer3.changed(LazyLayoutPrefetchState.this) | $composer3.changedInstance(itemContentFactory) | $composer3.changedInstance(subcomposeLayoutState) | $composer3.changedInstance(executor);
                        final LazyLayoutPrefetchState lazyLayoutPrefetchState = LazyLayoutPrefetchState.this;
                        Object it$iv3 = $composer3.rememberedValue();
                        if (invalid$iv || it$iv3 == Composer.Companion.getEmpty()) {
                            Object value$iv3 = (Function1) new Function1<DisposableEffectScope, DisposableEffectResult>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$1$1$1
                                /* JADX INFO: Access modifiers changed from: package-private */
                                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                {
                                    super(1);
                                }

                                @Override // kotlin.jvm.functions.Function1
                                public final DisposableEffectResult invoke(DisposableEffectScope $this$DisposableEffect) {
                                    LazyLayoutPrefetchState.this.setPrefetchHandleProvider$foundation_release(new PrefetchHandleProvider(itemContentFactory, subcomposeLayoutState, executor));
                                    final LazyLayoutPrefetchState lazyLayoutPrefetchState2 = LazyLayoutPrefetchState.this;
                                    return new DisposableEffectResult() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$1$1$1$invoke$$inlined$onDispose$1
                                        @Override // androidx.compose.runtime.DisposableEffectResult
                                        public void dispose() {
                                            LazyLayoutPrefetchState.this.setPrefetchHandleProvider$foundation_release(null);
                                        }
                                    };
                                }
                            };
                            $composer3.updateRememberedValue(value$iv3);
                            it$iv3 = value$iv3;
                        }
                        ComposerKt.sourceInformationMarkerEnd($composer3);
                        EffectsKt.DisposableEffect(objArr, (Function1<? super DisposableEffectScope, ? extends DisposableEffectResult>) it$iv3, $composer3, 0);
                        $composer3.endReplaceGroup();
                    } else {
                        $composer3.startReplaceGroup(204710145);
                        $composer3.endReplaceGroup();
                    }
                    Modifier traversablePrefetchState = LazyLayoutPrefetchStateKt.traversablePrefetchState(modifier, LazyLayoutPrefetchState.this);
                    ComposerKt.sourceInformationMarkerStart($composer3, 6608201, "CC(remember):LazyLayout.kt#9igjgp");
                    boolean invalid$iv2 = $composer3.changed(itemContentFactory) | $composer3.changed(function2);
                    final Function2<LazyLayoutMeasureScope, Constraints, MeasureResult> function22 = function2;
                    Object it$iv4 = $composer3.rememberedValue();
                    if (invalid$iv2 || it$iv4 == Composer.Companion.getEmpty()) {
                        Object value$iv4 = (Function2) new Function2<SubcomposeMeasureScope, Constraints, MeasureResult>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$1$2$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                            /* JADX WARN: Multi-variable type inference failed */
                            {
                                super(2);
                            }

                            @Override // kotlin.jvm.functions.Function2
                            public /* bridge */ /* synthetic */ MeasureResult invoke(SubcomposeMeasureScope subcomposeMeasureScope, Constraints constraints) {
                                return m1166invoke0kLqBqw(subcomposeMeasureScope, constraints.m6832unboximpl());
                            }

                            /* renamed from: invoke-0kLqBqw  reason: not valid java name */
                            public final MeasureResult m1166invoke0kLqBqw(SubcomposeMeasureScope $this$null, long constraints) {
                                LazyLayoutMeasureScopeImpl $this$invoke_0kLqBqw_u24lambda_u240 = new LazyLayoutMeasureScopeImpl(LazyLayoutItemContentFactory.this, $this$null);
                                return function22.invoke($this$invoke_0kLqBqw_u24lambda_u240, Constraints.m6813boximpl(constraints));
                            }
                        };
                        $composer3.updateRememberedValue(value$iv4);
                        it$iv4 = value$iv4;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    SubcomposeLayoutKt.SubcomposeLayout(subcomposeLayoutState, traversablePrefetchState, (Function2) it$iv4, $composer3, SubcomposeLayoutState.$stable, 0);
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventEnd();
                    }
                }
            }, $composer2, 54), $composer2, 6);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        final Modifier modifier2 = modifier;
        final LazyLayoutPrefetchState prefetchState2 = prefetchState;
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.layout.LazyLayoutKt$LazyLayout$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i4) {
                    LazyLayoutKt.LazyLayout(function0, modifier2, prefetchState2, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }
}
