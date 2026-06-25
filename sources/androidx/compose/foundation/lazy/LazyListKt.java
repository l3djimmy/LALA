package androidx.compose.foundation.lazy;

import androidx.compose.foundation.OverscrollEffect;
import androidx.compose.foundation.ScrollingContainerKt;
import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.foundation.layout.Arrangement;
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
import androidx.compose.ui.Alignment;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.compose.ui.platform.CompositionLocalsKt;
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
/* compiled from: LazyList.kt */
@Metadata(d1 = {"\u0000\u008e\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a¢\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\t2\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0017\u0010\u001a\u001a\u0013\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u00010\u001b¢\u0006\u0002\b\u001dH\u0001¢\u0006\u0002\u0010\u001e\u001a\u009c\u0001\u0010\u001f\u001a\u0019\u0012\u0004\u0012\u00020!\u0012\u0004\u0012\u00020\"\u0012\u0004\u0012\u00020#0 ¢\u0006\u0002\b\u001d2\f\u0010$\u001a\b\u0012\u0004\u0012\u00020&0%2\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\b\u0010\u0016\u001a\u0004\u0018\u00010\u00172\b\u0010\u0018\u001a\u0004\u0018\u00010\u00192\b\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*2\b\u0010+\u001a\u0004\u0018\u00010,H\u0003¢\u0006\u0002\u0010-¨\u0006."}, d2 = {"LazyList", "", "modifier", "Landroidx/compose/ui/Modifier;", "state", "Landroidx/compose/foundation/lazy/LazyListState;", "contentPadding", "Landroidx/compose/foundation/layout/PaddingValues;", "reverseLayout", "", "isVertical", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "userScrollEnabled", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "beyondBoundsItemCount", "", "horizontalAlignment", "Landroidx/compose/ui/Alignment$Horizontal;", "verticalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Vertical;", "verticalAlignment", "Landroidx/compose/ui/Alignment$Vertical;", "horizontalArrangement", "Landroidx/compose/foundation/layout/Arrangement$Horizontal;", "content", "Lkotlin/Function1;", "Landroidx/compose/foundation/lazy/LazyListScope;", "Lkotlin/ExtensionFunctionType;", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/lazy/LazyListState;Landroidx/compose/foundation/layout/PaddingValues;ZZLandroidx/compose/foundation/gestures/FlingBehavior;ZLandroidx/compose/foundation/OverscrollEffect;ILandroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V", "rememberLazyListMeasurePolicy", "Lkotlin/Function2;", "Landroidx/compose/foundation/lazy/layout/LazyLayoutMeasureScope;", "Landroidx/compose/ui/unit/Constraints;", "Landroidx/compose/ui/layout/MeasureResult;", "itemProviderLambda", "Lkotlin/Function0;", "Landroidx/compose/foundation/lazy/LazyListItemProvider;", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "graphicsContext", "Landroidx/compose/ui/graphics/GraphicsContext;", "stickyItemsPlacement", "Landroidx/compose/foundation/lazy/layout/StickyItemsPlacement;", "(Lkotlin/jvm/functions/Function0;Landroidx/compose/foundation/lazy/LazyListState;Landroidx/compose/foundation/layout/PaddingValues;ZZILandroidx/compose/ui/Alignment$Horizontal;Landroidx/compose/ui/Alignment$Vertical;Landroidx/compose/foundation/layout/Arrangement$Horizontal;Landroidx/compose/foundation/layout/Arrangement$Vertical;Lkotlinx/coroutines/CoroutineScope;Landroidx/compose/ui/graphics/GraphicsContext;Landroidx/compose/foundation/lazy/layout/StickyItemsPlacement;Landroidx/compose/runtime/Composer;II)Lkotlin/jvm/functions/Function2;", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LazyListKt {
    public static final void LazyList(final Modifier modifier, LazyListState state, final PaddingValues contentPadding, final boolean reverseLayout, final boolean isVertical, final FlingBehavior flingBehavior, final boolean userScrollEnabled, final OverscrollEffect overscrollEffect, int beyondBoundsItemCount, Alignment.Horizontal horizontalAlignment, Arrangement.Vertical verticalArrangement, Alignment.Vertical verticalAlignment, Arrangement.Horizontal horizontalArrangement, final Function1<? super LazyListScope, Unit> function1, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        int i2;
        int i3;
        int i4;
        int i5;
        Composer $composer2;
        LazyListState lazyListState;
        final int beyondBoundsItemCount2;
        final Alignment.Horizontal horizontalAlignment2;
        final Arrangement.Vertical verticalArrangement2;
        final Alignment.Vertical verticalAlignment2;
        final Arrangement.Horizontal horizontalArrangement2;
        Arrangement.Horizontal horizontalArrangement3;
        Modifier.Companion companion;
        Composer $composer3 = $composer.startRestartGroup(924924659);
        ComposerKt.sourceInformation($composer3, "C(LazyList)P(7,10,2,9,6,3,11,8!1,4,13,12,5)85@4100L50,87@4176L48,88@4250L24,89@4322L7,90@4391L7,93@4432L483,132@5717L302,127@5548L1174:LazyList.kt#428nma");
        int $dirty = $changed;
        int $dirty1 = $changed1;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(modifier) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changed(state) ? 32 : 16;
        }
        if ((i & 4) != 0) {
            $dirty |= 384;
            obj = contentPadding;
        } else if (($changed & 384) == 0) {
            obj = contentPadding;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = contentPadding;
        }
        if ((i & 8) != 0) {
            $dirty |= 3072;
        } else if (($changed & 3072) == 0) {
            $dirty |= $composer3.changed(reverseLayout) ? 2048 : 1024;
        }
        if ((i & 16) != 0) {
            $dirty |= 24576;
        } else if (($changed & 24576) == 0) {
            $dirty |= $composer3.changed(isVertical) ? 16384 : 8192;
        }
        if ((i & 32) != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            $dirty |= $composer3.changed(flingBehavior) ? 131072 : 65536;
        }
        if ((i & 64) != 0) {
            $dirty |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty |= $composer3.changed(userScrollEnabled) ? 1048576 : 524288;
        }
        if ((i & 128) != 0) {
            $dirty |= 12582912;
        } else if ((12582912 & $changed) == 0) {
            $dirty |= $composer3.changed(overscrollEffect) ? 8388608 : 4194304;
        }
        int i6 = i & 256;
        if (i6 != 0) {
            $dirty |= 100663296;
        } else if (($changed & 100663296) == 0) {
            $dirty |= $composer3.changed(beyondBoundsItemCount) ? 67108864 : 33554432;
        }
        int i7 = i & 512;
        if (i7 != 0) {
            $dirty |= 805306368;
            i2 = i7;
        } else if (($changed & 805306368) == 0) {
            i2 = i7;
            $dirty |= $composer3.changed(horizontalAlignment) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i2 = i7;
        }
        int i8 = i & 1024;
        if (i8 != 0) {
            $dirty1 |= 6;
            i3 = i8;
        } else if (($changed1 & 6) == 0) {
            i3 = i8;
            $dirty1 |= $composer3.changed(verticalArrangement) ? 4 : 2;
        } else {
            i3 = i8;
        }
        int i9 = i & 2048;
        if (i9 != 0) {
            $dirty1 |= 48;
            i4 = i9;
        } else if (($changed1 & 48) == 0) {
            i4 = i9;
            $dirty1 |= $composer3.changed(verticalAlignment) ? 32 : 16;
        } else {
            i4 = i9;
        }
        int i10 = i & 4096;
        if (i10 != 0) {
            $dirty1 |= 384;
            i5 = i10;
        } else {
            i5 = i10;
            if (($changed1 & 384) == 0) {
                $dirty1 |= $composer3.changed(horizontalArrangement) ? 256 : 128;
            }
        }
        if ((i & 8192) != 0) {
            $dirty1 |= 3072;
        } else if (($changed1 & 3072) == 0) {
            $dirty1 |= $composer3.changedInstance(function1) ? 2048 : 1024;
        }
        int $dirty12 = $dirty1;
        if ($composer3.shouldExecute(((306783379 & $dirty) == 306783378 && ($dirty12 & 1171) == 1170) ? false : true, $dirty & 1)) {
            int beyondBoundsItemCount3 = i6 != 0 ? 0 : beyondBoundsItemCount;
            Alignment.Horizontal horizontalAlignment3 = i2 != 0 ? null : horizontalAlignment;
            Arrangement.Vertical verticalArrangement3 = i3 != 0 ? null : verticalArrangement;
            Alignment.Vertical verticalAlignment3 = i4 != 0 ? null : verticalAlignment;
            Arrangement.Horizontal horizontalArrangement4 = i5 != 0 ? null : horizontalArrangement;
            if (ComposerKt.isTraceInProgress()) {
                horizontalArrangement3 = horizontalArrangement4;
                ComposerKt.traceEventStart(924924659, $dirty, $dirty12, "androidx.compose.foundation.lazy.LazyList (LazyList.kt:84)");
            } else {
                horizontalArrangement3 = horizontalArrangement4;
            }
            Function0 itemProviderLambda = LazyListItemProviderKt.rememberLazyListItemProviderLambda(state, function1, $composer3, (($dirty >> 3) & 14) | (($dirty12 >> 6) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            LazyLayoutSemanticState semanticState = LazyListSemanticsKt.rememberLazyListSemanticState(state, isVertical, $composer3, (($dirty >> 3) & 14) | (($dirty >> 9) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
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
            StickyItemsPlacement stickToTopPlacement = stickyHeadersEnabled ? StickyItemsPlacement.Companion.getStickToTopPlacement() : null;
            int i11 = ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (($dirty >> 9) & 458752) | (3670016 & ($dirty >> 9)) | (($dirty12 << 18) & 29360128) | (($dirty12 << 18) & 234881024) | (($dirty12 << 27) & 1879048192);
            int $dirty2 = $dirty;
            Arrangement.Horizontal horizontalArrangement5 = horizontalArrangement3;
            Function2 measurePolicy = rememberLazyListMeasurePolicy(itemProviderLambda, state, obj, reverseLayout, isVertical, beyondBoundsItemCount3, horizontalAlignment3, verticalAlignment3, horizontalArrangement5, verticalArrangement3, coroutineScope, graphicsContext, stickToTopPlacement, $composer3, i11, 0);
            Alignment.Horizontal horizontalAlignment4 = horizontalAlignment3;
            Alignment.Vertical verticalAlignment4 = verticalAlignment3;
            Arrangement.Vertical verticalArrangement4 = verticalArrangement3;
            lazyListState = state;
            int beyondBoundsItemCount4 = beyondBoundsItemCount3;
            Orientation orientation = isVertical ? Orientation.Vertical : Orientation.Horizontal;
            if (userScrollEnabled) {
                $composer3.startReplaceGroup(-1513147781);
                ComposerKt.sourceInformation($composer3, "115@5166L165");
                companion = LazyLayoutBeyondBoundsModifierLocalKt.lazyLayoutBeyondBoundsModifier(Modifier.Companion, LazyListBeyondBoundsModifierKt.rememberLazyListBeyondBoundsState(lazyListState, beyondBoundsItemCount4, $composer3, (($dirty2 >> 3) & 14) | (($dirty2 >> 21) & Property.BORDER_BOTTOM_RIGHT_RADIUS)), lazyListState.getBeyondBoundsInfo$foundation_release(), reverseLayout, orientation);
                $composer3.endReplaceGroup();
            } else {
                $composer3.startReplaceGroup(-1512720880);
                $composer3.endReplaceGroup();
                companion = Modifier.Companion;
            }
            Modifier beyondBoundsModifier = companion;
            Modifier lazyLayoutSemantics = LazyLayoutSemanticsKt.lazyLayoutSemantics(modifier.then(lazyListState.getRemeasurementModifier$foundation_release()).then(lazyListState.getAwaitLayoutModifier$foundation_release()), itemProviderLambda, semanticState, orientation, userScrollEnabled, reverseLayout, $composer3, (($dirty2 >> 6) & 57344) | (458752 & ($dirty2 << 6)));
            $composer2 = $composer3;
            LazyLayoutKt.LazyLayout(itemProviderLambda, ScrollingContainerKt.scrollingContainer$default(lazyLayoutSemantics.then(beyondBoundsModifier).then(lazyListState.getItemAnimator$foundation_release().getModifier()), lazyListState, orientation, userScrollEnabled, reverseLayout, flingBehavior, lazyListState.getInternalInteractionSource$foundation_release(), false, overscrollEffect, null, 256, null), lazyListState.getPrefetchState$foundation_release(), measurePolicy, $composer2, 0, 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            horizontalAlignment2 = horizontalAlignment4;
            verticalAlignment2 = verticalAlignment4;
            horizontalArrangement2 = horizontalArrangement5;
            verticalArrangement2 = verticalArrangement4;
            beyondBoundsItemCount2 = beyondBoundsItemCount4;
        } else {
            $composer2 = $composer3;
            lazyListState = state;
            $composer2.skipToGroupEnd();
            beyondBoundsItemCount2 = beyondBoundsItemCount;
            horizontalAlignment2 = horizontalAlignment;
            verticalArrangement2 = verticalArrangement;
            verticalAlignment2 = verticalAlignment;
            horizontalArrangement2 = horizontalArrangement;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            final LazyListState lazyListState2 = lazyListState;
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.lazy.LazyListKt$LazyList$1
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

                public final void invoke(Composer composer, int i12) {
                    LazyListKt.LazyList(Modifier.this, lazyListState2, contentPadding, reverseLayout, isVertical, flingBehavior, userScrollEnabled, overscrollEffect, beyondBoundsItemCount2, horizontalAlignment2, verticalArrangement2, verticalAlignment2, horizontalArrangement2, function1, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x004a, code lost:
        if (r36.changed(r10) == false) goto L88;
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:0x0065, code lost:
        if (r36.changed(r11) == false) goto L84;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x0082, code lost:
        if (r36.changed(r4) == false) goto L80;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x009f, code lost:
        if (r36.changed(r9) == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x00bb, code lost:
        if (r36.changed(r12) == false) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00d7, code lost:
        if (r36.changed(r13) == false) goto L68;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x00f3, code lost:
        if (r36.changed(r14) == false) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0112, code lost:
        if (r36.changed(r15) == false) goto L60;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0030, code lost:
        if (r36.changed(r8) == false) goto L92;
     */
    /* JADX WARN: Removed duplicated region for block: B:104:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x012f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static final kotlin.jvm.functions.Function2<androidx.compose.foundation.lazy.layout.LazyLayoutMeasureScope, androidx.compose.ui.unit.Constraints, androidx.compose.ui.layout.MeasureResult> rememberLazyListMeasurePolicy(final kotlin.jvm.functions.Function0<? extends androidx.compose.foundation.lazy.LazyListItemProvider> r23, androidx.compose.foundation.lazy.LazyListState r24, androidx.compose.foundation.layout.PaddingValues r25, boolean r26, boolean r27, final int r28, androidx.compose.ui.Alignment.Horizontal r29, androidx.compose.ui.Alignment.Vertical r30, androidx.compose.foundation.layout.Arrangement.Horizontal r31, androidx.compose.foundation.layout.Arrangement.Vertical r32, final kotlinx.coroutines.CoroutineScope r33, final androidx.compose.ui.graphics.GraphicsContext r34, androidx.compose.foundation.lazy.layout.StickyItemsPlacement r35, androidx.compose.runtime.Composer r36, int r37, int r38) {
        /*
            Method dump skipped, instructions count: 370
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.lazy.LazyListKt.rememberLazyListMeasurePolicy(kotlin.jvm.functions.Function0, androidx.compose.foundation.lazy.LazyListState, androidx.compose.foundation.layout.PaddingValues, boolean, boolean, int, androidx.compose.ui.Alignment$Horizontal, androidx.compose.ui.Alignment$Vertical, androidx.compose.foundation.layout.Arrangement$Horizontal, androidx.compose.foundation.layout.Arrangement$Vertical, kotlinx.coroutines.CoroutineScope, androidx.compose.ui.graphics.GraphicsContext, androidx.compose.foundation.lazy.layout.StickyItemsPlacement, androidx.compose.runtime.Composer, int, int):kotlin.jvm.functions.Function2");
    }
}
