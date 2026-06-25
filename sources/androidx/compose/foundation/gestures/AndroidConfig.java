package androidx.compose.foundation.gestures;

import android.os.Build;
import android.view.ViewConfiguration;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.PointerEvent;
import androidx.compose.ui.input.pointer.PointerInputChange;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.core.app.NotificationCompat;
import java.util.List;
import kotlin.Metadata;
/* compiled from: AndroidScrollable.android.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J&\u0010\u0007\u001a\u00020\b*\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0016ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0010"}, d2 = {"Landroidx/compose/foundation/gestures/AndroidConfig;", "Landroidx/compose/foundation/gestures/ScrollConfig;", "viewConfiguration", "Landroid/view/ViewConfiguration;", "(Landroid/view/ViewConfiguration;)V", "getViewConfiguration", "()Landroid/view/ViewConfiguration;", "calculateMouseWheelScroll", "Landroidx/compose/ui/geometry/Offset;", "Landroidx/compose/ui/unit/Density;", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/pointer/PointerEvent;", "bounds", "Landroidx/compose/ui/unit/IntSize;", "calculateMouseWheelScroll-8xgXZGE", "(Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/input/pointer/PointerEvent;J)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
final class AndroidConfig implements ScrollConfig {
    private final ViewConfiguration viewConfiguration;

    public AndroidConfig(ViewConfiguration viewConfiguration) {
        this.viewConfiguration = viewConfiguration;
    }

    public final ViewConfiguration getViewConfiguration() {
        return this.viewConfiguration;
    }

    @Override // androidx.compose.foundation.gestures.ScrollConfig
    /* renamed from: calculateMouseWheelScroll-8xgXZGE  reason: not valid java name */
    public long mo666calculateMouseWheelScroll8xgXZGE(Density $this$calculateMouseWheelScroll_u2d8xgXZGE, PointerEvent event, long bounds) {
        float verticalScrollFactor = Build.VERSION.SDK_INT > 26 ? -ViewConfigurationApi26Impl.INSTANCE.getVerticalScrollFactor(this.viewConfiguration) : -$this$calculateMouseWheelScroll_u2d8xgXZGE.mo644toPx0680j_4(Dp.m6873constructorimpl(64));
        float horizontalScrollFactor = Build.VERSION.SDK_INT > 26 ? -ViewConfigurationApi26Impl.INSTANCE.getHorizontalScrollFactor(this.viewConfiguration) : -$this$calculateMouseWheelScroll_u2d8xgXZGE.mo644toPx0680j_4(Dp.m6873constructorimpl(64));
        List $this$fastFold$iv = event.getChanges();
        Offset m4037boximpl = Offset.m4037boximpl(Offset.Companion.m4064getZeroF1C5BW0());
        int index$iv$iv = 0;
        int size = $this$fastFold$iv.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastFold$iv.get(index$iv$iv);
            PointerInputChange c = (PointerInputChange) item$iv$iv;
            long acc = m4037boximpl.m4058unboximpl();
            m4037boximpl = Offset.m4037boximpl(Offset.m4053plusMKHz9U(acc, c.m5514getScrollDeltaF1C5BW0()));
            index$iv$iv++;
            verticalScrollFactor = verticalScrollFactor;
            horizontalScrollFactor = horizontalScrollFactor;
        }
        long it = m4037boximpl.m4058unboximpl();
        int bits$iv$iv$iv = (int) (it >> 32);
        float x$iv = Float.intBitsToFloat(bits$iv$iv$iv) * horizontalScrollFactor;
        int bits$iv$iv$iv2 = (int) (it & 4294967295L);
        float y$iv = Float.intBitsToFloat(bits$iv$iv$iv2) * verticalScrollFactor;
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }
}
