package com.rajat.pdfviewer.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.TypedValue;
import androidx.core.content.ContextCompat;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ThemeUtils.kt */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\"\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0001\u0010\b\u001a\u00020\u00052\b\b\u0001\u0010\t\u001a\u00020\u0005J\"\u0010\n\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0001\u0010\b\u001a\u00020\u00052\b\b\u0001\u0010\t\u001a\u00020\u0005J \u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\b\b\u0002\u0010\u0010\u001a\u00020\fJ\u001e\u0010\u0011\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u0005J\u001e\u0010\u0013\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0014\u001a\u00020\u0005¨\u0006\u0015"}, d2 = {"Lcom/rajat/pdfviewer/util/ThemeUtils;", "", "<init>", "()V", "getColorFromAttr", "", "context", "Landroid/content/Context;", "attrRes", "fallbackRes", "getResourceIdFromAttr", "getBooleanFromTypedArray", "", "typedArray", "Landroid/content/res/TypedArray;", "index", "default", "getColorFromTypedArray", "fallbackColor", "getResIdFromTypedArray", "fallbackResId", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ThemeUtils {
    public static final int $stable = 0;
    public static final ThemeUtils INSTANCE = new ThemeUtils();

    private ThemeUtils() {
    }

    public final int getColorFromAttr(Context context, int attrRes, int fallbackRes) {
        Intrinsics.checkNotNullParameter(context, "context");
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(attrRes, typedValue, true)) {
            return typedValue.data;
        }
        return ContextCompat.getColor(context, fallbackRes);
    }

    public final int getResourceIdFromAttr(Context context, int attrRes, int fallbackRes) {
        Intrinsics.checkNotNullParameter(context, "context");
        TypedValue typedValue = new TypedValue();
        if (context.getTheme().resolveAttribute(attrRes, typedValue, true)) {
            return typedValue.resourceId;
        }
        return fallbackRes;
    }

    public static /* synthetic */ boolean getBooleanFromTypedArray$default(ThemeUtils themeUtils, TypedArray typedArray, int i, boolean z, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            z = false;
        }
        return themeUtils.getBooleanFromTypedArray(typedArray, i, z);
    }

    public final boolean getBooleanFromTypedArray(TypedArray typedArray, int index, boolean z) {
        Intrinsics.checkNotNullParameter(typedArray, "typedArray");
        try {
            return typedArray.getBoolean(index, z);
        } catch (Exception e) {
            return z;
        }
    }

    public final int getColorFromTypedArray(TypedArray typedArray, int index, int fallbackColor) {
        Intrinsics.checkNotNullParameter(typedArray, "typedArray");
        try {
            return typedArray.getColor(index, fallbackColor);
        } catch (Exception e) {
            return fallbackColor;
        }
    }

    public final int getResIdFromTypedArray(TypedArray typedArray, int index, int fallbackResId) {
        Intrinsics.checkNotNullParameter(typedArray, "typedArray");
        try {
            return typedArray.getResourceId(index, fallbackResId);
        } catch (Exception e) {
            return fallbackResId;
        }
    }
}
