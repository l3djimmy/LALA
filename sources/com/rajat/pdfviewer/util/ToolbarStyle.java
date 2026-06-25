package com.rajat.pdfviewer.util;

import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.core.content.ContextCompat;
import androidx.core.widget.TextViewCompat;
import com.rajat.pdfviewer.PdfViewerActivity;
import com.rajat.pdfviewer.R;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ToolbarStyle.kt */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0087\b\u0018\u0000 *2\u00020\u0001:\u0001*B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\u0005\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u0005¢\u0006\u0004\b\f\u0010\rJ\u0016\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dJ\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0005HÆ\u0003J\u000b\u0010 \u001a\u0004\u0018\u00010\u0007HÆ\u0003J\t\u0010!\u001a\u00020\u0005HÆ\u0003J\t\u0010\"\u001a\u00020\nHÆ\u0003J\t\u0010#\u001a\u00020\u0005HÆ\u0003JG\u0010$\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\u0005HÆ\u0001J\u0013\u0010%\u001a\u00020\u00032\b\u0010&\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010'\u001a\u00020\u0005HÖ\u0001J\t\u0010(\u001a\u00020)HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u000b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0011¨\u0006+"}, d2 = {"Lcom/rajat/pdfviewer/util/ToolbarStyle;", "", "showToolbar", "", "toolbarColor", "", "backIcon", "Landroid/graphics/drawable/Drawable;", "titleTextStyle", "titleBehavior", "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;", "downloadIconTint", "<init>", "(ZILandroid/graphics/drawable/Drawable;ILcom/rajat/pdfviewer/util/ToolbarTitleBehavior;I)V", "getShowToolbar", "()Z", "getToolbarColor", "()I", "getBackIcon", "()Landroid/graphics/drawable/Drawable;", "getTitleTextStyle", "getTitleBehavior", "()Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;", "getDownloadIconTint", "applyTo", "", "toolbar", "Landroidx/appcompat/widget/Toolbar;", "titleView", "Landroid/widget/TextView;", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", "other", "hashCode", "toString", "", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ToolbarStyle {
    private final Drawable backIcon;
    private final int downloadIconTint;
    private final boolean showToolbar;
    private final ToolbarTitleBehavior titleBehavior;
    private final int titleTextStyle;
    private final int toolbarColor;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    public static /* synthetic */ ToolbarStyle copy$default(ToolbarStyle toolbarStyle, boolean z, int i, Drawable drawable, int i2, ToolbarTitleBehavior toolbarTitleBehavior, int i3, int i4, Object obj) {
        if ((i4 & 1) != 0) {
            z = toolbarStyle.showToolbar;
        }
        if ((i4 & 2) != 0) {
            i = toolbarStyle.toolbarColor;
        }
        if ((i4 & 4) != 0) {
            drawable = toolbarStyle.backIcon;
        }
        if ((i4 & 8) != 0) {
            i2 = toolbarStyle.titleTextStyle;
        }
        if ((i4 & 16) != 0) {
            toolbarTitleBehavior = toolbarStyle.titleBehavior;
        }
        if ((i4 & 32) != 0) {
            i3 = toolbarStyle.downloadIconTint;
        }
        ToolbarTitleBehavior toolbarTitleBehavior2 = toolbarTitleBehavior;
        int i5 = i3;
        return toolbarStyle.copy(z, i, drawable, i2, toolbarTitleBehavior2, i5);
    }

    public final boolean component1() {
        return this.showToolbar;
    }

    public final int component2() {
        return this.toolbarColor;
    }

    public final Drawable component3() {
        return this.backIcon;
    }

    public final int component4() {
        return this.titleTextStyle;
    }

    public final ToolbarTitleBehavior component5() {
        return this.titleBehavior;
    }

    public final int component6() {
        return this.downloadIconTint;
    }

    public final ToolbarStyle copy(boolean z, int i, Drawable drawable, int i2, ToolbarTitleBehavior titleBehavior, int i3) {
        Intrinsics.checkNotNullParameter(titleBehavior, "titleBehavior");
        return new ToolbarStyle(z, i, drawable, i2, titleBehavior, i3);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ToolbarStyle) {
            ToolbarStyle toolbarStyle = (ToolbarStyle) obj;
            return this.showToolbar == toolbarStyle.showToolbar && this.toolbarColor == toolbarStyle.toolbarColor && Intrinsics.areEqual(this.backIcon, toolbarStyle.backIcon) && this.titleTextStyle == toolbarStyle.titleTextStyle && this.titleBehavior == toolbarStyle.titleBehavior && this.downloadIconTint == toolbarStyle.downloadIconTint;
        }
        return false;
    }

    public int hashCode() {
        return (((((((((Boolean.hashCode(this.showToolbar) * 31) + Integer.hashCode(this.toolbarColor)) * 31) + (this.backIcon == null ? 0 : this.backIcon.hashCode())) * 31) + Integer.hashCode(this.titleTextStyle)) * 31) + this.titleBehavior.hashCode()) * 31) + Integer.hashCode(this.downloadIconTint);
    }

    public String toString() {
        return "ToolbarStyle(showToolbar=" + this.showToolbar + ", toolbarColor=" + this.toolbarColor + ", backIcon=" + this.backIcon + ", titleTextStyle=" + this.titleTextStyle + ", titleBehavior=" + this.titleBehavior + ", downloadIconTint=" + this.downloadIconTint + ')';
    }

    public ToolbarStyle(boolean showToolbar, int toolbarColor, Drawable backIcon, int titleTextStyle, ToolbarTitleBehavior titleBehavior, int downloadIconTint) {
        Intrinsics.checkNotNullParameter(titleBehavior, "titleBehavior");
        this.showToolbar = showToolbar;
        this.toolbarColor = toolbarColor;
        this.backIcon = backIcon;
        this.titleTextStyle = titleTextStyle;
        this.titleBehavior = titleBehavior;
        this.downloadIconTint = downloadIconTint;
    }

    public final boolean getShowToolbar() {
        return this.showToolbar;
    }

    public final int getToolbarColor() {
        return this.toolbarColor;
    }

    public final Drawable getBackIcon() {
        return this.backIcon;
    }

    public final int getTitleTextStyle() {
        return this.titleTextStyle;
    }

    public final ToolbarTitleBehavior getTitleBehavior() {
        return this.titleBehavior;
    }

    public final int getDownloadIconTint() {
        return this.downloadIconTint;
    }

    public final void applyTo(Toolbar toolbar, TextView titleView) {
        Intrinsics.checkNotNullParameter(toolbar, "toolbar");
        Intrinsics.checkNotNullParameter(titleView, "titleView");
        toolbar.setBackgroundColor(this.toolbarColor);
        toolbar.setNavigationIcon(this.backIcon);
        toolbar.setVisibility(this.showToolbar ? 0 : 8);
        try {
            TextViewCompat.setTextAppearance(titleView, this.titleTextStyle);
        } catch (Exception e) {
            TextViewCompat.setTextAppearance(titleView, R.style.pdfView_titleTextAppearance);
        }
        titleView.setSingleLine(this.titleBehavior.isSingleLine());
        titleView.setMaxLines(this.titleBehavior.getMaxLines());
        titleView.setEllipsize(this.titleBehavior.getEllipsize());
        if (this.titleBehavior.getEllipsize() == TextUtils.TruncateAt.MARQUEE) {
            titleView.setFocusable(true);
            titleView.setFocusableInTouchMode(true);
            titleView.requestFocus();
        }
    }

    /* compiled from: ToolbarStyle.kt */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t¨\u0006\n"}, d2 = {"Lcom/rajat/pdfviewer/util/ToolbarStyle$Companion;", "", "<init>", "()V", TypedValues.TransitionType.S_FROM, "Lcom/rajat/pdfviewer/util/ToolbarStyle;", "context", "Landroid/content/Context;", "intent", "Landroid/content/Intent;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final ToolbarStyle from(Context context, Intent intent) {
            Drawable backIcon;
            Intrinsics.checkNotNullParameter(context, "context");
            Intrinsics.checkNotNullParameter(intent, "intent");
            TypedArray typedArray = context.getTheme().obtainStyledAttributes(R.styleable.PdfRendererView_toolbar);
            Intrinsics.checkNotNullExpressionValue(typedArray, "obtainStyledAttributes(...)");
            boolean showToolbar = ThemeUtils.INSTANCE.getBooleanFromTypedArray(typedArray, R.styleable.PdfRendererView_toolbar_pdfView_showToolbar, true);
            Drawable drawable = typedArray.getDrawable(R.styleable.PdfRendererView_toolbar_pdfView_backIcon);
            if (drawable != null) {
                backIcon = drawable;
            } else {
                backIcon = ContextCompat.getDrawable(context, R.drawable.pdf_viewer_ic_arrow_back);
            }
            int toolbarColor = ThemeUtils.INSTANCE.getColorFromTypedArray(typedArray, R.styleable.PdfRendererView_toolbar_pdfView_toolbarColor, ContextCompat.getColor(context, R.color.pdf_viewer_primary));
            int titleTextStyle = ThemeUtils.INSTANCE.getResIdFromTypedArray(typedArray, R.styleable.PdfRendererView_toolbar_pdfView_titleTextStyle, R.style.pdfView_titleTextAppearance);
            Integer valueOf = Integer.valueOf(intent.getIntExtra(PdfViewerActivity.TITLE_BEHAVIOR, -1));
            int it = valueOf.intValue();
            if (!(it != -1)) {
                valueOf = null;
            }
            int behaviorIndex = valueOf != null ? valueOf.intValue() : typedArray.getInt(R.styleable.PdfRendererView_toolbar_pdfView_titleBehavior, ToolbarTitleBehavior.MULTI_LINE_WRAP.ordinal());
            int downloadIconTint = ThemeUtils.INSTANCE.getColorFromTypedArray(typedArray, R.styleable.PdfRendererView_toolbar_pdfView_downloadIconTint, ContextCompat.getColor(context, 17170443));
            typedArray.recycle();
            return new ToolbarStyle(showToolbar, toolbarColor, backIcon, titleTextStyle, ToolbarTitleBehavior.Companion.fromXmlValue(behaviorIndex), downloadIconTint);
        }
    }
}
