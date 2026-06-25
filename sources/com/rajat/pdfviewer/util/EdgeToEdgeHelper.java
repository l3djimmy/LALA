package com.rajat.pdfviewer.util;

import android.view.View;
import android.view.Window;
import androidx.core.graphics.Insets;
import androidx.core.view.OnApplyWindowInsetsListener;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: EdgeToEdgeHelper.kt */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J6\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0016\b\u0002\u0010\f\u001a\u0010\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u0005\u0018\u00010\rJ\u000e\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u0011¨\u0006\u0012"}, d2 = {"Lcom/rajat/pdfviewer/util/EdgeToEdgeHelper;", "", "<init>", "()V", "applyInsets", "", "window", "Landroid/view/Window;", "rootView", "Landroid/view/View;", "darkMode", "", "onInsetsApplied", "Lkotlin/Function1;", "Landroidx/core/view/WindowInsetsCompat;", "isDarkModeEnabled", "configUiMode", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class EdgeToEdgeHelper {
    public static final int $stable = 0;
    public static final EdgeToEdgeHelper INSTANCE = new EdgeToEdgeHelper();

    private EdgeToEdgeHelper() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void applyInsets$default(EdgeToEdgeHelper edgeToEdgeHelper, Window window, View view, boolean z, Function1 function1, int i, Object obj) {
        if ((i & 8) != 0) {
            function1 = null;
        }
        edgeToEdgeHelper.applyInsets(window, view, z, function1);
    }

    public final void applyInsets(Window window, View rootView, boolean darkMode, final Function1<? super WindowInsetsCompat, Unit> function1) {
        Intrinsics.checkNotNullParameter(window, "window");
        Intrinsics.checkNotNullParameter(rootView, "rootView");
        WindowInsetsControllerCompat $this$applyInsets_u24lambda_u240 = new WindowInsetsControllerCompat(window, rootView);
        $this$applyInsets_u24lambda_u240.setAppearanceLightStatusBars(!darkMode);
        $this$applyInsets_u24lambda_u240.setAppearanceLightNavigationBars(!darkMode);
        ViewCompat.setOnApplyWindowInsetsListener(rootView, new OnApplyWindowInsetsListener() { // from class: com.rajat.pdfviewer.util.EdgeToEdgeHelper$$ExternalSyntheticLambda0
            @Override // androidx.core.view.OnApplyWindowInsetsListener
            public final WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                return EdgeToEdgeHelper.applyInsets$lambda$1(Function1.this, view, windowInsetsCompat);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final WindowInsetsCompat applyInsets$lambda$1(Function1 $onInsetsApplied, View v, WindowInsetsCompat insets) {
        Intrinsics.checkNotNullParameter(v, "v");
        Intrinsics.checkNotNullParameter(insets, "insets");
        Insets bars = insets.getInsets(WindowInsetsCompat.Type.systemBars() | WindowInsetsCompat.Type.displayCutout());
        Intrinsics.checkNotNullExpressionValue(bars, "getInsets(...)");
        if (bars.top > 0 || bars.bottom > 0 || bars.left > 0 || bars.right > 0) {
            v.setPadding(bars.left, bars.top, bars.right, bars.bottom);
        }
        if ($onInsetsApplied != null) {
            $onInsetsApplied.invoke(insets);
        }
        return WindowInsetsCompat.CONSUMED;
    }

    public final boolean isDarkModeEnabled(int configUiMode) {
        return (configUiMode & 48) == 32;
    }
}
