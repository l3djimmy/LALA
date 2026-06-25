package androidx.compose.ui.platform;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Rect;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AndroidWindowInfo.android.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bÃ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0017¨\u0006\u0007"}, d2 = {"Landroidx/compose/ui/platform/BoundsHelperApi29Impl;", "Landroidx/compose/ui/platform/BoundsHelper;", "()V", "currentWindowBounds", "Landroid/graphics/Rect;", "activity", "Landroid/app/Activity;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class BoundsHelperApi29Impl implements BoundsHelper {
    public static final BoundsHelperApi29Impl INSTANCE = new BoundsHelperApi29Impl();

    private BoundsHelperApi29Impl() {
    }

    @Override // androidx.compose.ui.platform.BoundsHelper
    public Rect currentWindowBounds(Activity activity) {
        boolean z;
        boolean z2;
        Configuration config = activity.getResources().getConfiguration();
        boolean z3 = true;
        try {
            Field windowConfigField = Configuration.class.getDeclaredField("windowConfiguration");
            windowConfigField.setAccessible(true);
            Object windowConfig = windowConfigField.get(config);
            Method getBoundsMethod = windowConfig.getClass().getDeclaredMethod("getBounds", new Class[0]);
            Object invoke = getBoundsMethod.invoke(windowConfig, new Object[0]);
            Intrinsics.checkNotNull(invoke, "null cannot be cast to non-null type android.graphics.Rect");
            Rect bounds = new Rect((Rect) invoke);
            return bounds;
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
                Rect bounds2 = BoundsHelperApi28Impl.INSTANCE.currentWindowBounds(activity);
                return bounds2;
            }
            throw e;
        }
    }
}
