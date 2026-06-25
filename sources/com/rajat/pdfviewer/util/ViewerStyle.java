package com.rajat.pdfviewer.util;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.Log;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.content.ContextCompat;
import com.rajat.pdfviewer.R;
import com.rajat.pdfviewer.databinding.ActivityPdfViewerBinding;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ViewerStyle.kt */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0087\b\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000e\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\u0010\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0018"}, d2 = {"Lcom/rajat/pdfviewer/util/ViewerStyle;", "", "backgroundColor", "", "progressBarDrawableResId", "<init>", "(II)V", "getBackgroundColor", "()I", "getProgressBarDrawableResId", "applyTo", "", "binding", "Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;", "component1", "component2", "copy", "equals", "", "other", "hashCode", "toString", "", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ViewerStyle {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private final int backgroundColor;
    private final int progressBarDrawableResId;

    public static /* synthetic */ ViewerStyle copy$default(ViewerStyle viewerStyle, int i, int i2, int i3, Object obj) {
        if ((i3 & 1) != 0) {
            i = viewerStyle.backgroundColor;
        }
        if ((i3 & 2) != 0) {
            i2 = viewerStyle.progressBarDrawableResId;
        }
        return viewerStyle.copy(i, i2);
    }

    public final int component1() {
        return this.backgroundColor;
    }

    public final int component2() {
        return this.progressBarDrawableResId;
    }

    public final ViewerStyle copy(int i, int i2) {
        return new ViewerStyle(i, i2);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ViewerStyle) {
            ViewerStyle viewerStyle = (ViewerStyle) obj;
            return this.backgroundColor == viewerStyle.backgroundColor && this.progressBarDrawableResId == viewerStyle.progressBarDrawableResId;
        }
        return false;
    }

    public int hashCode() {
        return (Integer.hashCode(this.backgroundColor) * 31) + Integer.hashCode(this.progressBarDrawableResId);
    }

    public String toString() {
        return "ViewerStyle(backgroundColor=" + this.backgroundColor + ", progressBarDrawableResId=" + this.progressBarDrawableResId + ')';
    }

    public ViewerStyle(int backgroundColor, int progressBarDrawableResId) {
        this.backgroundColor = backgroundColor;
        this.progressBarDrawableResId = progressBarDrawableResId;
    }

    public final int getBackgroundColor() {
        return this.backgroundColor;
    }

    public final int getProgressBarDrawableResId() {
        return this.progressBarDrawableResId;
    }

    public final void applyTo(ActivityPdfViewerBinding binding) {
        Intrinsics.checkNotNullParameter(binding, "binding");
        try {
            binding.parentLayout.setBackgroundColor(this.backgroundColor);
            binding.progressBar.setIndeterminateDrawable(ContextCompat.getDrawable(binding.getRoot().getContext(), this.progressBarDrawableResId));
        } catch (Exception e) {
            Log.w("ViewerStyle", "Failed to apply style: " + e.getLocalizedMessage());
        }
    }

    /* compiled from: ViewerStyle.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;", "", "<init>", "()V", TypedValues.TransitionType.S_FROM, "Lcom/rajat/pdfviewer/util/ViewerStyle;", "context", "Landroid/content/Context;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final ViewerStyle from(Context context) {
            Intrinsics.checkNotNullParameter(context, "context");
            TypedArray typedArray = context.getTheme().obtainStyledAttributes(R.styleable.PdfRendererView);
            Intrinsics.checkNotNullExpressionValue(typedArray, "obtainStyledAttributes(...)");
            int backgroundColor = ThemeUtils.INSTANCE.getColorFromTypedArray(typedArray, R.styleable.PdfRendererView_pdfView_backgroundColor, ContextCompat.getColor(context, R.color.pdf_viewer_surface));
            int progressBarDrawableResId = ThemeUtils.INSTANCE.getResIdFromTypedArray(typedArray, R.styleable.PdfRendererView_pdfView_progressBar, R.drawable.pdf_viewer_progress_circle);
            typedArray.recycle();
            return new ViewerStyle(backgroundColor, progressBarDrawableResId);
        }
    }
}
