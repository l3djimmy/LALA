package androidx.compose.foundation.gestures;

import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
/* compiled from: MouseWheelScrollable.kt */
@Metadata(d1 = {"\u0000 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0007\n\u0000\u001a\f\u0010\b\u001a\u00020\t*\u00020\nH\u0002\"\u0010\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\"\u0010\u0010\u0003\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0002\"\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"AnimationSpeed", "Landroidx/compose/ui/unit/Dp;", "F", "AnimationThreshold", "MaxAnimationDuration", "", "ScrollProgressTimeout", "", "isLowScrollingDelta", "", "", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class MouseWheelScrollableKt {
    private static final int MaxAnimationDuration = 100;
    private static final long ScrollProgressTimeout = 50;
    private static final float AnimationThreshold = Dp.m6873constructorimpl(6);
    private static final float AnimationSpeed = Dp.m6873constructorimpl(1);

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isLowScrollingDelta(float $this$isLowScrollingDelta) {
        return Float.isNaN($this$isLowScrollingDelta) || Math.abs($this$isLowScrollingDelta) < 0.5f;
    }
}
