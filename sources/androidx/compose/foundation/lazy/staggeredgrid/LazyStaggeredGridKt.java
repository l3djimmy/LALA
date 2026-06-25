package androidx.compose.foundation.lazy.staggeredgrid;

import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.ScrollingContainerKt;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.ScrollableDefaults;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsModifierLocalKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutSemanticState;
import androidx.compose.foundation.lazy.layout.LazyLayoutSemanticsKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.EffectsKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.unit.Dp;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: LazyStaggeredGrid.kt */
@Metadata(d1 = {"\u0000R\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0093\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\r2\b\u0010\u0011\u001a\u0004\u0018\u00010\u00122\b\b\u0002\u0010\u0013\u001a\u00020\u00142\b\b\u0002\u0010\u0015\u001a\u00020\u00142\u0017\u0010\u0016\u001a\u0013\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00010\u0017¢\u0006\u0002\b\u0019H\u0001ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u001b\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u001c"}, d2 = {"LazyStaggeredGrid", "", "state", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;", "orientation", "Landroidx/compose/foundation/gestures/Orientation;", "slots", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyGridStaggeredGridSlotsProvider;", "modifier", "Landroidx/compose/ui/Modifier;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "reverseLayout", "", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "userScrollEnabled", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "mainAxisSpacing", "Landroidx/compose/ui/unit/Dp;", "crossAxisSpacing", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridScope;", "Lkotlin/ExtensionFunctionType;", "LazyStaggeredGrid-w41Enmo", "(Landroidx/compose/foundation/lazy/staggeredgrid/LazyStaggeredGridState;Landroidx/compose/foundation/gestures/Orientation;Landroidx/compose/foundation/lazy/staggeredgrid/LazyGridStaggeredGridSlotsProvider;Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/layout/PaddingValues;ZLandroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;FFLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyStaggeredGridKt {
    /* renamed from: LazyStaggeredGrid-w41Enmo  reason: not valid java name */
    public static final void m1201LazyStaggeredGridw41Enmo(final LazyStaggeredGridState state, final Orientation orientation, final LazyGridStaggeredGridSlotsProvider slots, Modifier modifier, PaddingValues contentPadding, boolean reverseLayout, FlingBehavior flingBehavior, boolean userScrollEnabled, final OverscrollEffect overscrollEffect, float mainAxisSpacing, float crossAxisSpacing, final Function1<? super LazyStaggeredGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object modifier2;
        Object obj;
        boolean z;
        Object obj2;
        int i2;
        int i3;
        Composer $composer2;
        final float crossAxisSpacing2;
        final PaddingValues contentPadding2;
        final FlingBehavior flingBehavior2;
        final boolean userScrollEnabled2;
        final float mainAxisSpacing2;
        final boolean reverseLayout2;
        final Modifier modifier3;
        FlingBehavior flingBehavior3;
        PaddingValues contentPadding3;
        FlingBehavior flingBehavior4;
        boolean userScrollEnabled3;
        float mainAxisSpacing3;
        int $dirty;
        boolean reverseLayout3;
        float crossAxisSpacing3;
        Modifier.Companion companion;
        int i4;
        Composer $composer3 = $composer.startRestartGroup(-1904835166);
        ComposerKt.sourceInformation($composer3, "C(LazyStaggeredGrid)P(10,6,9,5,1,8,3,11,7,4:c#ui.unit.Dp,2:c#ui.unit.Dp)63@2871L55,64@2952L24,65@3024L7,67@3064L310,79@3399L60,98@4046L302,93@3877L1173:LazyStaggeredGrid.kt#fzvcnm");
        int $dirty2 = $changed;
        int $dirty1 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changed(state) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty2 |= 48;
        } else if (($changed & 48) == 0) {
            $dirty2 |= $composer3.changed(orientation) ? 32 : 16;
        }
        if ((i & 4) != 0) {
            $dirty2 |= 384;
        } else if (($changed & 384) == 0) {
            $dirty2 |= ($changed & 512) == 0 ? $composer3.changed(slots) : $composer3.changedInstance(slots) ? 256 : 128;
        }
        int i5 = i & 8;
        if (i5 != 0) {
            $dirty2 |= 3072;
            modifier2 = modifier;
        } else if (($changed & 3072) == 0) {
            modifier2 = modifier;
            $dirty2 |= $composer3.changed(modifier2) ? 2048 : 1024;
        } else {
            modifier2 = modifier;
        }
        int i6 = i & 16;
        if (i6 != 0) {
            $dirty2 |= 24576;
            obj = contentPadding;
        } else if (($changed & 24576) == 0) {
            obj = contentPadding;
            $dirty2 |= $composer3.changed(obj) ? 16384 : 8192;
        } else {
            obj = contentPadding;
        }
        int i7 = i & 32;
        if (i7 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            z = reverseLayout;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            z = reverseLayout;
            $dirty2 |= $composer3.changed(z) ? 131072 : 65536;
        } else {
            z = reverseLayout;
        }
        if (($changed & 1572864) == 0) {
            if ((i & 64) == 0) {
                obj2 = flingBehavior;
                if ($composer3.changed(obj2)) {
                    i4 = 1048576;
                    $dirty2 |= i4;
                }
            } else {
                obj2 = flingBehavior;
            }
            i4 = 524288;
            $dirty2 |= i4;
        } else {
            obj2 = flingBehavior;
        }
        int i8 = i & 128;
        if (i8 != 0) {
            $dirty2 |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty2 |= $composer3.changed(userScrollEnabled) ? 8388608 : 4194304;
        }
        if ((i & 256) != 0) {
            $dirty2 |= 100663296;
        } else if (($changed & 100663296) == 0) {
            $dirty2 |= $composer3.changed(overscrollEffect) ? 67108864 : 33554432;
        }
        int i9 = i & 512;
        if (i9 != 0) {
            $dirty2 |= 805306368;
            i2 = i9;
        } else if (($changed & 805306368) == 0) {
            i2 = i9;
            $dirty2 |= $composer3.changed(mainAxisSpacing) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i2 = i9;
        }
        int i10 = i & 1024;
        if (i10 != 0) {
            $dirty1 |= 6;
            i3 = i10;
        } else if (($changed1 & 6) == 0) {
            i3 = i10;
            $dirty1 |= $composer3.changed(crossAxisSpacing) ? 4 : 2;
        } else {
            i3 = i10;
        }
        if ((i & 2048) != 0) {
            $dirty1 |= 48;
        } else if (($changed1 & 48) == 0) {
            $dirty1 |= $composer3.changedInstance(function1) ? 32 : 16;
        }
        int $dirty12 = $dirty1;
        if ($composer3.shouldExecute(((306783379 & $dirty2) == 306783378 && ($dirty12 & 19) == 18) ? false : true, $dirty2 & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "51@2365L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                Modifier.Companion modifier4 = i5 != 0 ? Modifier.Companion : modifier2;
                PaddingValues contentPadding4 = i6 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj;
                boolean reverseLayout4 = i7 != 0 ? false : z;
                if ((i & 64) != 0) {
                    flingBehavior3 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    $dirty2 &= -3670017;
                } else {
                    flingBehavior3 = obj2;
                }
                boolean userScrollEnabled4 = i8 != 0 ? true : userScrollEnabled;
                float mainAxisSpacing4 = i2 != 0 ? Dp.m6873constructorimpl(0) : mainAxisSpacing;
                if (i3 != 0) {
                    modifier2 = modifier4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = userScrollEnabled4;
                    $dirty = $dirty2;
                    reverseLayout3 = reverseLayout4;
                    crossAxisSpacing3 = Dp.m6873constructorimpl(0);
                    contentPadding3 = contentPadding4;
                    mainAxisSpacing3 = mainAxisSpacing4;
                } else {
                    modifier2 = modifier4;
                    contentPadding3 = contentPadding4;
                    flingBehavior4 = flingBehavior3;
                    userScrollEnabled3 = userScrollEnabled4;
                    mainAxisSpacing3 = mainAxisSpacing4;
                    $dirty = $dirty2;
                    reverseLayout3 = reverseLayout4;
                    crossAxisSpacing3 = crossAxisSpacing;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 64) != 0) {
                    $dirty2 &= -3670017;
                }
                userScrollEnabled3 = userScrollEnabled;
                mainAxisSpacing3 = mainAxisSpacing;
                crossAxisSpacing3 = crossAxisSpacing;
                contentPadding3 = obj;
                flingBehavior4 = obj2;
                $dirty = $dirty2;
                reverseLayout3 = z;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1904835166, $dirty, $dirty12, "androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGrid (LazyStaggeredGrid.kt:62)");
            }
            Function0 itemProviderLambda = LazyStaggeredGridItemProviderKt.rememberStaggeredGridItemProviderLambda(state, function1, $composer3, ($dirty & 14) | ($dirty12 & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            ComposerKt.sourceInformationMarkerStart($composer3, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
            PaddingValues contentPadding5 = contentPadding3;
            ComposerKt.sourceInformationMarkerStart($composer3, -954203484, "CC(remember):Effects.kt#9igjgp");
            Object value$iv$iv = $composer3.rememberedValue();
            if (value$iv$iv == Composer.Companion.getEmpty()) {
                value$iv$iv = EffectsKt.createCompositionCoroutineScope(EmptyCoroutineContext.INSTANCE, $composer3);
                $composer3.updateRememberedValue(value$iv$iv);
            }
            CoroutineScope coroutineScope = (CoroutineScope) value$iv$iv;
            ComposerKt.sourceInformationMarkerEnd($composer3);
            ComposerKt.sourceInformationMarkerEnd($composer3);
            ComposerKt.sourceInformationMarkerStart($composer3, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
            Object consume = $composer3.consume(CompositionLocalsKt.getLocalGraphicsContext());
            ComposerKt.sourceInformationMarkerEnd($composer3);
            GraphicsContext graphicsContext = (GraphicsContext) consume;
            boolean reverseLayout5 = reverseLayout3;
            float crossAxisSpacing4 = crossAxisSpacing3;
            int $dirty3 = $dirty;
            Function2 measurePolicy = LazyStaggeredGridMeasurePolicyKt.m1212rememberStaggeredGridMeasurePolicyqKj4JfE(state, itemProviderLambda, contentPadding5, reverseLayout5, orientation, mainAxisSpacing3, crossAxisSpacing4, coroutineScope, slots, graphicsContext, $composer3, ($dirty & 14) | (($dirty >> 6) & 896) | (($dirty >> 6) & 7168) | (($dirty << 9) & 57344) | (($dirty >> 12) & 458752) | (($dirty12 << 18) & 3670016) | (($dirty << 18) & 234881024));
            float mainAxisSpacing5 = mainAxisSpacing3;
            LazyLayoutSemanticState semanticState = LazyStaggeredGridSemanticsKt.rememberLazyStaggeredGridSemanticState(state, reverseLayout5, $composer3, ($dirty3 & 14) | (($dirty3 >> 12) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            if (userScrollEnabled3) {
                $composer3.startReplaceGroup(1913386186);
                ComposerKt.sourceInformation($composer3, "84@3602L57");
                companion = LazyLayoutBeyondBoundsModifierLocalKt.lazyLayoutBeyondBoundsModifier(Modifier.Companion, LazyStaggeredGridBeyondBoundsModifierKt.rememberLazyStaggeredGridBeyondBoundsState(state, $composer3, $dirty3 & 14), state.getBeyondBoundsInfo$foundation_release(), reverseLayout5, orientation);
                $composer3.endReplaceGroup();
            } else {
                $composer3.startReplaceGroup(1913691040);
                $composer3.endReplaceGroup();
                companion = Modifier.Companion;
            }
            Modifier beyondBoundsModifier = companion;
            boolean userScrollEnabled5 = userScrollEnabled3;
            $composer2 = $composer3;
            FlingBehavior flingBehavior5 = flingBehavior4;
            LazyLayoutKt.LazyLayout(itemProviderLambda, ScrollingContainerKt.scrollingContainer$default(LazyLayoutSemanticsKt.lazyLayoutSemantics(modifier2.then(state.getRemeasurementModifier$foundation_release()).then(state.getAwaitLayoutModifier$foundation_release()), itemProviderLambda, semanticState, orientation, userScrollEnabled5, reverseLayout5, $composer3, ($dirty3 & 458752) | (($dirty3 << 6) & 7168) | (($dirty3 >> 9) & 57344)).then(beyondBoundsModifier).then(state.getItemAnimator$foundation_release().getModifier()), state, orientation, userScrollEnabled5, reverseLayout5, flingBehavior5, state.getMutableInteractionSource$foundation_release(), false, overscrollEffect, null, 256, null), state.getPrefetchState$foundation_release(), measurePolicy, $composer2, 0, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            userScrollEnabled2 = userScrollEnabled5;
            flingBehavior2 = flingBehavior5;
            contentPadding2 = contentPadding5;
            mainAxisSpacing2 = mainAxisSpacing5;
            crossAxisSpacing2 = crossAxisSpacing4;
            reverseLayout2 = reverseLayout5;
            modifier3 = modifier2;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            crossAxisSpacing2 = crossAxisSpacing;
            contentPadding2 = obj;
            flingBehavior2 = obj2;
            userScrollEnabled2 = userScrollEnabled;
            mainAxisSpacing2 = mainAxisSpacing;
            reverseLayout2 = z;
            modifier3 = modifier2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.staggeredgrid.LazyStaggeredGridKt$LazyStaggeredGrid$1
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

                public final void invoke(Composer composer, int i11) {
                    LazyStaggeredGridKt.m1201LazyStaggeredGridw41Enmo(LazyStaggeredGridState.this, orientation, slots, modifier3, contentPadding2, reverseLayout2, flingBehavior2, userScrollEnabled2, overscrollEffect, mainAxisSpacing2, crossAxisSpacing2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }
}
