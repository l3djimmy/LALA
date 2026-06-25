package com.rajat.pdfviewer;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleCoroutineScope;
import androidx.lifecycle.LifecycleOwner;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.gms.common.internal.ImagesContract;
import com.rajat.pdfviewer.util.CacheHelper;
import com.rajat.pdfviewer.util.CacheManager;
import com.rajat.pdfviewer.util.CachePolicy;
import com.rajat.pdfviewer.util.CacheStrategy;
import com.rajat.pdfviewer.util.FileUtils;
import java.io.File;
import java.util.UUID;
import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.SupervisorKt;
/* compiled from: PdfRendererView.kt */
@Metadata(d1 = {"\u0000è\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 \u008f\u00012\u00020\u00012\u00020\u0002:\u0006\u008d\u0001\u008e\u0001\u008f\u0001B'\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u0006\u0010A\u001a\u00020\u0010J\u0006\u0010B\u001a\u00020-J\u001a\u0010F\u001a\u00020'*\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0004H\u0086@¢\u0006\u0002\u0010GJ2\u0010H\u001a\u00020'2\u0006\u0010I\u001a\u00020J2\b\b\u0002\u0010K\u001a\u00020L2\u0006\u0010M\u001a\u00020N2\u0006\u0010O\u001a\u00020)2\b\b\u0002\u0010\u0011\u001a\u00020\u0012J\u0018\u0010P\u001a\u00020'2\u0006\u0010Q\u001a\u00020R2\b\b\u0002\u0010\u0011\u001a\u00020\u0012J2\u0010S\u001a\u00020'2\u0006\u0010Q\u001a\u00020R2\u0006\u0010\u0011\u001a\u00020\u00122\u000e\u0010T\u001a\n\u0012\u0004\u0012\u00020'\u0018\u00010&2\b\u0010U\u001a\u0004\u0018\u00010JH\u0002J\u000e\u0010V\u001a\u00020'2\u0006\u0010W\u001a\u00020XJ \u0010Y\u001a\u00020'2\u0006\u0010Z\u001a\u00020\f2\u000e\u0010T\u001a\n\u0012\u0004\u0012\u00020'\u0018\u00010&H\u0002J\u0006\u0010[\u001a\u00020'J\u0006\u0010\\\u001a\u00020'J\"\u0010]\u001a\u00020'2\u0006\u0010^\u001a\u00020\b2\b\b\u0002\u0010_\u001a\u00020\u00102\b\b\u0002\u0010`\u001a\u00020aJ\b\u0010b\u001a\u00020'H\u0002J\u0016\u0010c\u001a\u0010\u0012\u0004\u0012\u00020\b\u0012\u0004\u0012\u00020\b\u0018\u00010dH\u0002J\u0010\u0010e\u001a\u00020'2\u0006\u0010f\u001a\u00020\bH\u0002J\u001a\u0010g\u001a\u00020'2\b\u0010\u0005\u001a\u0004\u0018\u00010\u00062\u0006\u0010h\u001a\u00020\bH\u0002J\u0010\u0010i\u001a\u00020'2\u0006\u0010j\u001a\u00020kH\u0002J\b\u0010l\u001a\u00020'H\u0002J\u0006\u0010m\u001a\u00020'J\u0010\u0010n\u001a\u00020'2\u0006\u0010o\u001a\u00020pH\u0016J\u0010\u0010q\u001a\u00020'2\u0006\u0010O\u001a\u00020)H\u0002J\b\u0010r\u001a\u00020'H\u0002J \u0010s\u001a\n\u0012\u0004\u0012\u00020'\u0018\u00010&2\u0006\u0010Q\u001a\u00020R2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0018\u0010t\u001a\u0004\u0018\u00010u2\u0006\u0010v\u001a\u00020\bH\u0082@¢\u0006\u0002\u0010wJ\u0014\u0010x\u001a\b\u0012\u0004\u0012\u00020u0yH\u0086@¢\u0006\u0002\u0010zJ\u000e\u0010{\u001a\u00020'2\u0006\u0010|\u001a\u00020\u0010J\u000e\u0010}\u001a\u00020'2\u0006\u0010,\u001a\u00020-J\u0006\u0010~\u001a\u00020-J\b\u0010\u007f\u001a\u00020\u0010H\u0007J\u0007\u0010\u0080\u0001\u001a\u00020'J\u0007\u0010\u0081\u0001\u001a\u00020'J\u0007\u0010\u0082\u0001\u001a\u00020'J\t\u0010\u0083\u0001\u001a\u00020'H\u0002J\u0012\u0010\u0084\u0001\u001a\u00020\u00102\u0007\u0010\u0085\u0001\u001a\u00020\bH\u0016J\t\u0010\u0086\u0001\u001a\u00020'H\u0014J\t\u0010\u0087\u0001\u001a\u00020'H\u0002J\n\u0010\u0088\u0001\u001a\u00030\u0089\u0001H\u0014J\u0015\u0010\u008a\u0001\u001a\u00020'2\n\u0010\u008b\u0001\u001a\u0005\u0018\u00010\u0089\u0001H\u0014J\u0007\u0010\u008c\u0001\u001a\u00020\bR\u000e\u0010\u000b\u001a\u00020\fX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0013\u001a\u00020\u0014X\u0086.¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082.¢\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u0004\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010#\u001a\u0004\u0018\u00010\bX\u0082\u000e¢\u0006\u0004\n\u0002\u0010$R\u0016\u0010%\u001a\n\u0012\u0004\u0012\u00020'\u0018\u00010&X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010(\u001a\u0004\u0018\u00010)X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010*\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010+\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010,\u001a\u00020-X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010.\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010/\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u00100\u001a\n\u0012\u0004\u0012\u00020'\u0018\u00010&X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00101\u001a\u000202X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00103\u001a\u000204X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u00105\u001a\u0004\u0018\u000106X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b7\u00108\"\u0004\b9\u0010:R\u001c\u0010;\u001a\u0004\u0018\u00010<X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b=\u0010>\"\u0004\b?\u0010@R\u0011\u0010C\u001a\u00020\b8F¢\u0006\u0006\u001a\u0004\bD\u0010E¨\u0006\u0090\u0001"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererView;", "Landroid/widget/FrameLayout;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", "", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "pdfRendererCore", "Lcom/rajat/pdfviewer/PdfRendererCore;", "pdfViewAdapter", "Lcom/rajat/pdfviewer/PdfViewAdapter;", "pdfRendererCoreInitialised", "", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "recyclerView", "Lcom/rajat/pdfviewer/PinchZoomRecyclerView;", "getRecyclerView", "()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;", "setRecyclerView", "(Lcom/rajat/pdfviewer/PinchZoomRecyclerView;)V", "pageNo", "Landroid/widget/TextView;", "divider", "Landroid/graphics/drawable/Drawable;", "pageMargin", "Landroid/graphics/Rect;", "positionToUseForState", "restoredScrollPosition", "restoredScrollOffset", "lastDy", "pendingJumpPage", "Ljava/lang/Integer;", "activeDocumentCleanupAction", "Lkotlin/Function0;", "", "observedLifecycle", "Landroidx/lifecycle/Lifecycle;", "showDivider", "isZoomEnabled", "maxZoomScale", "", "enableLoadingForPages", "disableScreenshots", "postInitializationAction", "viewJob", "Lkotlinx/coroutines/CompletableJob;", "viewScope", "Lkotlinx/coroutines/CoroutineScope;", "zoomListener", "Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;", "getZoomListener", "()Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;", "setZoomListener", "(Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;)V", "statusListener", "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;", "getStatusListener", "()Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;", "setStatusListener", "(Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;)V", "isZoomedIn", "getZoomScale", "totalPageCount", "getTotalPageCount", "()I", "clearCache", "(Lcom/rajat/pdfviewer/PdfRendererView;Landroid/content/Context;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "initWithUrl", ImagesContract.URL, "", "headers", "Lcom/rajat/pdfviewer/HeaderData;", "lifecycleCoroutineScope", "Landroidx/lifecycle/LifecycleCoroutineScope;", "lifecycle", "initWithFile", "file", "Ljava/io/File;", "initWithFileInternal", "documentCleanupAction", "cacheIdentifierOverride", "initWithUri", "uri", "Landroid/net/Uri;", "initializeRenderer", "renderer", "scrollToNextPage", "scrollToPreviousPage", "jumpToPage", "pageNumber", "smoothScroll", "delayMillis", "", "forceUpdatePageNumber", "captureCurrentScrollState", "Lkotlin/Pair;", "updatePageNumberDisplay", "position", "getAttrs", "defStyle", "setTypeArray", "typedArray", "Landroid/content/res/TypedArray;", "applyScreenshotSecurity", "closePdfRender", "onDestroy", "owner", "Landroidx/lifecycle/LifecycleOwner;", "registerLifecycleObserver", "releaseCurrentDocumentSession", "buildDocumentCleanupAction", "getBitmapByPage", "Landroid/graphics/Bitmap;", "page", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getLoadedBitmaps", "", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "setZoomEnabled", "zoomEnabled", "setMaxZoomScale", "getMaxZoomScale", "getZoomEnabled", "zoomIn", "zoomOut", "resetZoom", "preloadCacheIntoMemory", "canScrollVertically", "direction", "onDetachedFromWindow", "resetViewScope", "onSaveInstanceState", "Landroid/os/Parcelable;", "onRestoreInstanceState", "state", "getScrollDirection", "StatusCallBack", "ZoomListener", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfRendererView extends FrameLayout implements DefaultLifecycleObserver {
    private static final float DEFAULT_MAX_ZOOM = 3.0f;
    private static final String KEY_SCROLL_OFFSET = "scrollOffset";
    private static final String KEY_SCROLL_POSITION = "scrollPosition";
    private static final float MAX_ALLOWED_ZOOM = 5.0f;
    private Function0<Unit> activeDocumentCleanupAction;
    private CacheStrategy cacheStrategy;
    private boolean disableScreenshots;
    private Drawable divider;
    private boolean enableLoadingForPages;
    private boolean isZoomEnabled;
    private int lastDy;
    private float maxZoomScale;
    private Lifecycle observedLifecycle;
    private Rect pageMargin;
    private TextView pageNo;
    private PdfRendererCore pdfRendererCore;
    private boolean pdfRendererCoreInitialised;
    private PdfViewAdapter pdfViewAdapter;
    private Integer pendingJumpPage;
    private int positionToUseForState;
    private Function0<Unit> postInitializationAction;
    public PinchZoomRecyclerView recyclerView;
    private int restoredScrollOffset;
    private int restoredScrollPosition;
    private boolean showDivider;
    private StatusCallBack statusListener;
    private CompletableJob viewJob;
    private CoroutineScope viewScope;
    private ZoomListener zoomListener;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    /* compiled from: PdfRendererView.kt */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0007\n\u0000\bf\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;", "", "onZoomChanged", "", "isZoomedIn", "", "scale", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public interface ZoomListener {
        void onZoomChanged(boolean z, float f);
    }

    public /* synthetic */ PdfRendererView(Context context, AttributeSet attributeSet, int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i2 & 2) != 0 ? null : attributeSet, (i2 & 4) != 0 ? 0 : i);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public PdfRendererView(Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.checkNotNullParameter(context, "context");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public PdfRendererView(Context context, AttributeSet attrs) {
        this(context, attrs, 0, 4, null);
        Intrinsics.checkNotNullParameter(context, "context");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfRendererView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        Intrinsics.checkNotNullParameter(context, "context");
        this.cacheStrategy = CacheStrategy.MAXIMIZE_PERFORMANCE;
        this.pageMargin = new Rect(0, 0, 0, 0);
        this.positionToUseForState = -1;
        this.restoredScrollPosition = -1;
        this.showDivider = true;
        this.isZoomEnabled = true;
        this.maxZoomScale = 3.0f;
        this.viewJob = SupervisorKt.SupervisorJob$default((Job) null, 1, (Object) null);
        this.viewScope = CoroutineScopeKt.CoroutineScope(this.viewJob.plus(Dispatchers.getIO()));
        getAttrs(attrs, defStyleAttr);
    }

    public final PinchZoomRecyclerView getRecyclerView() {
        PinchZoomRecyclerView pinchZoomRecyclerView = this.recyclerView;
        if (pinchZoomRecyclerView != null) {
            return pinchZoomRecyclerView;
        }
        Intrinsics.throwUninitializedPropertyAccessException("recyclerView");
        return null;
    }

    public final void setRecyclerView(PinchZoomRecyclerView pinchZoomRecyclerView) {
        Intrinsics.checkNotNullParameter(pinchZoomRecyclerView, "<set-?>");
        this.recyclerView = pinchZoomRecyclerView;
    }

    public final ZoomListener getZoomListener() {
        return this.zoomListener;
    }

    public final void setZoomListener(ZoomListener zoomListener) {
        this.zoomListener = zoomListener;
    }

    public final StatusCallBack getStatusListener() {
        return this.statusListener;
    }

    public final void setStatusListener(StatusCallBack statusCallBack) {
        this.statusListener = statusCallBack;
    }

    public final boolean isZoomedIn() {
        return this.recyclerView != null && getRecyclerView().isZoomedIn();
    }

    public final float getZoomScale() {
        if (this.recyclerView != null) {
            return getRecyclerView().getZoomScale();
        }
        return 1.0f;
    }

    public final int getTotalPageCount() {
        PdfRendererCore pdfRendererCore = this.pdfRendererCore;
        if (pdfRendererCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
            pdfRendererCore = null;
        }
        return pdfRendererCore.getPageCount();
    }

    public final Object clearCache(PdfRendererView $this$clearCache, Context context, Continuation<? super Unit> continuation) {
        Object clearCacheDir = CacheManager.Companion.clearCacheDir(context, continuation);
        return clearCacheDir == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? clearCacheDir : Unit.INSTANCE;
    }

    public static /* synthetic */ void initWithUrl$default(PdfRendererView pdfRendererView, String str, HeaderData headerData, LifecycleCoroutineScope lifecycleCoroutineScope, Lifecycle lifecycle, CacheStrategy cacheStrategy, int i, Object obj) {
        HeaderData headerData2;
        CacheStrategy cacheStrategy2;
        if ((i & 2) == 0) {
            headerData2 = headerData;
        } else {
            headerData2 = new HeaderData(null, 1, null);
        }
        if ((i & 16) == 0) {
            cacheStrategy2 = cacheStrategy;
        } else {
            cacheStrategy2 = CacheStrategy.MAXIMIZE_PERFORMANCE;
        }
        pdfRendererView.initWithUrl(str, headerData2, lifecycleCoroutineScope, lifecycle, cacheStrategy2);
    }

    public final void initWithUrl(String url, HeaderData headers, LifecycleCoroutineScope lifecycleCoroutineScope, Lifecycle lifecycle, final CacheStrategy cacheStrategy) {
        Intrinsics.checkNotNullParameter(url, "url");
        Intrinsics.checkNotNullParameter(headers, "headers");
        Intrinsics.checkNotNullParameter(lifecycleCoroutineScope, "lifecycleCoroutineScope");
        Intrinsics.checkNotNullParameter(lifecycle, "lifecycle");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        registerLifecycleObserver(lifecycle);
        this.cacheStrategy = cacheStrategy;
        FileUtils fileUtils = FileUtils.INSTANCE;
        String uuid = UUID.randomUUID().toString();
        Intrinsics.checkNotNullExpressionValue(uuid, "toString(...)");
        final String remoteDocumentCacheKey = fileUtils.getCachedFileName(url, cacheStrategy, uuid);
        Context context = getContext();
        Intrinsics.checkNotNullExpressionValue(context, "getContext(...)");
        new PdfDownloader(lifecycleCoroutineScope, headers, url, remoteDocumentCacheKey, cacheStrategy, new PdfDownloadCallback(context, new Function0() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return PdfRendererView.initWithUrl$lambda$0(PdfRendererView.this);
            }
        }, new Function3() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda8
            @Override // kotlin.jvm.functions.Function3
            public final Object invoke(Object obj, Object obj2, Object obj3) {
                return PdfRendererView.initWithUrl$lambda$1(PdfRendererView.this, ((Integer) obj).intValue(), ((Long) obj2).longValue(), ((Long) obj3).longValue());
            }
        }, new Function1() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda9
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PdfRendererView.initWithUrl$lambda$2(PdfRendererView.this, cacheStrategy, remoteDocumentCacheKey, (File) obj);
            }
        }, new Function1() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda10
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PdfRendererView.initWithUrl$lambda$3(PdfRendererView.this, (Throwable) obj);
            }
        }), null, 64, null).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initWithUrl$lambda$0(PdfRendererView this$0) {
        StatusCallBack statusCallBack = this$0.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onPdfLoadStart();
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initWithUrl$lambda$1(PdfRendererView this$0, int progress, long current, long total) {
        StatusCallBack statusCallBack = this$0.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onPdfLoadProgress(progress, current, Long.valueOf(total));
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initWithUrl$lambda$2(PdfRendererView this$0, CacheStrategy $cacheStrategy, String $remoteDocumentCacheKey, File it) {
        Intrinsics.checkNotNullParameter(it, "it");
        Function0 documentCleanupAction = this$0.buildDocumentCleanupAction(it, $cacheStrategy);
        this$0.initWithFileInternal(it, $cacheStrategy, documentCleanupAction, $remoteDocumentCacheKey);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initWithUrl$lambda$3(PdfRendererView this$0, Throwable it) {
        Intrinsics.checkNotNullParameter(it, "it");
        StatusCallBack statusCallBack = this$0.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onError(it);
        }
        return Unit.INSTANCE;
    }

    public static /* synthetic */ void initWithFile$default(PdfRendererView pdfRendererView, File file, CacheStrategy cacheStrategy, int i, Object obj) {
        if ((i & 2) != 0) {
            cacheStrategy = CacheStrategy.MAXIMIZE_PERFORMANCE;
        }
        pdfRendererView.initWithFile(file, cacheStrategy);
    }

    public final void initWithFile(File file, CacheStrategy cacheStrategy) {
        Intrinsics.checkNotNullParameter(file, "file");
        Intrinsics.checkNotNullParameter(cacheStrategy, "cacheStrategy");
        initWithFileInternal(file, cacheStrategy, null, null);
    }

    private final void initWithFileInternal(File file, CacheStrategy cacheStrategy, Function0<Unit> function0, String cacheIdentifierOverride) {
        String str;
        this.cacheStrategy = cacheStrategy;
        if (cacheIdentifierOverride == null) {
            CacheHelper cacheHelper = CacheHelper.INSTANCE;
            String absolutePath = file.getAbsolutePath();
            Intrinsics.checkNotNullExpressionValue(absolutePath, "getAbsolutePath(...)");
            str = cacheHelper.getCacheKey(absolutePath);
        } else {
            str = cacheIdentifierOverride;
        }
        String cacheIdentifier = str;
        StatusCallBack statusCallBack = this.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onPdfRenderStart();
        }
        BuildersKt__Builders_commonKt.launch$default(this.viewScope, null, null, new PdfRendererView$initWithFileInternal$1(file, this, cacheIdentifier, cacheStrategy, function0, null), 3, null);
    }

    public final void initWithUri(Uri uri) {
        Intrinsics.checkNotNullParameter(uri, "uri");
        CacheHelper cacheHelper = CacheHelper.INSTANCE;
        String uri2 = uri.toString();
        Intrinsics.checkNotNullExpressionValue(uri2, "toString(...)");
        String cacheIdentifier = cacheHelper.getCacheKey(uri2);
        StatusCallBack statusCallBack = this.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onPdfRenderStart();
        }
        BuildersKt__Builders_commonKt.launch$default(this.viewScope, null, null, new PdfRendererView$initWithUri$1(this, uri, cacheIdentifier, null), 3, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void initializeRenderer(PdfRendererCore renderer, Function0<Unit> function0) {
        if (this.pdfRendererCoreInitialised) {
            releaseCurrentDocumentSession();
            resetViewScope();
            removeAllViews();
            if (this.recyclerView != null) {
                getRecyclerView().setAdapter(null);
            }
        }
        PdfRendererCore.Companion.setEnableDebugMetrics(true);
        this.pdfRendererCore = renderer;
        this.pdfRendererCoreInitialised = true;
        this.activeDocumentCleanupAction = function0;
        View v = LayoutInflater.from(getContext()).inflate(R.layout.pdf_rendererview, (ViewGroup) this, false);
        addView(v);
        setRecyclerView((PinchZoomRecyclerView) findViewById(R.id.recyclerView));
        this.pageNo = (TextView) findViewById(R.id.pageNumber);
        Context context = getContext();
        Intrinsics.checkNotNullExpressionValue(context, "getContext(...)");
        PdfRendererCore pdfRendererCore = this.pdfRendererCore;
        if (pdfRendererCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
            pdfRendererCore = null;
        }
        this.pdfViewAdapter = new PdfViewAdapter(context, pdfRendererCore, this, this.pageMargin, this.enableLoadingForPages);
        PinchZoomRecyclerView $this$initializeRenderer_u24lambda_u247 = getRecyclerView();
        PdfViewAdapter pdfViewAdapter = this.pdfViewAdapter;
        if (pdfViewAdapter == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdfViewAdapter");
            pdfViewAdapter = null;
        }
        $this$initializeRenderer_u24lambda_u247.setAdapter(pdfViewAdapter);
        $this$initializeRenderer_u24lambda_u247.setItemAnimator(new DefaultItemAnimator());
        if (this.showDivider) {
            DividerItemDecoration $this$initializeRenderer_u24lambda_u247_u24lambda_u245 = new DividerItemDecoration($this$initializeRenderer_u24lambda_u247.getContext(), 1);
            Drawable it = this.divider;
            if (it != null) {
                $this$initializeRenderer_u24lambda_u247_u24lambda_u245.setDrawable(it);
            }
            $this$initializeRenderer_u24lambda_u247.addItemDecoration($this$initializeRenderer_u24lambda_u247_u24lambda_u245);
        }
        $this$initializeRenderer_u24lambda_u247.setZoomEnabled(this.isZoomEnabled);
        $this$initializeRenderer_u24lambda_u247.setMaxZoomScale(this.maxZoomScale);
        PinchZoomRecyclerView recyclerView = getRecyclerView();
        TextView textView = this.pageNo;
        if (textView == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pageNo");
            textView = null;
        }
        recyclerView.addOnScrollListener(new PdfPageScrollListener(textView, new Function0() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int totalPageCount;
                totalPageCount = PdfRendererView.this.getTotalPageCount();
                return Integer.valueOf(totalPageCount);
            }
        }, new Function1() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PdfRendererView.initializeRenderer$lambda$9(PdfRendererView.this, ((Integer) obj).intValue());
            }
        }, new Function1() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PdfRendererView.initializeRenderer$lambda$10(PdfRendererView.this, ((Integer) obj).intValue());
            }
        }));
        getRecyclerView().postDelayed(new Runnable() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                PdfRendererView.initializeRenderer$lambda$11(PdfRendererView.this);
            }
        }, 500L);
        getRecyclerView().setOnZoomChangeListener(new Function2() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return PdfRendererView.initializeRenderer$lambda$12(PdfRendererView.this, ((Boolean) obj).booleanValue(), ((Float) obj2).floatValue());
            }
        });
        getRecyclerView().post(new Runnable() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda6
            @Override // java.lang.Runnable
            public final void run() {
                PdfRendererView.initializeRenderer$lambda$13(PdfRendererView.this);
            }
        });
        Integer num = this.pendingJumpPage;
        if (num != null) {
            int page = num.intValue();
            jumpToPage$default(this, page, false, 0L, 6, null);
            this.pendingJumpPage = null;
        }
        preloadCacheIntoMemory();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initializeRenderer$lambda$9(PdfRendererView this$0, int it) {
        this$0.updatePageNumberDisplay(it);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initializeRenderer$lambda$10(PdfRendererView this$0, int page) {
        PdfRendererCore pdfRendererCore = this$0.pdfRendererCore;
        if (pdfRendererCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
            pdfRendererCore = null;
        }
        pdfRendererCore.schedulePrefetch(page, this$0.getRecyclerView().getWidth(), this$0.getRecyclerView().getHeight(), 0);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void initializeRenderer$lambda$11(PdfRendererView this$0) {
        if (this$0.restoredScrollPosition != -1) {
            RecyclerView.LayoutManager layoutManager = this$0.getRecyclerView().getLayoutManager();
            LinearLayoutManager linearLayoutManager = layoutManager instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager : null;
            if (linearLayoutManager != null) {
                linearLayoutManager.scrollToPositionWithOffset(this$0.restoredScrollPosition, this$0.restoredScrollOffset);
            }
            this$0.restoredScrollPosition = -1;
            this$0.restoredScrollOffset = 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit initializeRenderer$lambda$12(PdfRendererView this$0, boolean isZoomedIn, float scale) {
        ZoomListener zoomListener = this$0.zoomListener;
        if (zoomListener != null) {
            zoomListener.onZoomChanged(isZoomedIn, scale);
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void initializeRenderer$lambda$13(PdfRendererView this$0) {
        Function0<Unit> function0 = this$0.postInitializationAction;
        if (function0 != null) {
            function0.invoke();
        }
        StatusCallBack statusCallBack = this$0.statusListener;
        if (statusCallBack != null) {
            statusCallBack.onPdfRenderSuccess();
        }
        this$0.postInitializationAction = null;
    }

    public final void scrollToNextPage() {
        LinearLayoutManager layoutManager;
        int firstVisiblePosition;
        View firstView;
        if (this.recyclerView == null) {
            return;
        }
        RecyclerView.LayoutManager layoutManager2 = getRecyclerView().getLayoutManager();
        LinearLayoutManager linearLayoutManager = layoutManager2 instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager2 : null;
        if (linearLayoutManager == null || (firstVisiblePosition = (layoutManager = linearLayoutManager).findFirstVisibleItemPosition()) == -1 || (firstView = layoutManager.findViewByPosition(firstVisiblePosition)) == null) {
            return;
        }
        float scale = getRecyclerView().getZoomScale();
        int unscaledViewportHeight = (int) (getRecyclerView().getHeight() / scale);
        int remaining = layoutManager.getDecoratedBottom(firstView) - unscaledViewportHeight;
        if (remaining > 0) {
            int delta = Math.min(unscaledViewportHeight, remaining);
            getRecyclerView().smoothScrollBy(0, delta);
            return;
        }
        jumpToPage$default(this, firstVisiblePosition + 1, false, 0L, 6, null);
    }

    public final void scrollToPreviousPage() {
        LinearLayoutManager layoutManager;
        int firstVisiblePosition;
        View firstView;
        if (this.recyclerView == null) {
            return;
        }
        RecyclerView.LayoutManager layoutManager2 = getRecyclerView().getLayoutManager();
        LinearLayoutManager linearLayoutManager = layoutManager2 instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager2 : null;
        if (linearLayoutManager == null || (firstVisiblePosition = (layoutManager = linearLayoutManager).findFirstVisibleItemPosition()) == -1 || (firstView = layoutManager.findViewByPosition(firstVisiblePosition)) == null) {
            return;
        }
        float scale = getRecyclerView().getZoomScale();
        int unscaledViewportHeight = (int) (getRecyclerView().getHeight() / scale);
        int hiddenAbove = -layoutManager.getDecoratedTop(firstView);
        if (hiddenAbove > 0) {
            int delta = Math.min(unscaledViewportHeight, hiddenAbove);
            getRecyclerView().smoothScrollBy(0, -delta);
            return;
        }
        jumpToPage$default(this, firstVisiblePosition - 1, false, 0L, 6, null);
    }

    public static /* synthetic */ void jumpToPage$default(PdfRendererView pdfRendererView, int i, boolean z, long j, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            z = true;
        }
        if ((i2 & 4) != 0) {
            j = 150;
        }
        pdfRendererView.jumpToPage(i, z, j);
    }

    public final void jumpToPage(final int pageNumber, final boolean smoothScroll, long delayMillis) {
        boolean z = false;
        if (pageNumber >= 0 && pageNumber < getTotalPageCount()) {
            z = true;
        }
        if (z) {
            if (this.recyclerView == null) {
                this.pendingJumpPage = Integer.valueOf(pageNumber);
            } else {
                getRecyclerView().postDelayed(new Runnable() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda13
                    @Override // java.lang.Runnable
                    public final void run() {
                        PdfRendererView.jumpToPage$lambda$16(PdfRendererView.this, smoothScroll, pageNumber);
                    }
                }, delayMillis);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void jumpToPage$lambda$16(final PdfRendererView this$0, boolean $smoothScroll, int $pageNumber) {
        RecyclerView.Adapter adapter;
        RecyclerView.LayoutManager layoutManager = this$0.getRecyclerView().getLayoutManager();
        LinearLayoutManager layoutManager2 = layoutManager instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager : null;
        if (layoutManager2 == null || (adapter = this$0.getRecyclerView().getAdapter()) == null || adapter.getItemCount() == 0) {
            return;
        }
        if ($smoothScroll) {
            layoutManager2.smoothScrollToPosition(this$0.getRecyclerView(), new RecyclerView.State(), $pageNumber);
        } else {
            layoutManager2.scrollToPositionWithOffset($pageNumber, 0);
        }
        this$0.getRecyclerView().post(new Runnable() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                PdfRendererView.this.forceUpdatePageNumber();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void forceUpdatePageNumber() {
        int positionToUse;
        RecyclerView.LayoutManager layoutManager = getRecyclerView().getLayoutManager();
        Intrinsics.checkNotNull(layoutManager, "null cannot be cast to non-null type androidx.recyclerview.widget.LinearLayoutManager");
        LinearLayoutManager layoutManager2 = (LinearLayoutManager) layoutManager;
        int firstVisiblePosition = layoutManager2.findFirstVisibleItemPosition();
        int firstCompletelyVisiblePosition = layoutManager2.findFirstCompletelyVisibleItemPosition();
        int lastVisiblePosition = layoutManager2.findLastVisibleItemPosition();
        int lastCompletelyVisiblePosition = layoutManager2.findLastCompletelyVisibleItemPosition();
        Integer valueOf = Integer.valueOf(lastCompletelyVisiblePosition);
        int it = valueOf.intValue();
        int it2 = it != -1 ? 1 : 0;
        if (it2 == 0) {
            valueOf = null;
        }
        if (valueOf == null) {
            valueOf = Integer.valueOf(lastVisiblePosition);
            int it3 = valueOf.intValue();
            int it4 = it3 != -1 ? 1 : 0;
            if (it4 == 0) {
                valueOf = null;
            }
            if (valueOf == null) {
                Integer valueOf2 = Integer.valueOf(firstCompletelyVisiblePosition);
                int it5 = valueOf2.intValue();
                Integer num = it5 != -1 ? valueOf2 : null;
                positionToUse = num != null ? num.intValue() : firstVisiblePosition;
                this.positionToUseForState = positionToUse;
                updatePageNumberDisplay(positionToUse);
            }
        }
        positionToUse = valueOf.intValue();
        this.positionToUseForState = positionToUse;
        updatePageNumberDisplay(positionToUse);
    }

    private final Pair<Integer, Integer> captureCurrentScrollState() {
        int firstVisiblePosition;
        View firstVisibleView;
        if (this.recyclerView == null) {
            return null;
        }
        RecyclerView.LayoutManager layoutManager = getRecyclerView().getLayoutManager();
        LinearLayoutManager layoutManager2 = layoutManager instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager : null;
        if (layoutManager2 == null || (firstVisiblePosition = layoutManager2.findFirstVisibleItemPosition()) == -1 || (firstVisibleView = layoutManager2.findViewByPosition(firstVisiblePosition)) == null) {
            return null;
        }
        return TuplesKt.to(Integer.valueOf(firstVisiblePosition), Integer.valueOf(layoutManager2.getDecoratedTop(firstVisibleView)));
    }

    private final void updatePageNumberDisplay(int position) {
        if (position != -1) {
            TextView textView = this.pageNo;
            TextView textView2 = null;
            if (textView == null) {
                Intrinsics.throwUninitializedPropertyAccessException("pageNo");
                textView = null;
            }
            textView.setText(getContext().getString(R.string.pdfView_page_no, Integer.valueOf(position + 1), Integer.valueOf(getTotalPageCount())));
            TextView textView3 = this.pageNo;
            if (textView3 == null) {
                Intrinsics.throwUninitializedPropertyAccessException("pageNo");
                textView3 = null;
            }
            textView3.setVisibility(0);
            if (position == 0) {
                TextView textView4 = this.pageNo;
                if (textView4 == null) {
                    Intrinsics.throwUninitializedPropertyAccessException("pageNo");
                } else {
                    textView2 = textView4;
                }
                textView2.postDelayed(new Runnable() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda12
                    @Override // java.lang.Runnable
                    public final void run() {
                        PdfRendererView.updatePageNumberDisplay$lambda$20(PdfRendererView.this);
                    }
                }, 3000L);
            }
            StatusCallBack statusCallBack = this.statusListener;
            if (statusCallBack != null) {
                statusCallBack.onPageChanged(position + 1, getTotalPageCount());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void updatePageNumberDisplay$lambda$20(PdfRendererView this$0) {
        TextView textView = this$0.pageNo;
        if (textView == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pageNo");
            textView = null;
        }
        textView.setVisibility(8);
    }

    private final void getAttrs(AttributeSet attrs, int defStyle) {
        TypedArray typedArray = getContext().obtainStyledAttributes(attrs, R.styleable.PdfRendererView, defStyle, 0);
        Intrinsics.checkNotNullExpressionValue(typedArray, "obtainStyledAttributes(...)");
        setTypeArray(typedArray);
    }

    private final void setTypeArray(TypedArray typedArray) {
        this.showDivider = typedArray.getBoolean(R.styleable.PdfRendererView_pdfView_showDivider, true);
        this.divider = typedArray.getDrawable(R.styleable.PdfRendererView_pdfView_divider);
        this.enableLoadingForPages = typedArray.getBoolean(R.styleable.PdfRendererView_pdfView_enableLoadingForPages, false);
        this.disableScreenshots = typedArray.getBoolean(R.styleable.PdfRendererView_pdfView_disableScreenshots, false);
        this.isZoomEnabled = typedArray.getBoolean(R.styleable.PdfRendererView_pdfView_enableZoom, true);
        this.maxZoomScale = RangesKt.coerceIn(typedArray.getFloat(R.styleable.PdfRendererView_pdfView_maxZoom, 3.0f), 1.0f, (float) MAX_ALLOWED_ZOOM);
        int marginDim = typedArray.getDimensionPixelSize(R.styleable.PdfRendererView_pdfView_page_margin, 0);
        this.pageMargin.set(typedArray.getDimensionPixelSize(R.styleable.PdfRendererView_pdfView_page_marginLeft, marginDim), typedArray.getDimensionPixelSize(R.styleable.PdfRendererView_pdfView_page_marginTop, marginDim), typedArray.getDimensionPixelSize(R.styleable.PdfRendererView_pdfView_page_marginRight, marginDim), typedArray.getDimensionPixelSize(R.styleable.PdfRendererView_pdfView_page_marginBottom, marginDim));
        applyScreenshotSecurity();
        typedArray.recycle();
    }

    private final void applyScreenshotSecurity() {
        Window window;
        if (this.disableScreenshots) {
            Context context = getContext();
            Activity activity = context instanceof Activity ? (Activity) context : null;
            if (activity == null || (window = activity.getWindow()) == null) {
                return;
            }
            window.addFlags(8192);
        }
    }

    public final void closePdfRender() {
        releaseCurrentDocumentSession();
        resetViewScope();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onDestroy(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        closePdfRender();
        if (this.observedLifecycle == owner.getLifecycle()) {
            this.observedLifecycle = null;
        }
        owner.getLifecycle().removeObserver(this);
    }

    private final void registerLifecycleObserver(Lifecycle lifecycle) {
        if (this.observedLifecycle == lifecycle) {
            return;
        }
        Lifecycle lifecycle2 = this.observedLifecycle;
        if (lifecycle2 != null) {
            lifecycle2.removeObserver(this);
        }
        lifecycle.addObserver(this);
        this.observedLifecycle = lifecycle;
    }

    private final void releaseCurrentDocumentSession() {
        Unit unit;
        if (this.pdfRendererCoreInitialised) {
            PdfRendererCore pdfRendererCore = this.pdfRendererCore;
            if (pdfRendererCore == null) {
                Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
                pdfRendererCore = null;
            }
            pdfRendererCore.closePdfRender();
            this.pdfRendererCoreInitialised = false;
        }
        try {
            Result.Companion companion = Result.Companion;
            PdfRendererView $this$releaseCurrentDocumentSession_u24lambda_u2421 = this;
            Function0<Unit> function0 = $this$releaseCurrentDocumentSession_u24lambda_u2421.activeDocumentCleanupAction;
            if (function0 != null) {
                function0.invoke();
                unit = Unit.INSTANCE;
            } else {
                unit = null;
            }
            Result.m7341constructorimpl(unit);
        } catch (Throwable th) {
            Result.Companion companion2 = Result.Companion;
            Result.m7341constructorimpl(ResultKt.createFailure(th));
        }
        this.activeDocumentCleanupAction = null;
    }

    private final Function0<Unit> buildDocumentCleanupAction(final File file, CacheStrategy cacheStrategy) {
        CachePolicy cachePolicy = CachePolicy.Companion.from$default(CachePolicy.Companion, cacheStrategy, 0, 2, null);
        if (cachePolicy.getPersistRemoteFile()) {
            return null;
        }
        return new Function0() { // from class: com.rajat.pdfviewer.PdfRendererView$$ExternalSyntheticLambda11
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return PdfRendererView.buildDocumentCleanupAction$lambda$22(file);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit buildDocumentCleanupAction$lambda$22(File $file) {
        CacheHelper.INSTANCE.cleanupTransientDocument$pdfViewer_release($file);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object getBitmapByPage(int page, Continuation<? super Bitmap> continuation) {
        PdfRendererCore pdfRendererCore = this.pdfRendererCore;
        if (pdfRendererCore == null) {
            Intrinsics.throwUninitializedPropertyAccessException("pdfRendererCore");
            pdfRendererCore = null;
        }
        return pdfRendererCore.getBitmapFromCache(page, continuation);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x008b  */
    /* JADX WARN: Type inference failed for: r3v7, types: [java.util.Collection] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:19:0x0076 -> B:20:0x007d). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object getLoadedBitmaps(kotlin.coroutines.Continuation<? super java.util.List<android.graphics.Bitmap>> r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof com.rajat.pdfviewer.PdfRendererView$getLoadedBitmaps$1
            if (r0 == 0) goto L14
            r0 = r8
            com.rajat.pdfviewer.PdfRendererView$getLoadedBitmaps$1 r0 = (com.rajat.pdfviewer.PdfRendererView$getLoadedBitmaps$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r8 = r0.label
            int r8 = r8 - r2
            r0.label = r8
            goto L19
        L14:
            com.rajat.pdfviewer.PdfRendererView$getLoadedBitmaps$1 r0 = new com.rajat.pdfviewer.PdfRendererView$getLoadedBitmaps$1
            r0.<init>(r7, r8)
        L19:
            java.lang.Object r8 = r0.result
            java.lang.Object r1 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r2 = r0.label
            switch(r2) {
                case 0: goto L3d;
                case 1: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r8 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r8.<init>(r0)
            throw r8
        L2c:
            java.lang.Object r2 = r0.L$1
            java.util.Iterator r2 = (java.util.Iterator) r2
            java.lang.Object r3 = r0.L$0
            java.util.Collection r3 = (java.util.Collection) r3
            kotlin.ResultKt.throwOnFailure(r8)
            r4 = r3
            r3 = r2
            r2 = r1
            r1 = r0
            r0 = r7
            goto L7d
        L3d:
            kotlin.ResultKt.throwOnFailure(r8)
            r8 = 0
            int r2 = r7.getTotalPageCount()
            kotlin.ranges.IntRange r8 = kotlin.ranges.RangesKt.until(r8, r2)
            java.lang.Iterable r8 = (java.lang.Iterable) r8
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
            java.util.Collection r2 = (java.util.Collection) r2
            java.util.Iterator r8 = r8.iterator()
            r3 = r2
            r2 = r8
            r8 = r7
        L5a:
            boolean r4 = r2.hasNext()
            if (r4 == 0) goto L8b
            r4 = r2
            kotlin.collections.IntIterator r4 = (kotlin.collections.IntIterator) r4
            int r4 = r4.nextInt()
            r0.L$0 = r3
            r0.L$1 = r2
            r5 = 1
            r0.label = r5
            java.lang.Object r4 = r8.getBitmapByPage(r4, r0)
            if (r4 != r1) goto L76
            return r1
        L76:
            r6 = r0
            r0 = r8
            r8 = r4
            r4 = r3
            r3 = r2
            r2 = r1
            r1 = r6
        L7d:
            android.graphics.Bitmap r8 = (android.graphics.Bitmap) r8
            if (r8 == 0) goto L85
        L82:
            r4.add(r8)
        L85:
            r8 = r0
            r0 = r1
            r1 = r2
            r2 = r3
            r3 = r4
            goto L5a
        L8b:
            java.util.List r3 = (java.util.List) r3
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererView.getLoadedBitmaps(kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final void setZoomEnabled(boolean zoomEnabled) {
        this.isZoomEnabled = zoomEnabled;
        if (this.recyclerView != null) {
            getRecyclerView().setZoomEnabled(zoomEnabled);
        }
    }

    public final void setMaxZoomScale(float maxZoomScale) {
        this.maxZoomScale = RangesKt.coerceIn(maxZoomScale, 1.0f, (float) MAX_ALLOWED_ZOOM);
        if (this.recyclerView != null) {
            getRecyclerView().setMaxZoomScale(this.maxZoomScale);
        }
    }

    public final float getMaxZoomScale() {
        return this.maxZoomScale;
    }

    public final boolean getZoomEnabled() {
        return this.isZoomEnabled;
    }

    public final void zoomIn() {
        if (this.recyclerView != null) {
            getRecyclerView().zoomIn();
        }
    }

    public final void zoomOut() {
        if (this.recyclerView != null) {
            getRecyclerView().zoomOut();
        }
    }

    public final void resetZoom() {
        if (this.recyclerView != null) {
            getRecyclerView().resetZoom();
        }
    }

    private final void preloadCacheIntoMemory() {
        BuildersKt__Builders_commonKt.launch$default(this.viewScope, null, null, new PdfRendererView$preloadCacheIntoMemory$1(this, null), 3, null);
    }

    @Override // android.view.View
    public boolean canScrollVertically(int direction) {
        if (this.recyclerView != null) {
            return getRecyclerView().canScrollVertically(direction);
        }
        return super.canScrollVertically(direction);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
    }

    private final void resetViewScope() {
        Job.DefaultImpls.cancel$default((Job) this.viewJob, (CancellationException) null, 1, (Object) null);
        this.viewJob = SupervisorKt.SupervisorJob$default((Job) null, 1, (Object) null);
        this.viewScope = CoroutineScopeKt.CoroutineScope(this.viewJob.plus(Dispatchers.getIO()));
    }

    @Override // android.view.View
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        Bundle savedState = new Bundle();
        savedState.putParcelable("superState", superState);
        Pair scrollState = captureCurrentScrollState();
        if (scrollState != null) {
            int position = scrollState.component1().intValue();
            int offset = scrollState.component2().intValue();
            savedState.putInt(KEY_SCROLL_POSITION, position);
            savedState.putInt(KEY_SCROLL_OFFSET, offset);
        } else if (this.positionToUseForState != -1) {
            savedState.putInt(KEY_SCROLL_POSITION, this.positionToUseForState);
            savedState.putInt(KEY_SCROLL_OFFSET, 0);
        }
        return savedState;
    }

    @Override // android.view.View
    protected void onRestoreInstanceState(Parcelable state) {
        Parcelable superState;
        if (state instanceof Bundle) {
            if (Build.VERSION.SDK_INT >= 33) {
                superState = (Parcelable) ((Bundle) state).getParcelable("superState", Parcelable.class);
            } else {
                superState = ((Bundle) state).getParcelable("superState");
            }
            super.onRestoreInstanceState(superState);
            this.restoredScrollPosition = ((Bundle) state).getInt(KEY_SCROLL_POSITION, this.positionToUseForState);
            this.restoredScrollOffset = ((Bundle) state).getInt(KEY_SCROLL_OFFSET, 0);
            return;
        }
        super.onRestoreInstanceState(state);
    }

    public final int getScrollDirection() {
        if (this.lastDy > 0) {
            return 1;
        }
        return this.lastDy < 0 ? -1 : 0;
    }

    /* compiled from: PdfRendererView.kt */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u0003\n\u0002\b\u0006\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H\u0016J'\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\bH\u0016¢\u0006\u0002\u0010\nJ\u0010\u0010\u000b\u001a\u00020\u00032\u0006\u0010\f\u001a\u00020\rH\u0016J\u0010\u0010\u000e\u001a\u00020\u00032\u0006\u0010\u000f\u001a\u00020\u0010H\u0016J\u0018\u0010\u0011\u001a\u00020\u00032\u0006\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0006H\u0016J\b\u0010\u0014\u001a\u00020\u0003H\u0016J\b\u0010\u0015\u001a\u00020\u0003H\u0016¨\u0006\u0016"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;", "", "onPdfLoadStart", "", "onPdfLoadProgress", "progress", "", "downloadedBytes", "", "totalBytes", "(IJLjava/lang/Long;)V", "onPdfLoadSuccess", "absolutePath", "", "onError", "error", "", "onPageChanged", "currentPage", "totalPage", "onPdfRenderStart", "onPdfRenderSuccess", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public interface StatusCallBack {
        void onError(Throwable th);

        void onPageChanged(int i, int i2);

        void onPdfLoadProgress(int i, long j, Long l);

        void onPdfLoadStart();

        void onPdfLoadSuccess(String str);

        void onPdfRenderStart();

        void onPdfRenderSuccess();

        /* compiled from: PdfRendererView.kt */
        @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public static final class DefaultImpls {
            public static void onPdfLoadStart(StatusCallBack $this) {
            }

            public static void onPdfLoadProgress(StatusCallBack $this, int progress, long downloadedBytes, Long totalBytes) {
            }

            public static void onPdfLoadSuccess(StatusCallBack $this, String absolutePath) {
                Intrinsics.checkNotNullParameter(absolutePath, "absolutePath");
            }

            public static void onError(StatusCallBack $this, Throwable error) {
                Intrinsics.checkNotNullParameter(error, "error");
            }

            public static void onPageChanged(StatusCallBack $this, int currentPage, int totalPage) {
            }

            public static void onPdfRenderStart(StatusCallBack $this) {
            }

            public static void onPdfRenderSuccess(StatusCallBack $this) {
            }
        }
    }

    /* compiled from: PdfRendererView.kt */
    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\bX\u0082T¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererView$Companion;", "", "<init>", "()V", "DEFAULT_MAX_ZOOM", "", "MAX_ALLOWED_ZOOM", "KEY_SCROLL_POSITION", "", "KEY_SCROLL_OFFSET", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
