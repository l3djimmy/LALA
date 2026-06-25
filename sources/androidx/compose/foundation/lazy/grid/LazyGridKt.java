package androidx.compose.foundation.lazy.grid;

import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.ScrollingContainerKt;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.gestures.ScrollableDefaults;
import androidx.compose.foundation.layout.Arrangement;
import androidx.compose.foundation.layout.PaddingKt;
import androidx.compose.foundation.layout.PaddingValues;
import androidx.compose.foundation.lazy.layout.LazyLayoutBeyondBoundsModifierLocalKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutKt;
import androidx.compose.foundation.lazy.layout.LazyLayoutSemanticState;
import androidx.compose.foundation.lazy.layout.LazyLayoutSemanticsKt;
import androidx.compose.foundation.lazy.layout.StickyItemsPlacement;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocal;
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
/* compiled from: LazyGrid.kt */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u0088\u0001\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u000b2\b\b\u0002\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000b2\b\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\u0017\u0010\u0016\u001a\u0013\u0012\u0004\u0012\u00020\u0018\u0012\u0004\u0012\u00020\u00010\u0017¢\u0006\u0002\b\u0019H\u0001¢\u0006\u0002\u0010\u001a\u001a\u0088\u0001\u0010\u001b\u001a\u0019\u0012\u0004\u0012\u00020\u001d\u0012\u0004\u0012\u00020\u001e\u0012\u0004\u0012\u00020\u001f0\u001c¢\u0006\u0002\b\u00192\f\u0010 \u001a\b\u0012\u0004\u0012\u00020\"0!2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u000b2\b\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010#\u001a\u00020$2\u0006\u0010%\u001a\u00020&2\b\u0010'\u001a\u0004\u0018\u00010(H\u0003¢\u0006\u0002\u0010)¨\u0006*"}, d2 = {"LazyGrid", "", "modifier", "Landroidx/compose/ui/Modifier;", "state", "Landroidx/compose/foundation/lazy/grid/LazyGridState;", "slots", "Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "reverseLayout", "", "isVertical", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "userScrollEnabled", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/lazy/grid/LazyGridScope;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;Landroidx/compose/foundation/layout/PaddingValues;ZZLandroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "rememberLazyGridMeasurePolicy", "Lkotlin/Function2;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;", "Landroidx/compose/ui/unit/Constraints;", "Landroidx/compose/ui/layout/MeasureResult;", "itemProviderLambda", "Lkotlin/Function0;", "Landroidx/compose/foundation/lazy/grid/LazyGridItemProvider;", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "graphicsContext", "Landroidx/compose/ui/graphics/GraphicsContext;", "stickyItemsScrollBehavior", "Landroidx/compose/foundation/lazy/layout/StickyItemsPlacement;", "(Lkotlin/jvm/functions/Function0;Landroidx/compose/foundation/lazy/grid/LazyGridState;Landroidx/compose/foundation/lazy/grid/LazyGridSlotsProvider;Landroidx/compose/foundation/layout/PaddingValues;ZZLandroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/ui/graphics/GraphicsContext;Landroidx/compose/foundation/lazy/layout/StickyItemsPlacement;Landroidx/compose/runtime/Composer;II)Lkotlin/jvm/functions/Function2;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyGridKt {
    public static final void LazyGrid(Modifier modifier, LazyGridState state, final LazyGridSlotsProvider slots, PaddingValues contentPadding, boolean reverseLayout, final boolean isVertical, FlingBehavior flingBehavior, final boolean userScrollEnabled, final OverscrollEffect overscrollEffect, final Arrangement.Vertical verticalArrangement, final Arrangement.Horizontal horizontalArrangement, final Function1<? super LazyGridScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        Object obj2;
        boolean z;
        Object flingBehavior2;
        LazyGridState lazyGridState;
        Composer $composer2;
        final boolean reverseLayout2;
        final Modifier modifier2;
        final FlingBehavior flingBehavior3;
        final PaddingValues contentPadding2;
        Modifier.Companion modifier3;
        FlingBehavior flingBehavior4;
        PaddingValues contentPadding3;
        boolean reverseLayout3;
        Modifier.Companion companion;
        int i2;
        Composer $composer3 = $composer.startRestartGroup(708740370);
        ComposerKt.sourceInformation($composer3, "C(LazyGrid)P(5,9,8,1,7,4,2,10,6,11,3)83@3963L50,85@4039L51,87@4117L24,88@4189L7,89@4258L7,92@4299L403,125@5367L302,120@5198L1174:LazyGrid.kt#7791vq");
        int $dirty = $changed;
        int $dirty1 = $changed1;
        int i3 = i & 1;
        if (i3 != 0) {
            $dirty |= 6;
            obj = modifier;
        } else if (($changed & 6) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 4 : 2;
        } else {
            obj = modifier;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(state) ? 32 : 16;
        }
        if ((i & 4) != 0) {
            $dirty |= 384;
        } else if (($changed & 384) == 0) {
            $dirty |= ($changed & 512) == 0 ? $composer3.changed(slots) : $composer3.changedInstance(slots) ? 256 : 128;
        }
        int i4 = i & 8;
        if (i4 != 0) {
            $dirty |= 3072;
            obj2 = contentPadding;
        } else if (($changed & 3072) == 0) {
            obj2 = contentPadding;
            $dirty |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = contentPadding;
        }
        int i5 = i & 16;
        if (i5 != 0) {
            $dirty |= 24576;
            z = reverseLayout;
        } else if (($changed & 24576) == 0) {
            z = reverseLayout;
            $dirty |= $composer3.changed(z) ? 16384 : 8192;
        } else {
            z = reverseLayout;
        }
        if ((i & 32) != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            $dirty |= $composer3.changed(isVertical) ? 131072 : 65536;
        }
        if (($changed & 1572864) == 0) {
            if ((i & 64) == 0) {
                flingBehavior2 = flingBehavior;
                if ($composer3.changed(flingBehavior2)) {
                    i2 = 1048576;
                    $dirty |= i2;
                }
            } else {
                flingBehavior2 = flingBehavior;
            }
            i2 = 524288;
            $dirty |= i2;
        } else {
            flingBehavior2 = flingBehavior;
        }
        if ((i & 128) != 0) {
            $dirty |= 12582912;
        } else if (($changed & 12582912) == 0) {
            $dirty |= $composer3.changed(userScrollEnabled) ? 8388608 : 4194304;
        }
        if ((i & 256) != 0) {
            $dirty |= 100663296;
        } else if (($changed & 100663296) == 0) {
            $dirty |= $composer3.changed(overscrollEffect) ? 67108864 : 33554432;
        }
        if ((i & 512) != 0) {
            $dirty |= 805306368;
        } else if (($changed & 805306368) == 0) {
            $dirty |= $composer3.changed(verticalArrangement) ? PropertyOptions.DELETE_EXISTING : 268435456;
        }
        if ((i & 1024) != 0) {
            $dirty1 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty1 |= $composer3.changed(horizontalArrangement) ? 4 : 2;
        }
        if ((i & 2048) != 0) {
            $dirty1 |= 48;
        } else if (($changed1 & 48) == 0) {
            $dirty1 |= $composer3.changedInstance(function1) ? 32 : 16;
        }
        int $dirty12 = $dirty1;
        if ($composer3.shouldExecute(((306783379 & $dirty) == 306783378 && ($dirty12 & 19) == 18) ? false : true, $dirty & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "71@3432L15");
            if (($changed & 1) == 0 || $composer3.getDefaultsInvalid()) {
                modifier3 = i3 != 0 ? Modifier.Companion : obj;
                PaddingValues contentPadding4 = i4 != 0 ? PaddingKt.m986PaddingValues0680j_4(Dp.m6873constructorimpl(0)) : obj2;
                boolean reverseLayout4 = i5 != 0 ? false : z;
                if ((i & 64) != 0) {
                    $dirty &= -3670017;
                    flingBehavior4 = ScrollableDefaults.INSTANCE.flingBehavior($composer3, 6);
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                } else {
                    flingBehavior4 = flingBehavior2;
                    contentPadding3 = contentPadding4;
                    reverseLayout3 = reverseLayout4;
                }
            } else {
                $composer3.skipToGroupEnd();
                if ((i & 64) != 0) {
                    $dirty &= -3670017;
                }
                flingBehavior4 = flingBehavior2;
                contentPadding3 = obj2;
                reverseLayout3 = z;
                modifier3 = obj;
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(708740370, $dirty, $dirty12, "androidx.compose.foundation.lazy.grid.LazyGrid (LazyGrid.kt:82)");
            }
            Function0 itemProviderLambda = LazyGridItemProviderKt.rememberLazyGridItemProviderLambda(state, function1, $composer3, (($dirty >> 3) & 14) | ($dirty12 & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            LazyLayoutSemanticState semanticState = LazySemanticsKt.rememberLazyGridSemanticState(state, reverseLayout3, $composer3, (($dirty >> 3) & 14) | (($dirty >> 9) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            ComposerKt.sourceInformationMarkerStart($composer3, 773894976, "CC(rememberCoroutineScope)558@25470L68:Effects.kt#9igjgp");
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
            CompositionLocal this_$iv = CompositionLocalsKt.getLocalScrollCaptureInProgress();
            ComposerKt.sourceInformationMarkerStart($composer3, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
            Object consume2 = $composer3.consume(this_$iv);
            ComposerKt.sourceInformationMarkerEnd($composer3);
            boolean stickyHeadersEnabled = !((Boolean) consume2).booleanValue();
            Modifier modifier4 = modifier3;
            int $dirty2 = $dirty;
            Function2 measurePolicy = rememberLazyGridMeasurePolicy(itemProviderLambda, state, slots, contentPadding3, reverseLayout3, isVertical, horizontalArrangement, verticalArrangement, coroutineScope, graphicsContext, stickyHeadersEnabled ? StickyItemsPlacement.Companion.getStickToTopPlacement() : null, $composer3, ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (($dirty12 << 18) & 3670016) | (($dirty >> 6) & 29360128), 0);
            lazyGridState = state;
            PaddingValues contentPadding5 = contentPadding3;
            Orientation orientation = isVertical ? Orientation.Vertical : Orientation.Horizontal;
            if (userScrollEnabled) {
                $composer3.startReplaceGroup(-1614890700);
                ComposerKt.sourceInformation($composer3, "111@4933L48");
                companion = LazyLayoutBeyondBoundsModifierLocalKt.lazyLayoutBeyondBoundsModifier(Modifier.Companion, LazyGridBeyondBoundsModifierKt.rememberLazyGridBeyondBoundsState(lazyGridState, $composer3, ($dirty2 >> 3) & 14), lazyGridState.getBeyondBoundsInfo$foundation_release(), reverseLayout3, orientation);
                $composer3.endReplaceGroup();
            } else {
                $composer3.startReplaceGroup(-1614595456);
                $composer3.endReplaceGroup();
                companion = Modifier.Companion;
            }
            Modifier beyondBoundsModifier = companion;
            boolean reverseLayout5 = reverseLayout3;
            Modifier lazyLayoutSemantics = LazyLayoutSemanticsKt.lazyLayoutSemantics(modifier4.then(lazyGridState.getRemeasurementModifier$foundation_release()).then(lazyGridState.getAwaitLayoutModifier$foundation_release()), itemProviderLambda, semanticState, orientation, userScrollEnabled, reverseLayout5, $composer3, (($dirty2 >> 9) & 57344) | (458752 & ($dirty2 << 3)));
            $composer2 = $composer3;
            FlingBehavior flingBehavior5 = flingBehavior4;
            LazyLayoutKt.LazyLayout(itemProviderLambda, ScrollingContainerKt.scrollingContainer$default(lazyLayoutSemantics.then(beyondBoundsModifier).then(lazyGridState.getItemAnimator$foundation_release().getModifier()), lazyGridState, orientation, userScrollEnabled, reverseLayout5, flingBehavior5, lazyGridState.getInternalInteractionSource$foundation_release(), false, overscrollEffect, null, 256, null), lazyGridState.getPrefetchState$foundation_release(), measurePolicy, $composer2, 0, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            flingBehavior3 = flingBehavior5;
            reverseLayout2 = reverseLayout5;
            modifier2 = modifier4;
            contentPadding2 = contentPadding5;
        } else {
            lazyGridState = state;
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            reverseLayout2 = z;
            modifier2 = obj;
            flingBehavior3 = flingBehavior2;
            contentPadding2 = obj2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final LazyGridState lazyGridState2 = lazyGridState;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.grid.LazyGridKt$LazyGrid$1
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

                public final void invoke(Composer composer, int i6) {
                    LazyGridKt.LazyGrid(Modifier.this, lazyGridState2, slots, contentPadding2, reverseLayout2, isVertical, flingBehavior3, userScrollEnabled, overscrollEffect, verticalArrangement, horizontalArrangement, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x004f, code lost:
        if (r33.changed(r13) == false) goto L69;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x006a, code lost:
        if (r33.changed(r10) == false) goto L65;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0087, code lost:
        if (r33.changed(r11) == false) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00a4, code lost:
        if (r33.changed(r3) == false) goto L57;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00c0, code lost:
        if (r33.changed(r15) == false) goto L53;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x00dd, code lost:
        if (r33.changed(r14) == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x00e4, code lost:
        if ((r34 & 12582912) == 8388608) goto L38;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x00e6, code lost:
        r5 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x00e7, code lost:
        r2 = (r2 | r5) | r33.changed(r31);
        r7 = r33.rememberedValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x00f9, code lost:
        if (r2 != false) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0101, code lost:
        if (r7 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x0105, code lost:
        r9 = r3;
        r7 = (kotlin.jvm.functions.Function2) new androidx.compose.foundation.lazy.grid.LazyGridKt$rememberLazyGridMeasurePolicy$1$1(r8, r9, r10, r11, r22, r13, r14, r15, r30, r31, r32);
        r33.updateRememberedValue(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0120, code lost:
        r7 = (kotlin.jvm.functions.Function2) r7;
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r33);
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x012a, code lost:
        if (androidx.compose.runtime.ComposerKt.isTraceInProgress() == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x012c, code lost:
        androidx.compose.runtime.ComposerKt.traceEventEnd();
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x012f, code lost:
        androidx.compose.runtime.ComposerKt.sourceInformationMarkerEnd(r33);
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0132, code lost:
        return r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0035, code lost:
        if (r33.changed(r8) == false) goto L73;
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00e0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final kotlin.jvm.functions.Function2<androidx.compose.foundation.lazy.layout.LazyLayoutMeasureScope, androidx.compose.ui.unit.Constraints, androidx.compose.ui.layout.MeasureResult> rememberLazyGridMeasurePolicy(final kotlin.jvm.functions.Function0<? extends androidx.compose.foundation.lazy.grid.LazyGridItemProvider> r22, androidx.compose.foundation.lazy.grid.LazyGridState r23, androidx.compose.foundation.lazy.grid.LazyGridSlotsProvider r24, androidx.compose.foundation.layout.PaddingValues r25, boolean r26, boolean r27, androidx.compose.foundation.layout.Arrangement.Horizontal r28, androidx.compose.foundation.layout.Arrangement.Vertical r29, final kotlinx.coroutines.CoroutineScope r30, final androidx.compose.ui.graphics.GraphicsContext r31, final androidx.compose.foundation.lazy.layout.StickyItemsPlacement r32, androidx.compose.runtime.Composer r33, int r34, int r35) {
        /*
            Method dump skipped, instructions count: 307
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.grid.LazyGridKt.rememberLazyGridMeasurePolicy(kotlin.jvm.functions.Function0, androidx.compose.foundation.lazy.grid.LazyGridState, androidx.compose.foundation.lazy.grid.LazyGridSlotsProvider, androidx.compose.foundation.layout.PaddingValues, boolean, boolean, androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.foundation.layout.Arrangement$Vertical, kotlinx.coroutines.CoroutineScope, androidx.compose.ui.graphics.GraphicsContext, androidx.compose.foundation.lazy.layout.StickyItemsPlacement, androidx.compose.runtime.Composer, int, int):kotlin.jvm.functions.Function2");
    }
}
