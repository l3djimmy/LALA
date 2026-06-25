package androidx.compose.ui.focus;

import android.view.FocusFinder;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.compose.ui.unit.LayoutDirection;
import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
/* compiled from: FocusInteropUtils.android.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\u001a\u0012\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0000\u001a\u0012\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0006\u001a\u00020\u0003H\u0000\u001a\u0014\u0010\u0007\u001a\u00020\b*\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0000\u001a%\u0010\u000b\u001a\u00020\f*\u00020\t2\b\u0010\r\u001a\u0004\u0018\u00010\u00032\b\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0000¢\u0006\u0002\u0010\u0010\u001a\u0018\u0010\u0011\u001a\u0004\u0018\u00010\u0003*\u00020\u0001H\u0000ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\u0014"}, d2 = {"toFocusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "androidDirection", "", "toLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "androidLayoutDirection", "calculateBoundingRectRelativeTo", "Landroidx/compose/ui/geometry/Rect;", "Landroid/view/View;", "view", "requestInteropFocus", "", "direction", "rect", "Landroid/graphics/Rect;", "(Landroid/view/View;Ljava/lang/Integer;Landroid/graphics/Rect;)Z", "toAndroidFocusDirection", "toAndroidFocusDirection-3ESFkO8", "(I)Ljava/lang/Integer;", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FocusInteropUtils_androidKt {
    public static final FocusDirection toFocusDirection(int androidDirection) {
        switch (androidDirection) {
            case 1:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3941getPreviousdhqQ8s());
            case 2:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3940getNextdhqQ8s());
            case 17:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3939getLeftdhqQ8s());
            case 33:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3943getUpdhqQ8s());
            case 66:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3942getRightdhqQ8s());
            case Property.ALIGN_CONTENT /* 130 */:
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3936getDowndhqQ8s());
            default:
                return null;
        }
    }

    /* renamed from: toAndroidFocusDirection-3ESFkO8  reason: not valid java name */
    public static final Integer m3944toAndroidFocusDirection3ESFkO8(int $this$toAndroidFocusDirection_u2d3ESFkO8) {
        if (FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3943getUpdhqQ8s())) {
            return 33;
        }
        if (FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3936getDowndhqQ8s())) {
            return Integer.valueOf((int) Property.ALIGN_CONTENT);
        }
        if (FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3939getLeftdhqQ8s())) {
            return 17;
        }
        if (FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3942getRightdhqQ8s())) {
            return 66;
        }
        if (FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3940getNextdhqQ8s())) {
            return 2;
        }
        return FocusDirection.m3932equalsimpl0($this$toAndroidFocusDirection_u2d3ESFkO8, FocusDirection.Companion.m3941getPreviousdhqQ8s()) ? 1 : null;
    }

    public static final LayoutDirection toLayoutDirection(int androidLayoutDirection) {
        switch (androidLayoutDirection) {
            case 0:
                return LayoutDirection.Ltr;
            case 1:
                return LayoutDirection.Rtl;
            default:
                return null;
        }
    }

    public static final Rect calculateBoundingRectRelativeTo(View $this$calculateBoundingRectRelativeTo, View view) {
        $this$calculateBoundingRectRelativeTo.getLocationInWindow(FocusInteropUtils.Companion.getTempCoordinates());
        int xInWindow = FocusInteropUtils.Companion.getTempCoordinates()[0];
        int yInWindow = FocusInteropUtils.Companion.getTempCoordinates()[1];
        view.getLocationInWindow(FocusInteropUtils.Companion.getTempCoordinates());
        int targetX = FocusInteropUtils.Companion.getTempCoordinates()[0];
        int targetY = FocusInteropUtils.Companion.getTempCoordinates()[1];
        float x = xInWindow - targetX;
        float y = yInWindow - targetY;
        return new Rect(x, y, $this$calculateBoundingRectRelativeTo.getWidth() + x, $this$calculateBoundingRectRelativeTo.getHeight() + y);
    }

    public static final boolean requestInteropFocus(View $this$requestInteropFocus, Integer direction, android.graphics.Rect rect) {
        if (direction == null) {
            return $this$requestInteropFocus.requestFocus();
        }
        if ($this$requestInteropFocus instanceof ViewGroup) {
            if (((ViewGroup) $this$requestInteropFocus).isFocused()) {
                return true;
            }
            if ((!((ViewGroup) $this$requestInteropFocus).isFocusable() || $this$requestInteropFocus.hasFocus()) && !($this$requestInteropFocus instanceof AndroidComposeView)) {
                if (rect != null) {
                    View findNextFocusFromRect = FocusFinder.getInstance().findNextFocusFromRect((ViewGroup) $this$requestInteropFocus, rect, direction.intValue());
                    return findNextFocusFromRect != null ? findNextFocusFromRect.requestFocus(direction.intValue(), rect) : $this$requestInteropFocus.requestFocus(direction.intValue(), rect);
                }
                View focusedView = $this$requestInteropFocus.hasFocus() ? $this$requestInteropFocus.findFocus() : null;
                View findNextFocus = FocusFinder.getInstance().findNextFocus((ViewGroup) $this$requestInteropFocus, focusedView, direction.intValue());
                return findNextFocus != null ? findNextFocus.requestFocus(direction.intValue()) : $this$requestInteropFocus.requestFocus(direction.intValue());
            }
            return $this$requestInteropFocus.requestFocus(direction.intValue(), rect);
        }
        return $this$requestInteropFocus.requestFocus(direction.intValue(), rect);
    }
}
