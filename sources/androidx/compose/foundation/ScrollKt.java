package androidx.compose.foundation;

import androidx.compose.foundation.gestures.FlingBehavior;
import androidx.compose.foundation.gestures.Orientation;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.saveable.RememberSaveableKt;
import androidx.compose.runtime.saveable.Saver;
import androidx.compose.ui.Modifier;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
/* compiled from: Scroll.kt */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\u001a\u0017\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u0003H\u0007¢\u0006\u0002\u0010\u0004\u001a<\u0010\u0005\u001a\u00020\u0006*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00012\b\u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000b\u001a2\u0010\u0005\u001a\u00020\u0006*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00012\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000b\u001aJ\u0010\u000f\u001a\u00020\u0006*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00012\u0006\u0010\u000e\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u000b2\u0006\u0010\u0012\u001a\u00020\u000b2\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\tH\u0002\u001a<\u0010\u0013\u001a\u00020\u0006*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00012\b\u0010\b\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000b\u001a2\u0010\u0013\u001a\u00020\u0006*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00012\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000b¨\u0006\u0014"}, d2 = {"rememberScrollState", "Landroidx/compose/foundation/ScrollState;", "initial", "", "(ILandroidx/compose/runtime/Composer;II)Landroidx/compose/foundation/ScrollState;", "horizontalScroll", "Landroidx/compose/ui/Modifier;", "state", "overscrollEffect", "Landroidx/compose/foundation/OverscrollEffect;", "enabled", "", "flingBehavior", "Landroidx/compose/foundation/gestures/FlingBehavior;", "reverseScrolling", "scroll", "isScrollable", "isVertical", "useLocalOverscrollFactory", "verticalScroll", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ScrollKt {
    public static final ScrollState rememberScrollState(final int initial, Composer $composer, int $changed, int i) {
        ComposerKt.sourceInformationMarkerStart($composer, -1464256199, "C(rememberScrollState)69@3216L34,69@3172L78:Scroll.kt#71ulvw");
        boolean invalid$iv = true;
        if ((i & 1) != 0) {
            initial = 0;
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(-1464256199, $changed, -1, "androidx.compose.foundation.rememberScrollState (Scroll.kt:68)");
        }
        Object[] objArr = new Object[0];
        Saver<ScrollState, ?> saver = ScrollState.Companion.getSaver();
        ComposerKt.sourceInformationMarkerStart($composer, -506671201, "CC(remember):Scroll.kt#9igjgp");
        if (((($changed & 14) ^ 6) <= 4 || !$composer.changed(initial)) && ($changed & 6) != 4) {
            invalid$iv = false;
        }
        Object it$iv = $composer.rememberedValue();
        if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
            Object value$iv = (Function0) new Function0<ScrollState>() { // from class: androidx.compose.foundation.ScrollKt$rememberScrollState$1$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final ScrollState invoke() {
                    return new ScrollState(initial);
                }
            };
            $composer.updateRememberedValue(value$iv);
            it$iv = value$iv;
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        ScrollState scrollState = (ScrollState) RememberSaveableKt.m3846rememberSaveable(objArr, saver, (String) null, (Function0<? extends Object>) it$iv, $composer, 0, 4);
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return scrollState;
    }

    public static /* synthetic */ Modifier verticalScroll$default(Modifier modifier, ScrollState scrollState, boolean z, FlingBehavior flingBehavior, boolean z2, int i, Object obj) {
        if ((i & 2) != 0) {
            z = true;
        }
        if ((i & 4) != 0) {
            flingBehavior = null;
        }
        if ((i & 8) != 0) {
            z2 = false;
        }
        return verticalScroll(modifier, scrollState, z, flingBehavior, z2);
    }

    public static final Modifier verticalScroll(Modifier $this$verticalScroll, ScrollState state, boolean enabled, FlingBehavior flingBehavior, boolean reverseScrolling) {
        return scroll$default($this$verticalScroll, state, reverseScrolling, flingBehavior, enabled, true, true, null, 64, null);
    }

    public static final Modifier verticalScroll(Modifier $this$verticalScroll, ScrollState state, OverscrollEffect overscrollEffect, boolean enabled, FlingBehavior flingBehavior, boolean reverseScrolling) {
        return scroll($this$verticalScroll, state, reverseScrolling, flingBehavior, enabled, true, false, overscrollEffect);
    }

    public static /* synthetic */ Modifier horizontalScroll$default(Modifier modifier, ScrollState scrollState, boolean z, FlingBehavior flingBehavior, boolean z2, int i, Object obj) {
        if ((i & 2) != 0) {
            z = true;
        }
        if ((i & 4) != 0) {
            flingBehavior = null;
        }
        if ((i & 8) != 0) {
            z2 = false;
        }
        return horizontalScroll(modifier, scrollState, z, flingBehavior, z2);
    }

    public static final Modifier horizontalScroll(Modifier $this$horizontalScroll, ScrollState state, boolean enabled, FlingBehavior flingBehavior, boolean reverseScrolling) {
        return scroll$default($this$horizontalScroll, state, reverseScrolling, flingBehavior, enabled, false, true, null, 64, null);
    }

    public static final Modifier horizontalScroll(Modifier $this$horizontalScroll, ScrollState state, OverscrollEffect overscrollEffect, boolean enabled, FlingBehavior flingBehavior, boolean reverseScrolling) {
        return scroll($this$horizontalScroll, state, reverseScrolling, flingBehavior, enabled, false, false, overscrollEffect);
    }

    static /* synthetic */ Modifier scroll$default(Modifier modifier, ScrollState scrollState, boolean z, FlingBehavior flingBehavior, boolean z2, boolean z3, boolean z4, OverscrollEffect overscrollEffect, int i, Object obj) {
        OverscrollEffect overscrollEffect2;
        if ((i & 64) == 0) {
            overscrollEffect2 = overscrollEffect;
        } else {
            overscrollEffect2 = null;
        }
        return scroll(modifier, scrollState, z, flingBehavior, z2, z3, z4, overscrollEffect2);
    }

    private static final Modifier scroll(Modifier $this$scroll, ScrollState state, boolean reverseScrolling, FlingBehavior flingBehavior, boolean isScrollable, boolean isVertical, boolean useLocalOverscrollFactory, OverscrollEffect overscrollEffect) {
        Orientation orientation = isVertical ? Orientation.Vertical : Orientation.Horizontal;
        return ScrollingContainerKt.scrollingContainer$default($this$scroll, state, orientation, isScrollable, reverseScrolling, flingBehavior, state.getInternalInteractionSource$foundation_release(), useLocalOverscrollFactory, overscrollEffect, null, 256, null).then(new ScrollingLayoutElement(state, reverseScrolling, isVertical));
    }
}
