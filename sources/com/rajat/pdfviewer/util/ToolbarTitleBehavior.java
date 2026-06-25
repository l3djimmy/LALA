package com.rajat.pdfviewer.util;

import android.text.TextUtils;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
/* compiled from: ToolbarTitleBehavior.kt */
@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \u00132\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0013B#\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0002\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0014"}, d2 = {"Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;", "", "isSingleLine", "", "maxLines", "", "ellipsize", "Landroid/text/TextUtils$TruncateAt;", "<init>", "(Ljava/lang/String;IZILandroid/text/TextUtils$TruncateAt;)V", "()Z", "getMaxLines", "()I", "getEllipsize", "()Landroid/text/TextUtils$TruncateAt;", "SINGLE_LINE_ELLIPSIS", "SINGLE_LINE_SCROLLABLE", "MULTI_LINE_ELLIPSIS", "MULTI_LINE_WRAP", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public enum ToolbarTitleBehavior {
    SINGLE_LINE_ELLIPSIS(true, 1, TextUtils.TruncateAt.END),
    SINGLE_LINE_SCROLLABLE(true, 1, TextUtils.TruncateAt.MARQUEE),
    MULTI_LINE_ELLIPSIS(false, 2, TextUtils.TruncateAt.END),
    MULTI_LINE_WRAP(false, Integer.MAX_VALUE, null);
    
    private final TextUtils.TruncateAt ellipsize;
    private final boolean isSingleLine;
    private final int maxLines;
    private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);
    public static final Companion Companion = new Companion(null);

    ToolbarTitleBehavior(boolean isSingleLine, int maxLines, TextUtils.TruncateAt ellipsize) {
        this.isSingleLine = isSingleLine;
        this.maxLines = maxLines;
        this.ellipsize = ellipsize;
    }

    public final boolean isSingleLine() {
        return this.isSingleLine;
    }

    public final int getMaxLines() {
        return this.maxLines;
    }

    public final TextUtils.TruncateAt getEllipsize() {
        return this.ellipsize;
    }

    /* compiled from: ToolbarTitleBehavior.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior$Companion;", "", "<init>", "()V", "fromXmlValue", "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;", "value", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final ToolbarTitleBehavior fromXmlValue(int value) {
            switch (value) {
                case 0:
                    return ToolbarTitleBehavior.SINGLE_LINE_ELLIPSIS;
                case 1:
                    return ToolbarTitleBehavior.SINGLE_LINE_SCROLLABLE;
                case 2:
                    return ToolbarTitleBehavior.MULTI_LINE_ELLIPSIS;
                case 3:
                    return ToolbarTitleBehavior.MULTI_LINE_WRAP;
                default:
                    return ToolbarTitleBehavior.MULTI_LINE_WRAP;
            }
        }
    }

    public static EnumEntries<ToolbarTitleBehavior> getEntries() {
        return $ENTRIES;
    }
}
