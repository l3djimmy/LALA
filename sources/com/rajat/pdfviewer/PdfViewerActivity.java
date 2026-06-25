package com.rajat.pdfviewer;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.Window;
import android.widget.TextView;
import android.widget.Toast;
import androidx.activity.ComponentActivity;
import androidx.activity.EdgeToEdge;
import androidx.activity.SystemBarStyle;
import androidx.activity.result.ActivityResult;
import androidx.activity.result.ActivityResultCallback;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.drawable.DrawableCompat;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleCoroutineScope;
import androidx.lifecycle.LifecycleOwnerKt;
import androidx.lifecycle.ViewModelLazy;
import androidx.lifecycle.ViewModelProvider;
import androidx.lifecycle.ViewModelStore;
import androidx.lifecycle.viewmodel.CreationExtras;
import com.google.android.material.appbar.MaterialToolbar;
import com.itextpdf.io.font.PdfEncodings;
import com.rajat.pdfviewer.databinding.ActivityPdfViewerBinding;
import com.rajat.pdfviewer.util.CacheStrategy;
import com.rajat.pdfviewer.util.EdgeToEdgeHelper;
import com.rajat.pdfviewer.util.NetworkUtil;
import com.rajat.pdfviewer.util.ThemeValidator;
import com.rajat.pdfviewer.util.ToolbarStyle;
import com.rajat.pdfviewer.util.ToolbarTitleBehavior;
import com.rajat.pdfviewer.util.ViewerStrings;
import com.rajat.pdfviewer.util.ViewerStyle;
import com.rajat.pdfviewer.util.saveTo;
import java.io.File;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.Map;
import kotlin.Lazy;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.enums.EnumEntries;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.Dispatchers;
/* compiled from: PdfViewerActivity.kt */
@Metadata(d1 = {"\u0000r\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0003\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 S2\u00020\u0001:\u0001SB\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0012\u0010&\u001a\u00020'2\b\u0010(\u001a\u0004\u0018\u00010)H\u0014J\b\u0010*\u001a\u00020'H\u0002J\u0010\u0010+\u001a\u00020'2\u0006\u0010,\u001a\u00020-H\u0002J\b\u0010.\u001a\u00020'H\u0002J\b\u0010/\u001a\u00020'H\u0002J\b\u00100\u001a\u00020'H\u0002J\u0010\u00101\u001a\u00020#2\u0006\u00102\u001a\u000203H\u0002J\u0018\u00104\u001a\u00020'2\u0006\u00105\u001a\u00020\u00052\u0006\u00106\u001a\u00020#H\u0002J\u0010\u00107\u001a\u00020#2\u0006\u00108\u001a\u000209H\u0016J\b\u0010:\u001a\u00020#H\u0007J\u0010\u0010;\u001a\u00020#2\u0006\u0010<\u001a\u00020\u0011H\u0016J\u0012\u0010=\u001a\u00020'2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0005H\u0002J\u0012\u0010>\u001a\u00020'2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0005H\u0002J\u0018\u0010?\u001a\u00020'2\b\u0010@\u001a\u0004\u0018\u00010\u0005H\u0082@¢\u0006\u0002\u0010AJ\u0010\u0010B\u001a\u00020'2\u0006\u0010C\u001a\u00020\u0005H\u0002J\f\u0010D\u001a\u00020'*\u00020#H\u0002J\b\u0010G\u001a\u00020'H\u0002J\b\u0010H\u001a\u00020'H\u0002J\u0006\u0010I\u001a\u00020'J\u0010\u0010J\u001a\u00020'2\u0006\u0010K\u001a\u00020\u0005H\u0002J\u0018\u0010N\u001a\u00020'2\u0006\u0010@\u001a\u00020\u00052\u0006\u0010K\u001a\u00020\u0005H\u0002J\u0018\u0010O\u001a\u00020'2\u0006\u0010@\u001a\u00020\u00052\u0006\u0010K\u001a\u00020\u0005H\u0002J\b\u0010P\u001a\u00020'H\u0014J\u0010\u0010Q\u001a\u00020'2\u0006\u0010R\u001a\u00020#H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0005X\u0082.¢\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082.¢\u0006\u0002\n\u0000R\u001b\u0010\u0017\u001a\u00020\u00188BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u0019\u0010\u001aR\u001c\u0010\u001d\u001a\u0004\u0018\u00010\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001e\u0010\u001f\"\u0004\b \u0010!R\u000e\u0010\"\u001a\u00020#X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020%X\u0082.¢\u0006\u0002\n\u0000R\u0014\u0010E\u001a\b\u0012\u0004\u0012\u00020\u00050FX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010L\u001a\b\u0012\u0004\u0012\u00020M0FX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006T"}, d2 = {"Lcom/rajat/pdfviewer/PdfViewerActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "<init>", "()V", "file_not_downloaded_yet", "", "file_saved_to_downloads", "file_saved_successfully", "error_no_internet_connection", "permission_required", "permission_required_title", "error_pdf_corrupted", "pdf_viewer_retry", "pdf_viewer_grant", "pdf_viewer_cancel", "pdf_viewer_error", "menuItem", "Landroid/view/MenuItem;", "fileUrl", "headers", "Lcom/rajat/pdfviewer/HeaderData;", "binding", "Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;", "viewModel", "Lcom/rajat/pdfviewer/PdfViewerViewModel;", "getViewModel", "()Lcom/rajat/pdfviewer/PdfViewerViewModel;", "viewModel$delegate", "Lkotlin/Lazy;", "downloadedFilePath", "getDownloadedFilePath", "()Ljava/lang/String;", "setDownloadedFilePath", "(Ljava/lang/String;)V", "isDownloadButtonEnabled", "", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "configureToolbar", "applyEdgeToEdge", "window", "Landroid/view/Window;", "applyThemeAttributes", "extractIntentExtras", "init", "isRetryable", "error", "", "showErrorDialog", "message", "shouldRetry", "onCreateOptionsMenu", "menu", "Landroid/view/Menu;", "isDownloadButtonVisible", "onOptionsItemSelected", "item", "loadFileFromNetwork", "initPdfViewer", "initPdfViewerWithPath", "filePath", "(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "onPdfError", "e", "showProgressBar", "requestPermissionLauncher", "Landroidx/activity/result/ActivityResultLauncher;", "requestStoragePermission", "checkAndStartDownload", "startDownload", "promptUserForLocation", "fileName", "createFileLauncher", "Landroid/content/Intent;", "saveFileToPublicDirectoryScopedStorage", "saveFileToPublicDirectoryLegacy", "onDestroy", "updateDownloadButtonState", "isEnabled", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfViewerActivity extends AppCompatActivity {
    public static final String CACHE_STRATEGY = "cache_strategy";
    public static final String ENABLE_FILE_DOWNLOAD = "enable_download";
    public static final String ENABLE_ZOOM = "enable_zoom";
    public static final String FILE_TITLE = "pdf_file_title";
    public static final String FILE_URL = "pdf_file_url";
    public static final String FROM_ASSETS = "from_assests";
    public static final String TITLE_BEHAVIOR = "title_behavior";
    private static boolean enableDownload;
    private static boolean isFromAssets;
    private static boolean isPDFFromPath;
    private ActivityPdfViewerBinding binding;
    private CacheStrategy cacheStrategy;
    private final ActivityResultLauncher<Intent> createFileLauncher;
    private String downloadedFilePath;
    private String error_no_internet_connection;
    private String error_pdf_corrupted;
    private String fileUrl;
    private String file_not_downloaded_yet;
    private String file_saved_successfully;
    private String file_saved_to_downloads;
    private HeaderData headers;
    private boolean isDownloadButtonEnabled;
    private MenuItem menuItem;
    private String pdf_viewer_cancel;
    private String pdf_viewer_error;
    private String pdf_viewer_grant;
    private String pdf_viewer_retry;
    private String permission_required;
    private String permission_required_title;
    private final ActivityResultLauncher<String> requestPermissionLauncher;
    private final Lazy viewModel$delegate;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static boolean SAVE_TO_DOWNLOADS = true;
    private static boolean isZoomEnabled = true;

    public PdfViewerActivity() {
        final PdfViewerActivity $this$viewModels_u24default$iv = this;
        Function0 factoryPromise$iv = new Function0<ViewModelProvider.Factory>() { // from class: com.rajat.pdfviewer.PdfViewerActivity$special$$inlined$viewModels$default$1
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final ViewModelProvider.Factory invoke() {
                return ComponentActivity.this.getDefaultViewModelProviderFactory();
            }
        };
        this.viewModel$delegate = new ViewModelLazy(Reflection.getOrCreateKotlinClass(PdfViewerViewModel.class), new Function0<ViewModelStore>() { // from class: com.rajat.pdfviewer.PdfViewerActivity$special$$inlined$viewModels$default$2
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final ViewModelStore invoke() {
                return ComponentActivity.this.getViewModelStore();
            }
        }, factoryPromise$iv, new Function0<CreationExtras>() { // from class: com.rajat.pdfviewer.PdfViewerActivity$special$$inlined$viewModels$default$3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final CreationExtras invoke() {
                CreationExtras creationExtras;
                Function0 function0 = Function0.this;
                return (function0 == null || (creationExtras = (CreationExtras) function0.invoke()) == null) ? $this$viewModels_u24default$iv.getDefaultViewModelCreationExtras() : creationExtras;
            }
        });
        this.requestPermissionLauncher = registerForActivityResult(new ActivityResultContracts.RequestPermission(), new ActivityResultCallback() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda4
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                PdfViewerActivity.requestPermissionLauncher$lambda$8(PdfViewerActivity.this, ((Boolean) obj).booleanValue());
            }
        });
        this.createFileLauncher = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new ActivityResultCallback() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda5
            @Override // androidx.activity.result.ActivityResultCallback
            public final void onActivityResult(Object obj) {
                PdfViewerActivity.createFileLauncher$lambda$12(PdfViewerActivity.this, (ActivityResult) obj);
            }
        });
    }

    private final PdfViewerViewModel getViewModel() {
        return (PdfViewerViewModel) this.viewModel$delegate.getValue();
    }

    public final String getDownloadedFilePath() {
        return this.downloadedFilePath;
    }

    public final void setDownloadedFilePath(String str) {
        this.downloadedFilePath = str;
    }

    /* compiled from: PdfViewerActivity.kt */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003Jl\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\b\u0010\u001f\u001a\u0004\u0018\u00010\u00052\b\u0010 \u001a\u0004\u0018\u00010\u00052\u0006\u0010!\u001a\u00020\"2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010#\u001a\u00020\f2\u0014\b\u0002\u0010$\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00050%2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010'2\b\b\u0002\u0010(\u001a\u00020)JV\u0010*\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\b\u0010+\u001a\u0004\u0018\u00010\u00052\b\u0010 \u001a\u0004\u0018\u00010\u00052\u0006\u0010!\u001a\u00020\"2\b\b\u0002\u0010,\u001a\u00020\f2\b\b\u0002\u0010#\u001a\u00020\f2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010'2\b\b\u0002\u0010(\u001a\u00020)R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u00020\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001a\u0010\u0011\u001a\u00020\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u000e\"\u0004\b\u0012\u0010\u0010R\u001a\u0010\u0013\u001a\u00020\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u000e\"\u0004\b\u0014\u0010\u0010R\u001a\u0010\u0015\u001a\u00020\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u000e\"\u0004\b\u0017\u0010\u0010R\u001a\u0010\u0018\u001a\u00020\fX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u000e\"\u0004\b\u0019\u0010\u0010R\u000e\u0010\u001a\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Lcom/rajat/pdfviewer/PdfViewerActivity$Companion;", "", "<init>", "()V", "FILE_URL", "", "FILE_TITLE", "ENABLE_FILE_DOWNLOAD", "FROM_ASSETS", "TITLE_BEHAVIOR", "ENABLE_ZOOM", "enableDownload", "", "getEnableDownload", "()Z", "setEnableDownload", "(Z)V", "isPDFFromPath", "setPDFFromPath", "isFromAssets", "setFromAssets", "SAVE_TO_DOWNLOADS", "getSAVE_TO_DOWNLOADS", "setSAVE_TO_DOWNLOADS", "isZoomEnabled", "setZoomEnabled", "CACHE_STRATEGY", "launchPdfFromUrl", "Landroid/content/Intent;", "context", "Landroid/content/Context;", "pdfUrl", "pdfTitle", "saveTo", "Lcom/rajat/pdfviewer/util/saveTo;", "enableZoom", "headers", "", "toolbarTitleBehavior", "Lcom/rajat/pdfviewer/util/ToolbarTitleBehavior;", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "launchPdfFromPath", "path", "fromAssets", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final boolean getEnableDownload() {
            return PdfViewerActivity.enableDownload;
        }

        public final void setEnableDownload(boolean z) {
            PdfViewerActivity.enableDownload = z;
        }

        public final boolean isPDFFromPath() {
            return PdfViewerActivity.isPDFFromPath;
        }

        public final void setPDFFromPath(boolean z) {
            PdfViewerActivity.isPDFFromPath = z;
        }

        public final boolean isFromAssets() {
            return PdfViewerActivity.isFromAssets;
        }

        public final void setFromAssets(boolean z) {
            PdfViewerActivity.isFromAssets = z;
        }

        public final boolean getSAVE_TO_DOWNLOADS() {
            return PdfViewerActivity.SAVE_TO_DOWNLOADS;
        }

        public final void setSAVE_TO_DOWNLOADS(boolean z) {
            PdfViewerActivity.SAVE_TO_DOWNLOADS = z;
        }

        public final boolean isZoomEnabled() {
            return PdfViewerActivity.isZoomEnabled;
        }

        public final void setZoomEnabled(boolean z) {
            PdfViewerActivity.isZoomEnabled = z;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ Intent launchPdfFromUrl$default(Companion companion, Context context, String str, String str2, saveTo saveto, boolean z, boolean z2, Map map, ToolbarTitleBehavior toolbarTitleBehavior, CacheStrategy cacheStrategy, int i, Object obj) {
            if ((i & 16) != 0) {
                z = true;
            }
            if ((i & 32) != 0) {
                z2 = true;
            }
            if ((i & 64) != 0) {
                map = MapsKt.emptyMap();
            }
            if ((i & 128) != 0) {
                toolbarTitleBehavior = null;
            }
            if ((i & 256) != 0) {
                cacheStrategy = CacheStrategy.MAXIMIZE_PERFORMANCE;
            }
            return companion.launchPdfFromUrl(context, str, str2, saveto, z, z2, map, toolbarTitleBehavior, cacheStrategy);
        }

        public final Intent launchPdfFromUrl(Context context, String pdfUrl, String pdfTitle, saveTo saveTo, boolean enableDownload, boolean enableZoom, Map<String, String> headers, ToolbarTitleBehavior toolbarTitleBehavior, CacheStrategy cacheStrategy) {
            Intrinsics.checkNotNullParameter(saveTo, "saveTo");
            Intrinsics.checkNotNullParameter(headers, "headers");
            Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
            Intent intent = new Intent(context, PdfViewerActivity.class);
            intent.putExtra(PdfViewerActivity.FILE_URL, pdfUrl);
            intent.putExtra(PdfViewerActivity.FILE_TITLE, pdfTitle);
            intent.putExtra(PdfViewerActivity.ENABLE_FILE_DOWNLOAD, enableDownload);
            intent.putExtra("headers", new HeaderData(headers));
            intent.putExtra(PdfViewerActivity.ENABLE_ZOOM, enableZoom);
            if (toolbarTitleBehavior != null) {
                intent.putExtra(PdfViewerActivity.TITLE_BEHAVIOR, toolbarTitleBehavior.ordinal());
            }
            intent.putExtra(PdfViewerActivity.CACHE_STRATEGY, cacheStrategy.ordinal());
            setPDFFromPath(false);
            setSAVE_TO_DOWNLOADS(saveTo == saveTo.DOWNLOADS);
            return intent;
        }

        public final Intent launchPdfFromPath(Context context, String path, String pdfTitle, saveTo saveTo, boolean fromAssets, boolean enableZoom, ToolbarTitleBehavior toolbarTitleBehavior, CacheStrategy cacheStrategy) {
            Intrinsics.checkNotNullParameter(saveTo, "saveTo");
            Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
            Intent intent = new Intent(context, PdfViewerActivity.class);
            intent.putExtra(PdfViewerActivity.FILE_URL, path);
            intent.putExtra(PdfViewerActivity.FILE_TITLE, pdfTitle);
            intent.putExtra(PdfViewerActivity.ENABLE_FILE_DOWNLOAD, false);
            intent.putExtra(PdfViewerActivity.FROM_ASSETS, fromAssets);
            if (toolbarTitleBehavior != null) {
                intent.putExtra(PdfViewerActivity.TITLE_BEHAVIOR, toolbarTitleBehavior.ordinal());
            }
            intent.putExtra(PdfViewerActivity.ENABLE_ZOOM, enableZoom);
            intent.putExtra(PdfViewerActivity.CACHE_STRATEGY, cacheStrategy.ordinal());
            setPDFFromPath(true);
            setSAVE_TO_DOWNLOADS(saveTo == saveTo.DOWNLOADS);
            return intent;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.Theme_PdfView_SelectedTheme);
        ThemeValidator.INSTANCE.validatePdfViewerTheme(this);
        super.onCreate(savedInstanceState);
        this.binding = ActivityPdfViewerBinding.inflate(getLayoutInflater());
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        setContentView(activityPdfViewerBinding.getRoot());
        if (Build.VERSION.SDK_INT >= 34) {
            Window window = getWindow();
            Intrinsics.checkNotNullExpressionValue(window, "getWindow(...)");
            applyEdgeToEdge(window);
        }
        configureToolbar();
        applyThemeAttributes();
        extractIntentExtras();
        init();
    }

    private final void configureToolbar() {
        Intent intent = getIntent();
        Intrinsics.checkNotNullExpressionValue(intent, "getIntent(...)");
        ToolbarStyle toolbarStyle = ToolbarStyle.Companion.from(this, intent);
        String toolbarTitle = getIntent().getStringExtra(FILE_TITLE);
        if (toolbarTitle == null) {
            toolbarTitle = PdfEncodings.PDF_DOC_ENCODING;
        }
        try {
            ActionBar supportActionBar = getSupportActionBar();
            if (supportActionBar != null) {
                supportActionBar.hide();
            }
        } catch (IllegalStateException e) {
            Log.w("PdfViewer", "supportActionBar check failed: " + e.getMessage());
        }
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        ActivityPdfViewerBinding activityPdfViewerBinding2 = null;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        activityPdfViewerBinding.myToolbar.setVisibility(0);
        try {
            ActivityPdfViewerBinding activityPdfViewerBinding3 = this.binding;
            if (activityPdfViewerBinding3 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("binding");
                activityPdfViewerBinding3 = null;
            }
            setSupportActionBar(activityPdfViewerBinding3.myToolbar);
            ActionBar supportActionBar2 = getSupportActionBar();
            if (supportActionBar2 != null) {
                supportActionBar2.setDisplayShowTitleEnabled(false);
            }
        } catch (IllegalStateException e2) {
            Log.e("PdfViewer", "Can't setSupportActionBar(): " + e2.getMessage());
        }
        ActivityPdfViewerBinding activityPdfViewerBinding4 = this.binding;
        if (activityPdfViewerBinding4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding4 = null;
        }
        MaterialToolbar myToolbar = activityPdfViewerBinding4.myToolbar;
        Intrinsics.checkNotNullExpressionValue(myToolbar, "myToolbar");
        MaterialToolbar materialToolbar = myToolbar;
        ActivityPdfViewerBinding activityPdfViewerBinding5 = this.binding;
        if (activityPdfViewerBinding5 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding5 = null;
        }
        TextView toolbarTitle2 = activityPdfViewerBinding5.toolbarTitle;
        Intrinsics.checkNotNullExpressionValue(toolbarTitle2, "toolbarTitle");
        toolbarStyle.applyTo(materialToolbar, toolbarTitle2);
        ActivityPdfViewerBinding activityPdfViewerBinding6 = this.binding;
        if (activityPdfViewerBinding6 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
        } else {
            activityPdfViewerBinding2 = activityPdfViewerBinding6;
        }
        activityPdfViewerBinding2.toolbarTitle.setText(toolbarTitle);
    }

    private final void applyEdgeToEdge(Window window) {
        SystemBarStyle light;
        boolean isDarkMode = EdgeToEdgeHelper.INSTANCE.isDarkModeEnabled(getResources().getConfiguration().uiMode);
        Intent intent = getIntent();
        Intrinsics.checkNotNullExpressionValue(intent, "getIntent(...)");
        int toolbarColor = ToolbarStyle.Companion.from(this, intent).getToolbarColor();
        PdfViewerActivity pdfViewerActivity = this;
        if (isDarkMode) {
            light = SystemBarStyle.Companion.dark(toolbarColor);
        } else {
            light = SystemBarStyle.Companion.light(toolbarColor, toolbarColor);
        }
        ActivityPdfViewerBinding activityPdfViewerBinding = null;
        EdgeToEdge.enable$default(pdfViewerActivity, light, null, 2, null);
        EdgeToEdgeHelper edgeToEdgeHelper = EdgeToEdgeHelper.INSTANCE;
        ActivityPdfViewerBinding activityPdfViewerBinding2 = this.binding;
        if (activityPdfViewerBinding2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
        } else {
            activityPdfViewerBinding = activityPdfViewerBinding2;
        }
        ConstraintLayout root = activityPdfViewerBinding.getRoot();
        Intrinsics.checkNotNullExpressionValue(root, "getRoot(...)");
        EdgeToEdgeHelper.applyInsets$default(edgeToEdgeHelper, window, root, isDarkMode, null, 8, null);
    }

    private final void applyThemeAttributes() {
        ViewerStyle from = ViewerStyle.Companion.from(this);
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        from.applyTo(activityPdfViewerBinding);
    }

    private final void extractIntentExtras() {
        HeaderData headerData;
        boolean z = false;
        enableDownload = getIntent().getBooleanExtra(ENABLE_FILE_DOWNLOAD, false);
        isFromAssets = getIntent().getBooleanExtra(FROM_ASSETS, false);
        if (Build.VERSION.SDK_INT > 33) {
            headerData = (HeaderData) getIntent().getParcelableExtra("headers", HeaderData.class);
        } else {
            headerData = (HeaderData) getIntent().getParcelableExtra("headers");
        }
        if (headerData == null) {
            headerData = new HeaderData(MapsKt.emptyMap());
        }
        this.headers = headerData;
        isZoomEnabled = getIntent().getBooleanExtra(ENABLE_ZOOM, true);
        int strategyOrdinal = getIntent().getIntExtra(CACHE_STRATEGY, CacheStrategy.MAXIMIZE_PERFORMANCE.ordinal());
        EnumEntries<CacheStrategy> entries = CacheStrategy.getEntries();
        if (strategyOrdinal >= 0 && strategyOrdinal < entries.size()) {
            z = true;
        }
        this.cacheStrategy = (CacheStrategy) (z ? entries.get(strategyOrdinal) : CacheStrategy.MAXIMIZE_PERFORMANCE);
        ViewerStrings strings = ViewerStrings.Companion.from(this);
        this.error_pdf_corrupted = strings.getErrorPdfCorrupted();
        this.error_no_internet_connection = strings.getErrorNoInternet();
        this.file_saved_successfully = strings.getFileSavedSuccessfully();
        this.file_saved_to_downloads = strings.getFileSavedToDownloads();
        this.file_not_downloaded_yet = strings.getFileNotDownloadedYet();
        this.permission_required = strings.getPermissionRequired();
        this.permission_required_title = strings.getPermissionRequiredTitle();
        this.pdf_viewer_error = strings.getGenericError();
        this.pdf_viewer_retry = strings.getRetry();
        this.pdf_viewer_cancel = strings.getCancel();
        this.pdf_viewer_grant = strings.getGrant();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void init() {
        String fileUrl;
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        String str = null;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        activityPdfViewerBinding.pdfView.setStatusListener(new PdfViewerActivity$init$1(this));
        Bundle extras = getIntent().getExtras();
        if (extras != null && (fileUrl = extras.getString(FILE_URL)) != null) {
            this.fileUrl = fileUrl;
            if (isPDFFromPath) {
                BuildersKt__Builders_commonKt.launch$default(LifecycleOwnerKt.getLifecycleScope(this), null, null, new PdfViewerActivity$init$2$1(this, fileUrl, null), 3, null);
            } else if (NetworkUtil.INSTANCE.checkInternetConnection(this)) {
                loadFileFromNetwork(fileUrl);
            } else {
                PdfViewerActivity pdfViewerActivity = this;
                String str2 = this.error_no_internet_connection;
                if (str2 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("error_no_internet_connection");
                } else {
                    str = str2;
                }
                Toast.makeText(pdfViewerActivity, str, 0).show();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isRetryable(Throwable error) {
        if ((error instanceof UnknownHostException) || (error instanceof SocketTimeoutException)) {
            return true;
        }
        String message = error.getMessage();
        if (message != null && StringsKt.contains$default((CharSequence) message, (CharSequence) "Failed to download", false, 2, (Object) null)) {
            return true;
        }
        String message2 = error.getMessage();
        return message2 != null && StringsKt.contains$default((CharSequence) message2, (CharSequence) "Incomplete download", false, 2, (Object) null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void showErrorDialog(String message, boolean shouldRetry) {
        ViewerStrings strings = ViewerStrings.Companion.from(this);
        AlertDialog.Builder builder = new AlertDialog.Builder(this).setTitle(strings.getErrorDialogTitle()).setMessage(message);
        if (shouldRetry) {
            String str = this.pdf_viewer_retry;
            if (str == null) {
                Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_retry");
                str = null;
            }
            builder.setPositiveButton(str, new DialogInterface.OnClickListener() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda2
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    r0.loadFileFromNetwork(PdfViewerActivity.this.fileUrl);
                }
            });
        }
        String str2 = this.pdf_viewer_cancel;
        if (str2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_cancel");
            str2 = null;
        }
        builder.setNegativeButton(str2, (DialogInterface.OnClickListener) null).show();
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        Drawable icon;
        Drawable it;
        Intrinsics.checkNotNullParameter(menu, "menu");
        MenuInflater inflater = getMenuInflater();
        Intrinsics.checkNotNullExpressionValue(inflater, "getMenuInflater(...)");
        inflater.inflate(R.menu.menu, menu);
        this.menuItem = menu.findItem(R.id.download);
        MenuItem menuItem = this.menuItem;
        if (menuItem != null) {
            menuItem.setVisible(enableDownload);
        }
        Intent intent = getIntent();
        Intrinsics.checkNotNullExpressionValue(intent, "getIntent(...)");
        ToolbarStyle toolbarStyle = ToolbarStyle.Companion.from(this, intent);
        MenuItem menuItem2 = this.menuItem;
        if (menuItem2 != null && (icon = menuItem2.getIcon()) != null && (it = icon.mutate()) != null) {
            Drawable wrappedIcon = DrawableCompat.wrap(it);
            Intrinsics.checkNotNullExpressionValue(wrappedIcon, "wrap(...)");
            DrawableCompat.setTint(wrappedIcon, toolbarStyle.getDownloadIconTint());
            MenuItem menuItem3 = this.menuItem;
            if (menuItem3 != null) {
                menuItem3.setIcon(wrappedIcon);
            }
        }
        updateDownloadButtonState(this.isDownloadButtonEnabled);
        return true;
    }

    public final boolean isDownloadButtonVisible() {
        MenuItem menuItem = this.menuItem;
        return menuItem != null && menuItem.isVisible();
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        Intrinsics.checkNotNullParameter(item, "item");
        int itemId = item.getItemId();
        if (itemId == R.id.download) {
            checkAndStartDownload();
            return true;
        } else if (itemId == 16908332) {
            finish();
            return true;
        } else {
            return super.onOptionsItemSelected(item);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void loadFileFromNetwork(String fileUrl) {
        initPdfViewer(fileUrl);
    }

    private final void initPdfViewer(String fileUrl) {
        PdfRendererView pdfRendererView;
        HeaderData headerData;
        LifecycleCoroutineScope lifecycleScope;
        Lifecycle lifecycle;
        CacheStrategy cacheStrategy;
        if (TextUtils.isEmpty(fileUrl)) {
            onPdfError("");
        }
        try {
            ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
            if (activityPdfViewerBinding == null) {
                try {
                    Intrinsics.throwUninitializedPropertyAccessException("binding");
                    activityPdfViewerBinding = null;
                } catch (Exception e) {
                    e = e;
                    onPdfError(e.toString());
                }
            }
            activityPdfViewerBinding.pdfView.setZoomEnabled(isZoomEnabled);
            ActivityPdfViewerBinding activityPdfViewerBinding2 = this.binding;
            if (activityPdfViewerBinding2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("binding");
                activityPdfViewerBinding2 = null;
            }
            pdfRendererView = activityPdfViewerBinding2.pdfView;
            Intrinsics.checkNotNull(fileUrl);
            HeaderData headerData2 = this.headers;
            if (headerData2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("headers");
                headerData = null;
            } else {
                headerData = headerData2;
            }
            lifecycleScope = LifecycleOwnerKt.getLifecycleScope(this);
            lifecycle = getLifecycle();
            CacheStrategy cacheStrategy2 = this.cacheStrategy;
            if (cacheStrategy2 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("cacheStrategy");
                cacheStrategy = null;
            } else {
                cacheStrategy = cacheStrategy2;
            }
        } catch (Exception e2) {
            e = e2;
        }
        try {
            pdfRendererView.initWithUrl(fileUrl, headerData, lifecycleScope, lifecycle, cacheStrategy);
        } catch (Exception e3) {
            e = e3;
            onPdfError(e.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't wrap try/catch for region: R(9:1|(2:3|(6:5|6|7|8|27|28))|54|6|7|8|27|28|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x003a, code lost:
        r2 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x007c, code lost:
        if (r9 == r2) goto L46;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0033 A[Catch: Exception -> 0x003a, TRY_LEAVE, TryCatch #1 {Exception -> 0x003a, blocks: (B:13:0x002e, B:35:0x0095, B:14:0x0033), top: B:58:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a8 A[Catch: Exception -> 0x00cc, TRY_ENTER, TryCatch #0 {Exception -> 0x00cc, blocks: (B:38:0x00a1, B:41:0x00a8, B:42:0x00ac, B:44:0x00b7, B:45:0x00bb, B:47:0x00c1, B:49:0x00c8, B:28:0x007f, B:23:0x0053, B:25:0x0060, B:29:0x0082, B:31:0x0086, B:37:0x009b), top: B:56:0x0053 }] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b7 A[Catch: Exception -> 0x00cc, TryCatch #0 {Exception -> 0x00cc, blocks: (B:38:0x00a1, B:41:0x00a8, B:42:0x00ac, B:44:0x00b7, B:45:0x00bb, B:47:0x00c1, B:49:0x00c8, B:28:0x007f, B:23:0x0053, B:25:0x0060, B:29:0x0082, B:31:0x0086, B:37:0x009b), top: B:56:0x0053 }] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00c1 A[Catch: Exception -> 0x00cc, TryCatch #0 {Exception -> 0x00cc, blocks: (B:38:0x00a1, B:41:0x00a8, B:42:0x00ac, B:44:0x00b7, B:45:0x00bb, B:47:0x00c1, B:49:0x00c8, B:28:0x007f, B:23:0x0053, B:25:0x0060, B:29:0x0082, B:31:0x0086, B:37:0x009b), top: B:56:0x0053 }] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00c7  */
    /* JADX WARN: Type inference failed for: r9v14 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object initPdfViewerWithPath(java.lang.String r9, kotlin.coroutines.Continuation<? super kotlin.Unit> r10) {
        /*
            Method dump skipped, instructions count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfViewerActivity.initPdfViewerWithPath(java.lang.String, kotlin.coroutines.Continuation):java.lang.Object");
    }

    private final void onPdfError(String e) {
        Log.e("Pdf render error", e);
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        String str = this.pdf_viewer_error;
        if (str == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_error");
            str = null;
        }
        AlertDialog.Builder title = builder.setTitle(str);
        String str2 = this.error_pdf_corrupted;
        if (str2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("error_pdf_corrupted");
            str2 = null;
        }
        AlertDialog.Builder message = title.setMessage(str2);
        String str3 = this.pdf_viewer_retry;
        if (str3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_retry");
            str3 = null;
        }
        AlertDialog.Builder positiveButton = message.setPositiveButton(str3, new DialogInterface.OnClickListener() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda3
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                r0.runOnUiThread(new Runnable() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        PdfViewerActivity.this.init();
                    }
                });
            }
        });
        String str4 = this.pdf_viewer_cancel;
        if (str4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_cancel");
            str4 = null;
        }
        positiveButton.setNegativeButton(str4, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void showProgressBar(boolean $this$showProgressBar) {
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        activityPdfViewerBinding.progressBar.setVisibility($this$showProgressBar ? 0 : 8);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void requestPermissionLauncher$lambda$8(final PdfViewerActivity this$0, boolean isGranted) {
        if (isGranted) {
            this$0.startDownload();
            return;
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(this$0);
        String str = this$0.permission_required_title;
        if (str == null) {
            Intrinsics.throwUninitializedPropertyAccessException("permission_required_title");
            str = null;
        }
        AlertDialog.Builder title = builder.setTitle(str);
        String str2 = this$0.permission_required;
        if (str2 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("permission_required");
            str2 = null;
        }
        AlertDialog.Builder message = title.setMessage(str2);
        String str3 = this$0.pdf_viewer_grant;
        if (str3 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_grant");
            str3 = null;
        }
        AlertDialog.Builder positiveButton = message.setPositiveButton(str3, new DialogInterface.OnClickListener() { // from class: com.rajat.pdfviewer.PdfViewerActivity$$ExternalSyntheticLambda0
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                PdfViewerActivity.requestPermissionLauncher$lambda$8$lambda$7(PdfViewerActivity.this, dialogInterface, i);
            }
        });
        String str4 = this$0.pdf_viewer_cancel;
        if (str4 == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdf_viewer_cancel");
            str4 = null;
        }
        positiveButton.setNegativeButton(str4, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void requestPermissionLauncher$lambda$8$lambda$7(PdfViewerActivity this$0, DialogInterface dialog, int which) {
        Intrinsics.checkNotNullParameter(dialog, "dialog");
        this$0.requestStoragePermission();
    }

    private final void requestStoragePermission() {
        this.requestPermissionLauncher.launch("android.permission.WRITE_EXTERNAL_STORAGE");
    }

    private final void checkAndStartDownload() {
        if (Build.VERSION.SDK_INT < 30) {
            if (ContextCompat.checkSelfPermission(this, "android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
                this.requestPermissionLauncher.launch("android.permission.WRITE_EXTERNAL_STORAGE");
                return;
            } else {
                startDownload();
                return;
            }
        }
        startDownload();
    }

    public final void startDownload() {
        String fileName = getIntent().getStringExtra(FILE_TITLE);
        if (fileName == null) {
            fileName = "downloaded_file.pdf";
        }
        String filePath = this.downloadedFilePath;
        if (filePath != null) {
            if (SAVE_TO_DOWNLOADS) {
                if (Build.VERSION.SDK_INT >= 29) {
                    saveFileToPublicDirectoryScopedStorage(filePath, fileName);
                    return;
                } else {
                    saveFileToPublicDirectoryLegacy(filePath, fileName);
                    return;
                }
            }
            promptUserForLocation(fileName);
            return;
        }
        PdfViewerActivity pdfViewerActivity = this;
        String str = this.file_not_downloaded_yet;
        if (str == null) {
            Intrinsics.throwUninitializedPropertyAccessException("file_not_downloaded_yet");
            str = null;
        }
        Toast.makeText(pdfViewerActivity, str, 0).show();
    }

    private final void promptUserForLocation(String fileName) {
        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("application/pdf");
        intent.putExtra("android.intent.extra.TITLE", fileName);
        this.createFileLauncher.launch(intent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void createFileLauncher$lambda$12(PdfViewerActivity this$0, ActivityResult result) {
        Intent data;
        Uri uri;
        Intrinsics.checkNotNullParameter(result, "result");
        if (result.getResultCode() == -1 && (data = result.getData()) != null && (uri = data.getData()) != null) {
            BuildersKt__Builders_commonKt.launch$default(LifecycleOwnerKt.getLifecycleScope(this$0), Dispatchers.getIO(), null, new PdfViewerActivity$createFileLauncher$1$1$1(this$0, uri, null), 2, null);
        }
    }

    private final void saveFileToPublicDirectoryScopedStorage(String filePath, String fileName) {
        BuildersKt__Builders_commonKt.launch$default(LifecycleOwnerKt.getLifecycleScope(this), null, null, new PdfViewerActivity$saveFileToPublicDirectoryScopedStorage$1(this, fileName, filePath, null), 3, null);
    }

    private final void saveFileToPublicDirectoryLegacy(String filePath, String fileName) {
        File destinationFile = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), fileName);
        FilesKt.copyTo$default(new File(filePath), destinationFile, true, 0, 4, null);
        PdfViewerActivity pdfViewerActivity = this;
        String str = this.file_saved_to_downloads;
        if (str == null) {
            Intrinsics.throwUninitializedPropertyAccessException("file_saved_to_downloads");
            str = null;
        }
        Toast.makeText(pdfViewerActivity, str, 0).show();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.appcompat.app.AppCompatActivity, androidx.fragment.app.FragmentActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        ActivityPdfViewerBinding activityPdfViewerBinding = this.binding;
        if (activityPdfViewerBinding == null) {
            Intrinsics.throwUninitializedPropertyAccessException("binding");
            activityPdfViewerBinding = null;
        }
        activityPdfViewerBinding.pdfView.closePdfRender();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateDownloadButtonState(boolean isEnabled) {
        this.isDownloadButtonEnabled = isEnabled;
        MenuItem item = this.menuItem;
        if (item != null) {
            item.setEnabled(isEnabled);
            Drawable icon = item.getIcon();
            if (icon != null) {
                icon.setAlpha(isEnabled ? 255 : 100);
            }
        }
    }
}
