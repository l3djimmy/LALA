package androidx.compose.animation;

import androidx.collection.MutableScatterMap;
import androidx.compose.animation.SharedTransitionScope;
import androidx.compose.animation.core.AnimationSpecKt;
import androidx.compose.animation.core.FiniteAnimationSpec;
import androidx.compose.animation.core.SpringSpec;
import androidx.compose.animation.core.VisibilityThresholdsKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.DisposableEffectResult;
import androidx.compose.runtime.DisposableEffectScope;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.internal.ComposableLambdaKt;
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.draw.DrawModifierKt;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.drawscope.ContentDrawScope;
import androidx.compose.ui.layout.ContentScale;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutModifierKt;
import androidx.compose.ui.layout.LookaheadScope;
import androidx.compose.ui.layout.LookaheadScopeKt;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.MeasureScope;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: SharedTransitionScope.kt */
@Metadata(d1 = {"\u0000h\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u001a\u0018\u0010\u001b\u001a\u00020\u00152\u0006\u0010\u001c\u001a\u00020\u00132\u0006\u0010\u001d\u001a\u00020\u0014H\u0003\u001a5\u0010\u001e\u001a\u00020\u001f2\b\b\u0002\u0010 \u001a\u00020!2\u001c\u0010\"\u001a\u0018\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020\u001f0#¢\u0006\u0002\b%¢\u0006\u0002\b&H\u0007¢\u0006\u0002\u0010'\u001a1\u0010(\u001a\u00020\u001f2\"\u0010\"\u001a\u001e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020!\u0012\u0004\u0012\u00020\u001f0\u0005¢\u0006\u0002\b%¢\u0006\u0002\b&H\u0007¢\u0006\u0002\u0010)\"\u0016\u0010\u0000\u001a\u00020\u00018\u0002X\u0083\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0002\u0010\u0003\"\"\u0010\u0004\u001a\u0016\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0007\u0012\u0006\u0012\u0004\u0018\u00010\b0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0014\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004¢\u0006\u0002\n\u0000\"\u0016\u0010\f\u001a\u00020\r8\u0002X\u0083\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u000e\u0010\u0003\"\u000e\u0010\u000f\u001a\u00020\u0010X\u0080T¢\u0006\u0002\n\u0000\".\u0010\u0011\u001a\u001a\u0012\u0004\u0012\u00020\u0013\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u00150\u00120\u00128\u0002X\u0083\u0004¢\u0006\b\n\u0000\u0012\u0004\b\u0016\u0010\u0003\"\u0018\u0010\u0017\u001a\u00020\u0010*\u00020\u00148BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u0019\"\u0018\u0010\u0017\u001a\u00020\u0010*\u00020\u00138BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0018\u0010\u001a¨\u0006*"}, d2 = {"DefaultBoundsTransform", "Landroidx/compose/animation/BoundsTransform;", "getDefaultBoundsTransform$annotations", "()V", "DefaultClipInOverlayDuringTransition", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/LayoutDirection;", "Landroidx/compose/ui/unit/Density;", "Landroidx/compose/ui/graphics/Path;", "DefaultSpring", "Landroidx/compose/animation/core/SpringSpec;", "Landroidx/compose/ui/geometry/Rect;", "ParentClip", "Landroidx/compose/animation/SharedTransitionScope$OverlayClip;", "getParentClip$annotations", "VisualDebugging", "", "cachedScaleToBoundsImplMap", "Landroidx/collection/MutableScatterMap;", "Landroidx/compose/ui/layout/ContentScale;", "Landroidx/compose/ui/Alignment;", "Landroidx/compose/animation/ScaleToBoundsImpl;", "getCachedScaleToBoundsImplMap$annotations", "shouldCache", "getShouldCache", "(Landroidx/compose/ui/Alignment;)Z", "(Landroidx/compose/ui/layout/ContentScale;)Z", "ScaleToBoundsCached", "contentScale", "alignment", "SharedTransitionLayout", "", "modifier", "Landroidx/compose/ui/Modifier;", "content", "Lkotlin/Function1;", "Landroidx/compose/animation/SharedTransitionScope;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;II)V", "SharedTransitionScope", "(Lkotlin/jvm/functions/Function4;Landroidx/compose/runtime/Composer;I)V", "animation"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class SharedTransitionScopeKt {
    public static final boolean VisualDebugging = false;
    private static final SpringSpec<Rect> DefaultSpring = AnimationSpecKt.spring$default(0.0f, 400.0f, VisibilityThresholdsKt.getVisibilityThreshold(Rect.Companion), 1, null);
    private static final SharedTransitionScope.OverlayClip ParentClip = new SharedTransitionScope.OverlayClip() { // from class: androidx.compose.animation.SharedTransitionScopeKt$ParentClip$1
        @Override // androidx.compose.animation.SharedTransitionScope.OverlayClip
        public Path getClipPath(SharedTransitionScope.SharedContentState sharedContentState, Rect bounds, LayoutDirection layoutDirection, Density density) {
            SharedTransitionScope.SharedContentState parentSharedContentState = sharedContentState.getParentSharedContentState();
            if (parentSharedContentState != null) {
                return parentSharedContentState.getClipPathInOverlay();
            }
            return null;
        }
    };
    private static final Function2<LayoutDirection, Density, Path> DefaultClipInOverlayDuringTransition = new Function2() { // from class: androidx.compose.animation.SharedTransitionScopeKt$DefaultClipInOverlayDuringTransition$1
        @Override // kotlin.jvm.functions.Function2
        public final Void invoke(LayoutDirection layoutDirection, Density density) {
            return null;
        }
    };
    private static final BoundsTransform DefaultBoundsTransform = new BoundsTransform() { // from class: androidx.compose.animation.SharedTransitionScopeKt$$ExternalSyntheticLambda0
        @Override // androidx.compose.animation.BoundsTransform
        public final FiniteAnimationSpec transform(Rect rect, Rect rect2) {
            FiniteAnimationSpec finiteAnimationSpec;
            finiteAnimationSpec = SharedTransitionScopeKt.DefaultSpring;
            return finiteAnimationSpec;
        }
    };
    private static final MutableScatterMap<ContentScale, MutableScatterMap<Alignment, ScaleToBoundsImpl>> cachedScaleToBoundsImplMap = new MutableScatterMap<>(0, 1, null);

    private static /* synthetic */ void getCachedScaleToBoundsImplMap$annotations() {
    }

    private static /* synthetic */ void getDefaultBoundsTransform$annotations() {
    }

    private static /* synthetic */ void getParentClip$annotations() {
    }

    public static final void SharedTransitionLayout(final Modifier modifier, final Function3<? super SharedTransitionScope, ? super Composer, ? super Integer, Unit> function3, Composer $composer, final int $changed, final int i) {
        Composer $composer2 = $composer.startRestartGroup(2043053727);
        ComposerKt.sourceInformation($composer2, "C(SharedTransitionLayout)P(1)99@4829L279,99@4807L301:SharedTransitionScope.kt#xbi5r1");
        int $dirty = $changed;
        int i2 = i & 1;
        if (i2 != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer2.changed(modifier) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer2.changedInstance(function3) ? 32 : 16;
        }
        if ($composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (i2 != 0) {
                modifier = Modifier.Companion;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2043053727, $dirty, -1, "androidx.compose.animation.SharedTransitionLayout (SharedTransitionScope.kt:98)");
            }
            SharedTransitionScope(ComposableLambdaKt.rememberComposableLambda(-130587847, true, new Function4<SharedTransitionScope, Modifier, Composer, Integer, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionLayout$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(4);
                }

                @Override // kotlin.jvm.functions.Function4
                public /* bridge */ /* synthetic */ Unit invoke(SharedTransitionScope sharedTransitionScope, Modifier modifier2, Composer composer, Integer num) {
                    invoke(sharedTransitionScope, modifier2, composer, num.intValue());
                    return Unit.INSTANCE;
                }

                /* JADX WARN: Removed duplicated region for block: B:42:0x0176  */
                /* JADX WARN: Removed duplicated region for block: B:45:? A[RETURN, SYNTHETIC] */
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final void invoke(androidx.compose.animation.SharedTransitionScope r29, androidx.compose.ui.Modifier r30, androidx.compose.runtime.Composer r31, int r32) {
                    /*
                        Method dump skipped, instructions count: 384
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionLayout$1.invoke(androidx.compose.animation.SharedTransitionScope, androidx.compose.ui.Modifier, androidx.compose.runtime.Composer, int):void");
                }
            }, $composer2, 54), $composer2, 6);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionLayout$2
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

                public final void invoke(Composer composer, int i3) {
                    SharedTransitionScopeKt.SharedTransitionLayout(Modifier.this, function3, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    public static final void SharedTransitionScope(final Function4<? super SharedTransitionScope, ? super Modifier, ? super Composer, ? super Integer, Unit> function4, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(-2093217917);
        ComposerKt.sourceInformation($composer2, "C(SharedTransitionScope)122@6005L1014,122@5990L1029:SharedTransitionScope.kt#xbi5r1");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(function4) ? 4 : 2;
        }
        if ($composer2.shouldExecute(($dirty & 3) != 2, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-2093217917, $dirty, -1, "androidx.compose.animation.SharedTransitionScope (SharedTransitionScope.kt:121)");
            }
            LookaheadScopeKt.LookaheadScope(ComposableLambdaKt.rememberComposableLambda(-863967934, true, new Function3<LookaheadScope, Composer, Integer, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(3);
                }

                @Override // kotlin.jvm.functions.Function3
                public /* bridge */ /* synthetic */ Unit invoke(LookaheadScope lookaheadScope, Composer composer, Integer num) {
                    invoke(lookaheadScope, composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(LookaheadScope $this$LookaheadScope, Composer $composer3, int $changed2) {
                    ComposerKt.sourceInformation($composer3, "C123@6036L24,124@6087L60,126@6205L586,140@6825L105,125@6168L772,145@6972L41,145@6949L64:SharedTransitionScope.kt#xbi5r1");
                    if (ComposerKt.isTraceInProgress()) {
                        ComposerKt.traceEventStart(-863967934, $changed2, -1, "androidx.compose.animation.SharedTransitionScope.<anonymous> (SharedTransitionScope.kt:123)");
                    }
                    ComposerKt.sourceInformationMarkerStart($composer3, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
                    ComposerKt.sourceInformationMarkerStart($composer3, -954203484, "CC(remember):Effects.kt#9igjgp");
                    Object it$iv$iv = $composer3.rememberedValue();
                    if (it$iv$iv == Composer.Companion.getEmpty()) {
                        Object value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer3);
                        $composer3.updateRememberedValue(value$iv$iv);
                        it$iv$iv = value$iv$iv;
                    }
                    CoroutineScope coroutineScope = (CoroutineScope) it$iv$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    ComposerKt.sourceInformationMarkerStart($composer3, -538792118, "CC(remember):SharedTransitionScope.kt#9igjgp");
                    Object it$iv = $composer3.rememberedValue();
                    if (it$iv == Composer.Companion.getEmpty()) {
                        Object value$iv = new SharedTransitionScopeImpl($this$LookaheadScope, coroutineScope);
                        $composer3.updateRememberedValue(value$iv);
                        it$iv = value$iv;
                    }
                    final SharedTransitionScopeImpl sharedScope = (SharedTransitionScopeImpl) it$iv;
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    Function4<SharedTransitionScope, Modifier, Composer, Integer, Unit> function42 = function4;
                    Modifier.Companion companion = Modifier.Companion;
                    ComposerKt.sourceInformationMarkerStart($composer3, -538787816, "CC(remember):SharedTransitionScope.kt#9igjgp");
                    Object it$iv2 = $composer3.rememberedValue();
                    if (it$iv2 == Composer.Companion.getEmpty()) {
                        Object value$iv2 = (Function3) new Function3<MeasureScope, Measurable, Constraints, MeasureResult>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1$1$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            {
                                super(3);
                            }

                            @Override // kotlin.jvm.functions.Function3
                            public /* bridge */ /* synthetic */ MeasureResult invoke(MeasureScope measureScope, Measurable measurable, Constraints constraints) {
                                return m377invoke3p2s80s(measureScope, measurable, constraints.m6832unboximpl());
                            }

                            /* renamed from: invoke-3p2s80s  reason: not valid java name */
                            public final MeasureResult m377invoke3p2s80s(final MeasureScope $this$layout, Measurable measurable, long constraints) {
                                final Placeable p = measurable.mo5637measureBRTryo0(constraints);
                                int width = p.getWidth();
                                int height = p.getHeight();
                                final SharedTransitionScopeImpl sharedTransitionScopeImpl = SharedTransitionScopeImpl.this;
                                return MeasureScope.layout$default($this$layout, width, height, null, new Function1<Placeable.PlacementScope, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1$1$1.1
                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    {
                                        super(1);
                                    }

                                    @Override // kotlin.jvm.functions.Function1
                                    public /* bridge */ /* synthetic */ Unit invoke(Placeable.PlacementScope placementScope) {
                                        invoke2(placementScope);
                                        return Unit.INSTANCE;
                                    }

                                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                                    public final void invoke2(Placeable.PlacementScope $this$layout2) {
                                        LayoutCoordinates coords = $this$layout2.getCoordinates();
                                        if (coords != null) {
                                            boolean isLookingAhead = MeasureScope.this.isLookingAhead();
                                            SharedTransitionScopeImpl sharedTransitionScopeImpl2 = sharedTransitionScopeImpl;
                                            if (!isLookingAhead) {
                                                sharedTransitionScopeImpl2.setRoot$animation(coords);
                                            } else {
                                                sharedTransitionScopeImpl2.setNullableLookaheadRoot$animation(coords);
                                            }
                                        }
                                        Placeable.PlacementScope.place$default($this$layout2, p, 0, 0, 0.0f, 4, null);
                                    }
                                }, 4, null);
                            }
                        };
                        $composer3.updateRememberedValue(value$iv2);
                        it$iv2 = value$iv2;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    Modifier layout = LayoutModifierKt.layout(companion, (Function3) it$iv2);
                    ComposerKt.sourceInformationMarkerStart($composer3, -538768457, "CC(remember):SharedTransitionScope.kt#9igjgp");
                    Object it$iv3 = $composer3.rememberedValue();
                    if (it$iv3 == Composer.Companion.getEmpty()) {
                        Object value$iv3 = (Function1) new Function1<ContentDrawScope, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1$2$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            {
                                super(1);
                            }

                            @Override // kotlin.jvm.functions.Function1
                            public /* bridge */ /* synthetic */ Unit invoke(ContentDrawScope contentDrawScope) {
                                invoke2(contentDrawScope);
                                return Unit.INSTANCE;
                            }

                            /* renamed from: invoke  reason: avoid collision after fix types in other method */
                            public final void invoke2(ContentDrawScope $this$drawWithContent) {
                                $this$drawWithContent.drawContent();
                                SharedTransitionScopeImpl.this.drawInOverlay$animation($this$drawWithContent);
                            }
                        };
                        $composer3.updateRememberedValue(value$iv3);
                        it$iv3 = value$iv3;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    function42.invoke(sharedScope, DrawModifierKt.drawWithContent(layout, (Function1) it$iv3), $composer3, 6);
                    Unit unit = Unit.INSTANCE;
                    ComposerKt.sourceInformationMarkerStart($composer3, -538763817, "CC(remember):SharedTransitionScope.kt#9igjgp");
                    Object it$iv4 = $composer3.rememberedValue();
                    if (it$iv4 == Composer.Companion.getEmpty()) {
                        Object value$iv4 = (Function1) new Function1<DisposableEffectScope, DisposableEffectResult>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1$3$1
                            /* JADX INFO: Access modifiers changed from: package-private */
                            {
                                super(1);
                            }

                            @Override // kotlin.jvm.functions.Function1
                            public final DisposableEffectResult invoke(DisposableEffectScope $this$DisposableEffect) {
                                final SharedTransitionScopeImpl sharedTransitionScopeImpl = SharedTransitionScopeImpl.this;
                                return new DisposableEffectResult() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$1$3$1$invoke$$inlined$onDispose$1
                                    @Override // androidx.compose.runtime.DisposableEffectResult
                                    public void dispose() {
                                        SharedTransitionScopeImpl.this.onDispose$animation();
                                    }
                                };
                            }
                        };
                        $composer3.updateRememberedValue(value$iv4);
                        it$iv4 = value$iv4;
                    }
                    ComposerKt.sourceInformationMarkerEnd($composer3);
                    EffectsKt.DisposableEffect(unit, (Function1) it$iv4, $composer3, 54);
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
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.animation.SharedTransitionScopeKt$SharedTransitionScope$2
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

                public final void invoke(Composer composer, int i) {
                    SharedTransitionScopeKt.SharedTransitionScope(function4, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final ScaleToBoundsImpl ScaleToBoundsCached(ContentScale contentScale, Alignment alignment) {
        if (getShouldCache(contentScale) && getShouldCache(alignment)) {
            MutableScatterMap this_$iv = cachedScaleToBoundsImplMap;
            MutableScatterMap<Alignment, ScaleToBoundsImpl> this_$iv2 = this_$iv.get(contentScale);
            if (this_$iv2 == null) {
                this_$iv2 = new MutableScatterMap<>(0, 1, null);
                this_$iv.set(contentScale, this_$iv2);
            }
            MutableScatterMap map = this_$iv2;
            ScaleToBoundsImpl scaleToBoundsImpl = map.get(alignment);
            if (scaleToBoundsImpl == null) {
                scaleToBoundsImpl = new ScaleToBoundsImpl(contentScale, alignment);
                map.set(alignment, scaleToBoundsImpl);
            }
            return scaleToBoundsImpl;
        }
        return new ScaleToBoundsImpl(contentScale, alignment);
    }

    private static final boolean getShouldCache(Alignment $this$shouldCache) {
        return $this$shouldCache == Alignment.Companion.getTopStart() || $this$shouldCache == Alignment.Companion.getTopCenter() || $this$shouldCache == Alignment.Companion.getTopEnd() || $this$shouldCache == Alignment.Companion.getCenterStart() || $this$shouldCache == Alignment.Companion.getCenter() || $this$shouldCache == Alignment.Companion.getCenterEnd() || $this$shouldCache == Alignment.Companion.getBottomStart() || $this$shouldCache == Alignment.Companion.getBottomCenter() || $this$shouldCache == Alignment.Companion.getBottomEnd();
    }

    private static final boolean getShouldCache(ContentScale $this$shouldCache) {
        return $this$shouldCache == ContentScale.Companion.getFillWidth() || $this$shouldCache == ContentScale.Companion.getFillHeight() || $this$shouldCache == ContentScale.Companion.getFillBounds() || $this$shouldCache == ContentScale.Companion.getFit() || $this$shouldCache == ContentScale.Companion.getCrop() || $this$shouldCache == ContentScale.Companion.getNone() || $this$shouldCache == ContentScale.Companion.getInside();
    }
}
