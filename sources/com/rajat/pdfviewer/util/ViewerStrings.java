package com.rajat.pdfviewer.util;

import android.content.Context;
import android.content.res.TypedArray;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import com.rajat.pdfviewer.R;
import java.io.FileNotFoundException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: ViewerStrings.kt */
@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b(\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\b\u0087\b\u0018\u0000 12\u00020\u0001:\u00011Bg\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\u0006\u0010\u000b\u001a\u00020\u0003\u0012\u0006\u0010\f\u001a\u00020\u0003\u0012\u0006\u0010\r\u001a\u00020\u0003\u0012\u0006\u0010\u000e\u001a\u00020\u0003¢\u0006\u0004\b\u000f\u0010\u0010J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\t\u0010!\u001a\u00020\u0003HÆ\u0003J\t\u0010\"\u001a\u00020\u0003HÆ\u0003J\t\u0010#\u001a\u00020\u0003HÆ\u0003J\t\u0010$\u001a\u00020\u0003HÆ\u0003J\t\u0010%\u001a\u00020\u0003HÆ\u0003J\t\u0010&\u001a\u00020\u0003HÆ\u0003J\t\u0010'\u001a\u00020\u0003HÆ\u0003J\t\u0010(\u001a\u00020\u0003HÆ\u0003J\t\u0010)\u001a\u00020\u0003HÆ\u0003J\u0081\u0001\u0010*\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\u00032\b\b\u0002\u0010\t\u001a\u00020\u00032\b\b\u0002\u0010\n\u001a\u00020\u00032\b\b\u0002\u0010\u000b\u001a\u00020\u00032\b\b\u0002\u0010\f\u001a\u00020\u00032\b\b\u0002\u0010\r\u001a\u00020\u00032\b\b\u0002\u0010\u000e\u001a\u00020\u0003HÆ\u0001J\u0013\u0010+\u001a\u00020,2\b\u0010-\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010.\u001a\u00020/HÖ\u0001J\t\u00100\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0012R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0012R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0012R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0012R\u0011\u0010\b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0012R\u0011\u0010\t\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0012R\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0012R\u0011\u0010\u000b\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0012R\u0011\u0010\f\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0012R\u0011\u0010\r\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0012R\u0011\u0010\u000e\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u0012¨\u00062"}, d2 = {"Lcom/rajat/pdfviewer/util/ViewerStrings;", "", "errorPdfCorrupted", "", "errorNoInternet", "fileSavedSuccessfully", "fileSavedToDownloads", "fileNotDownloadedYet", "permissionRequired", "permissionRequiredTitle", "genericError", "retry", "cancel", "grant", "errorDialogTitle", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "getErrorPdfCorrupted", "()Ljava/lang/String;", "getErrorNoInternet", "getFileSavedSuccessfully", "getFileSavedToDownloads", "getFileNotDownloadedYet", "getPermissionRequired", "getPermissionRequiredTitle", "getGenericError", "getRetry", "getCancel", "getGrant", "getErrorDialogTitle", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "component12", "copy", "equals", "", "other", "hashCode", "", "toString", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class ViewerStrings {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    private final String cancel;
    private final String errorDialogTitle;
    private final String errorNoInternet;
    private final String errorPdfCorrupted;
    private final String fileNotDownloadedYet;
    private final String fileSavedSuccessfully;
    private final String fileSavedToDownloads;
    private final String genericError;
    private final String grant;
    private final String permissionRequired;
    private final String permissionRequiredTitle;
    private final String retry;

    public static /* synthetic */ ViewerStrings copy$default(ViewerStrings viewerStrings, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, int i, Object obj) {
        if ((i & 1) != 0) {
            str = viewerStrings.errorPdfCorrupted;
        }
        if ((i & 2) != 0) {
            str2 = viewerStrings.errorNoInternet;
        }
        if ((i & 4) != 0) {
            str3 = viewerStrings.fileSavedSuccessfully;
        }
        if ((i & 8) != 0) {
            str4 = viewerStrings.fileSavedToDownloads;
        }
        if ((i & 16) != 0) {
            str5 = viewerStrings.fileNotDownloadedYet;
        }
        if ((i & 32) != 0) {
            str6 = viewerStrings.permissionRequired;
        }
        if ((i & 64) != 0) {
            str7 = viewerStrings.permissionRequiredTitle;
        }
        if ((i & 128) != 0) {
            str8 = viewerStrings.genericError;
        }
        if ((i & 256) != 0) {
            str9 = viewerStrings.retry;
        }
        if ((i & 512) != 0) {
            str10 = viewerStrings.cancel;
        }
        if ((i & 1024) != 0) {
            str11 = viewerStrings.grant;
        }
        if ((i & 2048) != 0) {
            str12 = viewerStrings.errorDialogTitle;
        }
        String str13 = str11;
        String str14 = str12;
        String str15 = str9;
        String str16 = str10;
        String str17 = str7;
        String str18 = str8;
        String str19 = str5;
        String str20 = str6;
        return viewerStrings.copy(str, str2, str3, str4, str19, str20, str17, str18, str15, str16, str13, str14);
    }

    public final String component1() {
        return this.errorPdfCorrupted;
    }

    public final String component10() {
        return this.cancel;
    }

    public final String component11() {
        return this.grant;
    }

    public final String component12() {
        return this.errorDialogTitle;
    }

    public final String component2() {
        return this.errorNoInternet;
    }

    public final String component3() {
        return this.fileSavedSuccessfully;
    }

    public final String component4() {
        return this.fileSavedToDownloads;
    }

    public final String component5() {
        return this.fileNotDownloadedYet;
    }

    public final String component6() {
        return this.permissionRequired;
    }

    public final String component7() {
        return this.permissionRequiredTitle;
    }

    public final String component8() {
        return this.genericError;
    }

    public final String component9() {
        return this.retry;
    }

    public final ViewerStrings copy(String errorPdfCorrupted, String errorNoInternet, String fileSavedSuccessfully, String fileSavedToDownloads, String fileNotDownloadedYet, String permissionRequired, String permissionRequiredTitle, String genericError, String retry, String cancel, String grant, String errorDialogTitle) {
        Intrinsics.checkNotNullParameter(errorPdfCorrupted, "errorPdfCorrupted");
        Intrinsics.checkNotNullParameter(errorNoInternet, "errorNoInternet");
        Intrinsics.checkNotNullParameter(fileSavedSuccessfully, "fileSavedSuccessfully");
        Intrinsics.checkNotNullParameter(fileSavedToDownloads, "fileSavedToDownloads");
        Intrinsics.checkNotNullParameter(fileNotDownloadedYet, "fileNotDownloadedYet");
        Intrinsics.checkNotNullParameter(permissionRequired, "permissionRequired");
        Intrinsics.checkNotNullParameter(permissionRequiredTitle, "permissionRequiredTitle");
        Intrinsics.checkNotNullParameter(genericError, "genericError");
        Intrinsics.checkNotNullParameter(retry, "retry");
        Intrinsics.checkNotNullParameter(cancel, "cancel");
        Intrinsics.checkNotNullParameter(grant, "grant");
        Intrinsics.checkNotNullParameter(errorDialogTitle, "errorDialogTitle");
        return new ViewerStrings(errorPdfCorrupted, errorNoInternet, fileSavedSuccessfully, fileSavedToDownloads, fileNotDownloadedYet, permissionRequired, permissionRequiredTitle, genericError, retry, cancel, grant, errorDialogTitle);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ViewerStrings) {
            ViewerStrings viewerStrings = (ViewerStrings) obj;
            return Intrinsics.areEqual(this.errorPdfCorrupted, viewerStrings.errorPdfCorrupted) && Intrinsics.areEqual(this.errorNoInternet, viewerStrings.errorNoInternet) && Intrinsics.areEqual(this.fileSavedSuccessfully, viewerStrings.fileSavedSuccessfully) && Intrinsics.areEqual(this.fileSavedToDownloads, viewerStrings.fileSavedToDownloads) && Intrinsics.areEqual(this.fileNotDownloadedYet, viewerStrings.fileNotDownloadedYet) && Intrinsics.areEqual(this.permissionRequired, viewerStrings.permissionRequired) && Intrinsics.areEqual(this.permissionRequiredTitle, viewerStrings.permissionRequiredTitle) && Intrinsics.areEqual(this.genericError, viewerStrings.genericError) && Intrinsics.areEqual(this.retry, viewerStrings.retry) && Intrinsics.areEqual(this.cancel, viewerStrings.cancel) && Intrinsics.areEqual(this.grant, viewerStrings.grant) && Intrinsics.areEqual(this.errorDialogTitle, viewerStrings.errorDialogTitle);
        }
        return false;
    }

    public int hashCode() {
        return (((((((((((((((((((((this.errorPdfCorrupted.hashCode() * 31) + this.errorNoInternet.hashCode()) * 31) + this.fileSavedSuccessfully.hashCode()) * 31) + this.fileSavedToDownloads.hashCode()) * 31) + this.fileNotDownloadedYet.hashCode()) * 31) + this.permissionRequired.hashCode()) * 31) + this.permissionRequiredTitle.hashCode()) * 31) + this.genericError.hashCode()) * 31) + this.retry.hashCode()) * 31) + this.cancel.hashCode()) * 31) + this.grant.hashCode()) * 31) + this.errorDialogTitle.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ViewerStrings(errorPdfCorrupted=").append(this.errorPdfCorrupted).append(", errorNoInternet=").append(this.errorNoInternet).append(", fileSavedSuccessfully=").append(this.fileSavedSuccessfully).append(", fileSavedToDownloads=").append(this.fileSavedToDownloads).append(", fileNotDownloadedYet=").append(this.fileNotDownloadedYet).append(", permissionRequired=").append(this.permissionRequired).append(", permissionRequiredTitle=").append(this.permissionRequiredTitle).append(", genericError=").append(this.genericError).append(", retry=").append(this.retry).append(", cancel=").append(this.cancel).append(", grant=").append(this.grant).append(", errorDialogTitle=");
        sb.append(this.errorDialogTitle).append(')');
        return sb.toString();
    }

    public ViewerStrings(String errorPdfCorrupted, String errorNoInternet, String fileSavedSuccessfully, String fileSavedToDownloads, String fileNotDownloadedYet, String permissionRequired, String permissionRequiredTitle, String genericError, String retry, String cancel, String grant, String errorDialogTitle) {
        Intrinsics.checkNotNullParameter(errorPdfCorrupted, "errorPdfCorrupted");
        Intrinsics.checkNotNullParameter(errorNoInternet, "errorNoInternet");
        Intrinsics.checkNotNullParameter(fileSavedSuccessfully, "fileSavedSuccessfully");
        Intrinsics.checkNotNullParameter(fileSavedToDownloads, "fileSavedToDownloads");
        Intrinsics.checkNotNullParameter(fileNotDownloadedYet, "fileNotDownloadedYet");
        Intrinsics.checkNotNullParameter(permissionRequired, "permissionRequired");
        Intrinsics.checkNotNullParameter(permissionRequiredTitle, "permissionRequiredTitle");
        Intrinsics.checkNotNullParameter(genericError, "genericError");
        Intrinsics.checkNotNullParameter(retry, "retry");
        Intrinsics.checkNotNullParameter(cancel, "cancel");
        Intrinsics.checkNotNullParameter(grant, "grant");
        Intrinsics.checkNotNullParameter(errorDialogTitle, "errorDialogTitle");
        this.errorPdfCorrupted = errorPdfCorrupted;
        this.errorNoInternet = errorNoInternet;
        this.fileSavedSuccessfully = fileSavedSuccessfully;
        this.fileSavedToDownloads = fileSavedToDownloads;
        this.fileNotDownloadedYet = fileNotDownloadedYet;
        this.permissionRequired = permissionRequired;
        this.permissionRequiredTitle = permissionRequiredTitle;
        this.genericError = genericError;
        this.retry = retry;
        this.cancel = cancel;
        this.grant = grant;
        this.errorDialogTitle = errorDialogTitle;
    }

    public final String getErrorPdfCorrupted() {
        return this.errorPdfCorrupted;
    }

    public final String getErrorNoInternet() {
        return this.errorNoInternet;
    }

    public final String getFileSavedSuccessfully() {
        return this.fileSavedSuccessfully;
    }

    public final String getFileSavedToDownloads() {
        return this.fileSavedToDownloads;
    }

    public final String getFileNotDownloadedYet() {
        return this.fileNotDownloadedYet;
    }

    public final String getPermissionRequired() {
        return this.permissionRequired;
    }

    public final String getPermissionRequiredTitle() {
        return this.permissionRequiredTitle;
    }

    public final String getGenericError() {
        return this.genericError;
    }

    public final String getRetry() {
        return this.retry;
    }

    public final String getCancel() {
        return this.cancel;
    }

    public final String getGrant() {
        return this.grant;
    }

    public final String getErrorDialogTitle() {
        return this.errorDialogTitle;
    }

    /* compiled from: ViewerStrings.kt */
    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0003\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007J\u0012\u0010\b\u001a\u00020\t*\u00020\u00052\u0006\u0010\n\u001a\u00020\u000b¨\u0006\f"}, d2 = {"Lcom/rajat/pdfviewer/util/ViewerStrings$Companion;", "", "<init>", "()V", TypedValues.TransitionType.S_FROM, "Lcom/rajat/pdfviewer/util/ViewerStrings;", "context", "Landroid/content/Context;", "getMessageForError", "", "error", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final ViewerStrings from(Context context) {
            Intrinsics.checkNotNullParameter(context, "context");
            TypedArray typedArray = context.obtainStyledAttributes(R.styleable.PdfRendererView_Strings);
            Intrinsics.checkNotNullExpressionValue(typedArray, "obtainStyledAttributes(...)");
            ViewerStrings result = new ViewerStrings(from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_error_pdf_corrupted, R.string.error_pdf_corrupted), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_error_no_internet_connection, R.string.error_no_internet_connection), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_file_saved_successfully, R.string.file_saved_successfully), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_file_saved_to_downloads, R.string.file_saved_to_downloads), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_file_not_downloaded_yet, R.string.file_not_downloaded_yet), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_permission_required, R.string.permission_required), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_permission_required_title, R.string.permission_required_title), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_pdf_viewer_error, R.string.pdf_viewer_error), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_pdf_viewer_retry, R.string.pdf_viewer_retry), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_pdf_viewer_cancel, R.string.pdf_viewer_cancel), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_pdf_viewer_grant, R.string.pdf_viewer_grant), from$getString(typedArray, context, R.styleable.PdfRendererView_Strings_pdf_viewer_error_dialog_title, R.string.pdf_viewer_error_dialog_title));
            typedArray.recycle();
            return result;
        }

        private static final String from$getString(TypedArray typedArray, Context $context, int index, int fallback) {
            String string = typedArray.getString(index);
            if (string == null) {
                String string2 = $context.getString(fallback);
                Intrinsics.checkNotNullExpressionValue(string2, "getString(...)");
                return string2;
            }
            return string;
        }

        public final String getMessageForError(ViewerStrings $this$getMessageForError, Throwable error) {
            Intrinsics.checkNotNullParameter($this$getMessageForError, "<this>");
            Intrinsics.checkNotNullParameter(error, "error");
            if (error instanceof UnknownHostException) {
                return $this$getMessageForError.getErrorNoInternet();
            }
            if (error instanceof SocketTimeoutException) {
                return "Network timeout! Please check your connection.";
            }
            if (error instanceof FileNotFoundException) {
                return "File not found on the server.";
            }
            String message = error.getMessage();
            boolean z = true;
            if (message != null && StringsKt.contains$default((CharSequence) message, (CharSequence) "Invalid content type received", false, 2, (Object) null)) {
                return "The server returned a non-PDF file. Please check the URL.";
            }
            String message2 = error.getMessage();
            if (message2 != null && StringsKt.contains$default((CharSequence) message2, (CharSequence) "Downloaded file is not a valid PDF", false, 2, (Object) null)) {
                return "The file appears to be corrupted or is not a valid PDF.";
            }
            String message3 = error.getMessage();
            if (message3 != null && StringsKt.contains$default((CharSequence) message3, (CharSequence) "Incomplete download", false, 2, (Object) null)) {
                return "The download was incomplete. Please check your internet connection and try again.";
            }
            String message4 = error.getMessage();
            if (message4 == null || !StringsKt.contains$default((CharSequence) message4, (CharSequence) "Failed to download after", false, 2, (Object) null)) {
                z = false;
            }
            if (z) {
                return "Failed to download the PDF after multiple attempts. Please check your internet connection.";
            }
            return "An unexpected error occurred: " + error.getLocalizedMessage();
        }
    }
}
