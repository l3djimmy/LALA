package com.rajat.pdfviewer;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.pdf.PdfRenderer;
import android.os.ParcelFileDescriptor;
import android.util.Log;
import android.util.Size;
import androidx.autofill.HintConstants;
import androidx.exifinterface.media.ExifInterface;
import com.rajat.pdfviewer.util.CacheHelper;
import com.rajat.pdfviewer.util.CacheManager;
import com.rajat.pdfviewer.util.CacheStrategy;
import com.rajat.pdfviewer.util.CommonUtils;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ReplaceWith;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugProbesKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.BuildersKt__BuildersKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CancellableContinuation;
import kotlinx.coroutines.CancellableContinuationImpl;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.JobKt__JobKt;
import kotlinx.coroutines.NonCancellable;
import kotlinx.coroutines.SupervisorKt;
import kotlinx.coroutines.sync.Mutex;
import kotlinx.coroutines.sync.MutexKt;
/* compiled from: PdfRendererCore.kt */
@Metadata(d1 = {"\u0000\u008c\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u0000 W2\u00020\u0001:\u0002WXB!\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0006\u0010&\u001a\u00020\u0013J\u0018\u0010'\u001a\u0004\u0018\u00010 2\u0006\u0010(\u001a\u00020\u0013H\u0086@¢\u0006\u0002\u0010)J\u001e\u0010*\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 H\u0082@¢\u0006\u0002\u0010,J\u0016\u0010-\u001a\u00020\u000b2\u0006\u0010(\u001a\u00020\u0013H\u0082@¢\u0006\u0002\u0010)J\u0006\u0010.\u001a\u00020\u000bJi\u0010/\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2Q\b\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b((\u0012\u0015\u0012\u0013\u0018\u00010 ¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fJk\u00104\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2Q\b\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b((\u0012\u0015\u0012\u0013\u0018\u00010 ¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Js\u00105\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010+\u001a\u00020 2\u0006\u00106\u001a\u00020\u000b2Q\b\u0002\u00100\u001aK\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b((\u0012\u0015\u0012\u0013\u0018\u00010 ¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Ja\u00107\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132O\u00100\u001aK\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b((\u0012\u0015\u0012\u0013\u0018\u00010 ¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002Ja\u00108\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132O\u00100\u001aK\u0012\u0013\u0012\u00110\u000b¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012\u0013\u0012\u00110\u0013¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b((\u0012\u0015\u0012\u0013\u0018\u00010 ¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(+\u0012\u0004\u0012\u00020!\u0018\u00010\u001fH\u0002J\u001a\u00109\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\b\u0010:\u001a\u0004\u0018\u00010\u001cH\u0002J(\u0010;\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0006\u00103\u001a\u00020\u000b2\b\u0010+\u001a\u0004\u0018\u00010 H\u0082@¢\u0006\u0002\u0010<J(\u0010=\u001a\u0004\u0018\u00010 2\u0006\u0010(\u001a\u00020\u00132\u0006\u0010>\u001a\u00020\u00132\u0006\u0010?\u001a\u00020\u0013H\u0086@¢\u0006\u0002\u0010@J\u0006\u0010A\u001a\u00020!J&\u0010B\u001a\u00020!2\u0006\u0010C\u001a\u00020\u00132\u0006\u0010>\u001a\u00020\u00132\u0006\u0010?\u001a\u00020\u00132\u0006\u0010D\u001a\u00020\u0013J.\u0010E\u001a\u00020!2\u0006\u0010C\u001a\u00020\u00132\u0006\u0010F\u001a\u00020\u00132\u0006\u0010G\u001a\u00020\u00132\u0006\u0010D\u001a\u00020\u0013H\u0082@¢\u0006\u0002\u0010HJ\"\u0010I\u001a\u00020!2\u0006\u0010(\u001a\u00020\u00132\u0012\u0010J\u001a\u000e\u0012\u0004\u0012\u00020$\u0012\u0004\u0012\u00020!0KJ\u0006\u0010L\u001a\u00020\u0015J\u0014\u0010M\u001a\u0010\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u0015\u0018\u00010NJ6\u0010O\u001a\u0004\u0018\u0001HP\"\u0004\b\u0000\u0010P2\u0006\u0010(\u001a\u00020\u00132\u0016\u0010Q\u001a\u0012\u0012\b\u0012\u00060RR\u00020\u0007\u0012\u0004\u0012\u0002HP0KH\u0082@¢\u0006\u0002\u0010SJ\u000e\u0010T\u001a\u00020!2\u0006\u0010(\u001a\u00020\u0013J\u0006\u0010U\u001a\u00020!J\u0006\u0010V\u001a\u00020!R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0017\u001a\u0004\u0018\u00010\u0013X\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u0018R\u000e\u0010\u0019\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u001a\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u001c0\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R:\u0010\u001d\u001a.\u0012\u0004\u0012\u00020\u0013\u0012$\u0012\"\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u0013\u0012\u0006\u0012\u0004\u0018\u00010 \u0012\u0004\u0012\u00020!0\u001f0\u001e0\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\"\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020$0#X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010%\u001a\u0004\u0018\u00010\u001cX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006Y"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore;", "", "fileDescriptor", "Landroid/os/ParcelFileDescriptor;", "cacheManager", "Lcom/rajat/pdfviewer/util/CacheManager;", "pdfRenderer", "Landroid/graphics/pdf/PdfRenderer;", "<init>", "(Landroid/os/ParcelFileDescriptor;Lcom/rajat/pdfviewer/util/CacheManager;Landroid/graphics/pdf/PdfRenderer;)V", "isRendererOpen", "", "scope", "Lkotlinx/coroutines/CoroutineScope;", "renderLock", "Lkotlinx/coroutines/sync/Mutex;", "pageCount", "Ljava/util/concurrent/atomic/AtomicInteger;", "totalPagesRendered", "", "totalRenderTime", "", "slowestRenderTime", "slowestPage", "Ljava/lang/Integer;", "renderStateLock", "renderJobs", "Ljava/util/concurrent/ConcurrentHashMap;", "Lkotlinx/coroutines/Job;", "renderCallbacks", "Ljava/util/concurrent/CopyOnWriteArrayList;", "Lkotlin/Function3;", "Landroid/graphics/Bitmap;", "", "pageDimensionCache", "", "Landroid/util/Size;", "prefetchJob", "getPageCount", "getBitmapFromCache", "pageNo", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "addBitmapToMemoryCache", "bitmap", "(ILandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "pageExistInCache", "shouldPrefetch", "renderPage", "onBitmapReady", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "success", "prefetchPageIfIdle", "renderPageInternal", "replaceActive", "enqueueRenderCallback", "enqueueRenderCallbackLocked", "clearRenderJob", "completedJob", "deliverRenderCallbacks", "(IZLandroid/graphics/Bitmap;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "renderPageAsync", "width", "height", "(IIILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "preloadPageDimensions", "schedulePrefetch", "currentPage", "direction", "prefetchPagesAround", "fallbackWidth", "fallbackHeight", "(IIIILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getPageDimensionsAsync", "callback", "Lkotlin/Function1;", "averageRenderTime", "slowestPageInfo", "Lkotlin/Pair;", "withPdfPage", ExifInterface.GPS_DIRECTION_TRUE, "block", "Landroid/graphics/pdf/PdfRenderer$Page;", "(ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cancelRender", "cancelPrefetch", "closePdfRender", "Companion", "RenderDecision", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfRendererCore {
    private static final String LOG_TAG = "PdfRendererCore";
    private static final String METRICS_TAG = "PdfRendererCore_Metrics";
    public static final int prefetchDistance = 2;
    private final CacheManager cacheManager;
    private final ParcelFileDescriptor fileDescriptor;
    private boolean isRendererOpen;
    private final AtomicInteger pageCount;
    private final Map<Integer, Size> pageDimensionCache;
    private final PdfRenderer pdfRenderer;
    private Job prefetchJob;
    private final ConcurrentHashMap<Integer, CopyOnWriteArrayList<Function3<Boolean, Integer, Bitmap, Unit>>> renderCallbacks;
    private final ConcurrentHashMap<Integer, Job> renderJobs;
    private final Mutex renderLock;
    private final Object renderStateLock;
    private final CoroutineScope scope;
    private Integer slowestPage;
    private long slowestRenderTime;
    private int totalPagesRendered;
    private long totalRenderTime;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    private static boolean enableDebugMetrics = true;

    public /* synthetic */ PdfRendererCore(ParcelFileDescriptor parcelFileDescriptor, CacheManager cacheManager, PdfRenderer pdfRenderer, DefaultConstructorMarker defaultConstructorMarker) {
        this(parcelFileDescriptor, cacheManager, pdfRenderer);
    }

    private PdfRendererCore(ParcelFileDescriptor fileDescriptor, CacheManager cacheManager, PdfRenderer pdfRenderer) {
        this.fileDescriptor = fileDescriptor;
        this.cacheManager = cacheManager;
        this.pdfRenderer = pdfRenderer;
        this.isRendererOpen = true;
        this.scope = CoroutineScopeKt.CoroutineScope(Dispatchers.getIO().plus(SupervisorKt.SupervisorJob$default((Job) null, 1, (Object) null)));
        this.renderLock = MutexKt.Mutex$default(false, 1, null);
        this.pageCount = new AtomicInteger(this.pdfRenderer.getPageCount());
        this.renderStateLock = new Object();
        this.renderJobs = new ConcurrentHashMap<>();
        this.renderCallbacks = new ConcurrentHashMap<>();
        this.pageDimensionCache = new LinkedHashMap();
    }

    /* compiled from: PdfRendererCore.kt */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J.\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0086@¢\u0006\u0002\u0010\u0016J\u000e\u0010\u0017\u001a\u00020\u00112\u0006\u0010\u0018\u001a\u00020\u0019J\u0010\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u0019H\u0007J\u0010\u0010\u001b\u001a\u00020\u00132\u0006\u0010\u001c\u001a\u00020\u0013H\u0002R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u001d\u001a\u00020\u0013X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001e\u001a\u00020\u0013X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore$Companion;", "", "<init>", "()V", "enableDebugMetrics", "", "getEnableDebugMetrics", "()Z", "setEnableDebugMetrics", "(Z)V", "prefetchDistance", "", "create", "Lcom/rajat/pdfviewer/PdfRendererCore;", "context", "Landroid/content/Context;", "fileDescriptor", "Landroid/os/ParcelFileDescriptor;", "cacheIdentifier", "", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "(Landroid/content/Context;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;Lcom/rajat/pdfviewer/util/CacheStrategy;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getFileDescriptor", "file", "Ljava/io/File;", "getCacheIdentifierFromFile", "sanitizeFilePath", "filePath", "LOG_TAG", "METRICS_TAG", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final boolean getEnableDebugMetrics() {
            return PdfRendererCore.enableDebugMetrics;
        }

        public final void setEnableDebugMetrics(boolean z) {
            PdfRendererCore.enableDebugMetrics = z;
        }

        public final Object create(Context context, ParcelFileDescriptor fileDescriptor, String cacheIdentifier, CacheStrategy cacheStrategy, Continuation<? super PdfRendererCore> continuation) {
            return BuildersKt.withContext(Dispatchers.getIO(), new PdfRendererCore$Companion$create$2(fileDescriptor, context, cacheIdentifier, cacheStrategy, null), continuation);
        }

        public final ParcelFileDescriptor getFileDescriptor(File file) {
            Intrinsics.checkNotNullParameter(file, "file");
            String path = file.getPath();
            Intrinsics.checkNotNullExpressionValue(path, "getPath(...)");
            File safeFile = new File(sanitizeFilePath(path));
            ParcelFileDescriptor open = ParcelFileDescriptor.open(safeFile, 268435456);
            Intrinsics.checkNotNullExpressionValue(open, "open(...)");
            return open;
        }

        @Deprecated(message = "Use CacheHelper.getCacheKey(file.absolutePath) directly.", replaceWith = @ReplaceWith(expression = "CacheHelper.getCacheKey(file.absolutePath)", imports = {"com.rajat.pdfviewer.util.CacheHelper"}))
        public final String getCacheIdentifierFromFile(File file) {
            Intrinsics.checkNotNullParameter(file, "file");
            CacheHelper cacheHelper = CacheHelper.INSTANCE;
            String absolutePath = file.getAbsolutePath();
            Intrinsics.checkNotNullExpressionValue(absolutePath, "getAbsolutePath(...)");
            return cacheHelper.getCacheKey(absolutePath);
        }

        private final String sanitizeFilePath(String filePath) {
            try {
                Path path = Paths.get(filePath, new String[0]);
                if (!Files.exists(path, new LinkOption[0])) {
                    return "";
                }
                return filePath;
            } catch (Exception e) {
                return "";
            }
        }
    }

    public final int getPageCount() {
        Integer valueOf = Integer.valueOf(this.pageCount.get());
        valueOf.intValue();
        if (!this.isRendererOpen) {
            valueOf = null;
        }
        if (valueOf != null) {
            return valueOf.intValue();
        }
        return 0;
    }

    public final Object getBitmapFromCache(int pageNo, Continuation<? super Bitmap> continuation) {
        return this.cacheManager.getBitmapFromCache(pageNo, continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object addBitmapToMemoryCache(int pageNo, Bitmap bitmap, Continuation<? super Unit> continuation) {
        Object addBitmapToCache = this.cacheManager.addBitmapToCache(pageNo, bitmap, continuation);
        return addBitmapToCache == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? addBitmapToCache : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object pageExistInCache(int pageNo, Continuation<? super Boolean> continuation) {
        return this.cacheManager.pageExistsInCache(pageNo, continuation);
    }

    public final boolean shouldPrefetch() {
        return this.cacheManager.shouldPrefetch();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void renderPage$default(PdfRendererCore pdfRendererCore, int i, Bitmap bitmap, Function3 function3, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            function3 = null;
        }
        pdfRendererCore.renderPage(i, bitmap, function3);
    }

    public final void renderPage(int pageNo, Bitmap bitmap, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3) {
        Intrinsics.checkNotNullParameter(bitmap, "bitmap");
        renderPageInternal(pageNo, bitmap, true, function3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    static /* synthetic */ void prefetchPageIfIdle$default(PdfRendererCore pdfRendererCore, int i, Bitmap bitmap, Function3 function3, int i2, Object obj) {
        if ((i2 & 4) != 0) {
            function3 = null;
        }
        pdfRendererCore.prefetchPageIfIdle(i, bitmap, function3);
    }

    private final void prefetchPageIfIdle(int pageNo, Bitmap bitmap, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3) {
        renderPageInternal(pageNo, bitmap, false, function3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    static /* synthetic */ void renderPageInternal$default(PdfRendererCore pdfRendererCore, int i, Bitmap bitmap, boolean z, Function3 function3, int i2, Object obj) {
        if ((i2 & 8) != 0) {
            function3 = null;
        }
        pdfRendererCore.renderPageInternal(i, bitmap, z, function3);
    }

    private final void renderPageInternal(int pageNo, Bitmap bitmap, boolean replaceActive, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3) {
        Function3 onBitmapReady;
        if (pageNo < 0) {
            onBitmapReady = function3;
        } else if (pageNo < getPageCount()) {
            BuildersKt__Builders_commonKt.launch$default(this.scope, null, null, new PdfRendererCore$renderPageInternal$1(this, pageNo, function3, replaceActive, bitmap, null), 3, null);
            return;
        } else {
            onBitmapReady = function3;
        }
        Log.w(METRICS_TAG, "⚠️ Skipped invalid render for page " + pageNo);
        if (onBitmapReady != null) {
            onBitmapReady.invoke(false, Integer.valueOf(pageNo), null);
        }
    }

    private final void enqueueRenderCallback(int pageNo, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3) {
        if (function3 == null) {
            return;
        }
        synchronized (this.renderStateLock) {
            enqueueRenderCallbackLocked(pageNo, function3);
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void enqueueRenderCallbackLocked(int pageNo, Function3<? super Boolean, ? super Integer, ? super Bitmap, Unit> function3) {
        if (function3 == null) {
            return;
        }
        CopyOnWriteArrayList it = this.renderCallbacks.get(Integer.valueOf(pageNo));
        if (it == null) {
            it = new CopyOnWriteArrayList();
            this.renderCallbacks.put(Integer.valueOf(pageNo), it);
        }
        it.add(function3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void clearRenderJob(int pageNo, Job completedJob) {
        synchronized (this.renderStateLock) {
            if (this.renderJobs.get(Integer.valueOf(pageNo)) == completedJob) {
                this.renderJobs.remove(Integer.valueOf(pageNo));
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object deliverRenderCallbacks(int pageNo, boolean success, Bitmap bitmap, Continuation<? super Unit> continuation) {
        CopyOnWriteArrayList callbacks;
        synchronized (this.renderStateLock) {
            callbacks = this.renderCallbacks.remove(Boxing.boxInt(pageNo));
        }
        if (callbacks == null) {
            return Unit.INSTANCE;
        }
        Object withContext = BuildersKt.withContext(NonCancellable.INSTANCE.plus(Dispatchers.getMain()), new PdfRendererCore$deliverRenderCallbacks$2(callbacks, success, pageNo, bitmap, null), continuation);
        return withContext == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? withContext : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* compiled from: PdfRendererCore.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\br\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;", "", "Skip", "JoinExisting", "Start", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public interface RenderDecision {

        /* compiled from: PdfRendererCore.kt */
        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Skip;", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;", "<init>", "()V", "equals", "", "other", "", "hashCode", "", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public static final class Skip implements RenderDecision {
            public static final int $stable = 0;
            public static final Skip INSTANCE = new Skip();

            public boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (obj instanceof Skip) {
                    Skip skip = (Skip) obj;
                    return true;
                }
                return false;
            }

            public int hashCode() {
                return 637857450;
            }

            public String toString() {
                return "Skip";
            }

            private Skip() {
            }
        }

        /* compiled from: PdfRendererCore.kt */
        @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\bÇ\n\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0013\u0010\u0004\u001a\u00020\u00052\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÖ\u0003J\t\u0010\b\u001a\u00020\tHÖ\u0001J\t\u0010\n\u001a\u00020\u000bHÖ\u0001¨\u0006\f"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$JoinExisting;", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;", "<init>", "()V", "equals", "", "other", "", "hashCode", "", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public static final class JoinExisting implements RenderDecision {
            public static final int $stable = 0;
            public static final JoinExisting INSTANCE = new JoinExisting();

            public boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (obj instanceof JoinExisting) {
                    JoinExisting joinExisting = (JoinExisting) obj;
                    return true;
                }
                return false;
            }

            public int hashCode() {
                return 1640520448;
            }

            public String toString() {
                return "JoinExisting";
            }

            private JoinExisting() {
            }
        }

        /* compiled from: PdfRendererCore.kt */
        @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0012"}, d2 = {"Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision$Start;", "Lcom/rajat/pdfviewer/PdfRendererCore$RenderDecision;", "job", "Lkotlinx/coroutines/Job;", "<init>", "(Lkotlinx/coroutines/Job;)V", "getJob", "()Lkotlinx/coroutines/Job;", "component1", "copy", "equals", "", "other", "", "hashCode", "", "toString", "", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public static final class Start implements RenderDecision {
            public static final int $stable = 8;
            private final Job job;

            public static /* synthetic */ Start copy$default(Start start, Job job, int i, Object obj) {
                if ((i & 1) != 0) {
                    job = start.job;
                }
                return start.copy(job);
            }

            public final Job component1() {
                return this.job;
            }

            public final Start copy(Job job) {
                Intrinsics.checkNotNullParameter(job, "job");
                return new Start(job);
            }

            public boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof Start) && Intrinsics.areEqual(this.job, ((Start) obj).job);
            }

            public int hashCode() {
                return this.job.hashCode();
            }

            public String toString() {
                return "Start(job=" + this.job + ')';
            }

            public Start(Job job) {
                Intrinsics.checkNotNullParameter(job, "job");
                this.job = job;
            }

            public final Job getJob() {
                return this.job;
            }
        }
    }

    public final Object renderPageAsync(int pageNo, int width, int height, Continuation<? super Bitmap> continuation) {
        CancellableContinuationImpl cancellable$iv = new CancellableContinuationImpl(IntrinsicsKt.intercepted(continuation), 1);
        cancellable$iv.initCancellability();
        final CancellableContinuationImpl continuation2 = cancellable$iv;
        final Bitmap bitmap = CommonUtils.Companion.BitmapPool.getBitmap$default(CommonUtils.Companion.BitmapPool.INSTANCE, width, height, null, 4, null);
        renderPage(pageNo, bitmap, new Function3<Boolean, Integer, Bitmap, Unit>() { // from class: com.rajat.pdfviewer.PdfRendererCore$renderPageAsync$2$1
            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Unit invoke(Boolean bool, Integer num, Bitmap bitmap2) {
                invoke(bool.booleanValue(), num.intValue(), bitmap2);
                return Unit.INSTANCE;
            }

            public final void invoke(boolean success, int i, Bitmap renderedBitmap) {
                if (success) {
                    continuation2.resume((CancellableContinuation<Bitmap>) (renderedBitmap == null ? bitmap : renderedBitmap), (Function1<? super Throwable, Unit>) null);
                    return;
                }
                CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap(bitmap);
                continuation2.resume((CancellableContinuation<Bitmap>) null, (Function1<? super Throwable, Unit>) null);
            }
        });
        Object result = cancellable$iv.getResult();
        if (result == IntrinsicsKt.getCOROUTINE_SUSPENDED()) {
            DebugProbesKt.probeCoroutineSuspended(continuation);
        }
        return result;
    }

    public final void preloadPageDimensions() {
        BuildersKt__Builders_commonKt.launch$default(this.scope, null, null, new PdfRendererCore$preloadPageDimensions$1(this, null), 3, null);
    }

    public final void schedulePrefetch(int currentPage, int width, int height, int direction) {
        Job launch$default;
        if (this.cacheManager.shouldPrefetch()) {
            Job job = this.prefetchJob;
            if (job != null) {
                Job.DefaultImpls.cancel$default(job, (CancellationException) null, 1, (Object) null);
            }
            launch$default = BuildersKt__Builders_commonKt.launch$default(this.scope, null, null, new PdfRendererCore$schedulePrefetch$1(this, currentPage, width, height, direction, null), 3, null);
            this.prefetchJob = launch$default;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002a  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0147  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0194  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x0109 -> B:37:0x0110). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:54:0x0189 -> B:55:0x0190). Please submit an issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object prefetchPagesAround(int r25, int r26, int r27, int r28, kotlin.coroutines.Continuation<? super kotlin.Unit> r29) {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.PdfRendererCore.prefetchPagesAround(int, int, int, int, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Size prefetchPagesAround$lambda$11$lambda$9(PdfRenderer.Page page) {
        Intrinsics.checkNotNullParameter(page, "page");
        return new Size(page.getWidth(), page.getHeight());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit prefetchPagesAround$lambda$11$lambda$10(Bitmap $bitmap, boolean success, int i, Bitmap bitmap) {
        if (!success) {
            CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($bitmap);
        }
        return Unit.INSTANCE;
    }

    public final void getPageDimensionsAsync(int pageNo, Function1<? super Size, Unit> callback) {
        Intrinsics.checkNotNullParameter(callback, "callback");
        Size it = this.pageDimensionCache.get(Integer.valueOf(pageNo));
        if (it == null) {
            BuildersKt__Builders_commonKt.launch$default(this.scope, null, null, new PdfRendererCore$getPageDimensionsAsync$2(this, pageNo, callback, null), 3, null);
        } else {
            callback.invoke(it);
        }
    }

    public final long averageRenderTime() {
        if (this.totalPagesRendered == 0) {
            return 0L;
        }
        return this.totalRenderTime / this.totalPagesRendered;
    }

    public final Pair<Integer, Long> slowestPageInfo() {
        Integer num = this.slowestPage;
        if (num != null) {
            int it = num.intValue();
            return TuplesKt.to(Integer.valueOf(it), Long.valueOf(this.slowestRenderTime));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final <T> Object withPdfPage(int pageNo, Function1<? super PdfRenderer.Page, ? extends T> function1, Continuation<? super T> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new PdfRendererCore$withPdfPage$2(this, pageNo, function1, null), continuation);
    }

    public final void cancelRender(int pageNo) {
        Job remove = this.renderJobs.remove(Integer.valueOf(pageNo));
        if (remove != null) {
            Job.DefaultImpls.cancel$default(remove, (CancellationException) null, 1, (Object) null);
        }
        this.renderCallbacks.remove(Integer.valueOf(pageNo));
    }

    public final void cancelPrefetch() {
        Job job = this.prefetchJob;
        if (job != null) {
            Job.DefaultImpls.cancel$default(job, (CancellationException) null, 1, (Object) null);
        }
    }

    public final void closePdfRender() {
        if (this.isRendererOpen) {
            Log.d(LOG_TAG, "Closing PdfRenderer and releasing resources.");
            JobKt__JobKt.cancelChildren$default(this.scope.getCoroutineContext(), (CancellationException) null, 1, (Object) null);
            BuildersKt__BuildersKt.runBlocking$default(null, new PdfRendererCore$closePdfRender$1(this, null), 1, null);
        }
    }
}
