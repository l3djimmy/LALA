package androidx.compose.ui.platform;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Point;
import android.graphics.Rect;
import android.view.Display;
import android.view.DisplayCutout;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AndroidWindowInfo.android.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0017¨\u0006\u0007"}, d2 = {"Landroidx/compose/ui/platform/BoundsHelperApi28Impl;", "Landroidx/compose/ui/platform/BoundsHelper;", "()V", "currentWindowBounds", "Landroid/graphics/Rect;", "activity", "Landroid/app/Activity;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
final class BoundsHelperApi28Impl implements BoundsHelper {
    public static final BoundsHelperApi28Impl INSTANCE = new BoundsHelperApi28Impl();

    private BoundsHelperApi28Impl() {
    }

    @Override // androidx.compose.ui.platform.BoundsHelper
    public Rect currentWindowBounds(Activity activity) {
        boolean z;
        boolean z2;
        DisplayCutout displayCutout;
        Rect bounds = new Rect();
        Configuration config = activity.getResources().getConfiguration();
        boolean z3 = true;
        try {
            Field windowConfigField = Configuration.class.getDeclaredField("windowConfiguration");
            windowConfigField.setAccessible(true);
            Object windowConfig = windowConfigField.get(config);
            if (activity.isInMultiWindowMode()) {
                Method getAppBounds = windowConfig.getClass().getDeclaredMethod("getBounds", new Class[0]);
                Object invoke = getAppBounds.invoke(windowConfig, new Object[0]);
                Intrinsics.checkNotNull(invoke, "null cannot be cast to non-null type android.graphics.Rect");
                bounds.set((Rect) invoke);
            } else {
                Method getAppBounds2 = windowConfig.getClass().getDeclaredMethod("getAppBounds", new Class[0]);
                Object invoke2 = getAppBounds2.invoke(windowConfig, new Object[0]);
                Intrinsics.checkNotNull(invoke2, "null cannot be cast to non-null type android.graphics.Rect");
                bounds.set((Rect) invoke2);
            }
        } catch (Exception e) {
            if (e instanceof NoSuchFieldException) {
                z = true;
            } else {
                z = e instanceof NoSuchMethodException;
            }
            if (z) {
                z2 = true;
            } else {
                z2 = e instanceof IllegalAccessException;
            }
            if (!z2) {
                z3 = e instanceof InvocationTargetException;
            }
            if (z3) {
                AndroidWindowInfo_androidKt.access$getRectSizeFromDisplay(activity, bounds);
            } else {
                throw e;
            }
        }
        WindowManager platformWindowManager = activity.getWindowManager();
        Display currentDisplay = platformWindowManager.getDefaultDisplay();
        Point realDisplaySize = new Point();
        currentDisplay.getRealSize(realDisplaySize);
        if (!activity.isInMultiWindowMode()) {
            int navigationBarHeight = AndroidWindowInfo_androidKt.access$getNavigationBarHeight(activity);
            if (bounds.bottom + navigationBarHeight == realDisplaySize.y) {
                bounds.bottom += navigationBarHeight;
            } else if (bounds.right + navigationBarHeight == realDisplaySize.x) {
                bounds.right += navigationBarHeight;
            } else if (bounds.left == navigationBarHeight) {
                bounds.left = 0;
            }
        }
        if ((bounds.width() < realDisplaySize.x || bounds.height() < realDisplaySize.y) && !activity.isInMultiWindowMode() && (displayCutout = AndroidWindowInfo_androidKt.access$getCutoutForDisplay(currentDisplay)) != null) {
            if (bounds.left == displayCutout.getSafeInsetLeft()) {
                bounds.left = 0;
            }
            if (realDisplaySize.x - bounds.right == displayCutout.getSafeInsetRight()) {
                bounds.right += displayCutout.getSafeInsetRight();
            }
            if (bounds.top == displayCutout.getSafeInsetTop()) {
                bounds.top = 0;
            }
            if (realDisplaySize.y - bounds.bottom == displayCutout.getSafeInsetBottom()) {
                bounds.bottom += displayCutout.getSafeInsetBottom();
            }
        }
        return bounds;
    }
}
