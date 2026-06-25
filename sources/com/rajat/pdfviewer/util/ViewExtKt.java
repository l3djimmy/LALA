package com.rajat.pdfviewer.util;

import android.view.View;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ViewExt.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0003\u001a\u00020\u0001*\u00020\u0002¨\u0006\u0004"}, d2 = {"show", "", "Landroid/view/View;", "hide", "pdfViewer_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ViewExtKt {
    public static final void show(View $this$show) {
        Intrinsics.checkNotNullParameter($this$show, "<this>");
        $this$show.setVisibility(0);
    }

    public static final void hide(View $this$hide) {
        Intrinsics.checkNotNullParameter($this$hide, "<this>");
        $this$hide.setVisibility(8);
    }
}
