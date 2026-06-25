package com.rajat.pdfviewer.util;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import android.util.TypedValue;
import com.rajat.pdfviewer.R;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ThemeValidator.kt */
@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\b\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001c\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000bJ\u000e\u0010\r\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lcom/rajat/pdfviewer/util/ThemeValidator;", "", "<init>", "()V", "hasLoggedOnce", "", "validateThemeAttributes", "", "context", "Landroid/content/Context;", "attrs", "", "", "validatePdfViewerTheme", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ThemeValidator {
    private static boolean hasLoggedOnce;
    public static final ThemeValidator INSTANCE = new ThemeValidator();
    public static final int $stable = 8;

    private ThemeValidator() {
    }

    public final void validateThemeAttributes(Context context, List<Integer> attrs) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(attrs, "attrs");
        if (hasLoggedOnce) {
            return;
        }
        hasLoggedOnce = true;
        Resources.Theme theme = context.getTheme();
        List<Integer> $this$forEach$iv = attrs;
        for (Object element$iv : $this$forEach$iv) {
            int attr = ((Number) element$iv).intValue();
            TypedValue resolved = new TypedValue();
            boolean success = theme.resolveAttribute(attr, resolved, true);
            if (!success) {
                Log.w("PdfViewerTheme", "⚠️ Missing theme attribute: " + context.getResources().getResourceName(attr));
            }
        }
    }

    public final void validatePdfViewerTheme(Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        validateThemeAttributes(context, CollectionsKt.listOf((Object[]) new Integer[]{16842801, Integer.valueOf(R.attr.pdfView_toolbarColor), Integer.valueOf(R.attr.pdfView_backgroundColor), Integer.valueOf(R.attr.pdfView_titleTextStyle)}));
    }
}
