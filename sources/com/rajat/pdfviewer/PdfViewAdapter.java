package com.rajat.pdfviewer;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.util.Size;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.LinearInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.recyclerview.widget.RecyclerView;
import com.rajat.pdfviewer.PdfViewAdapter;
import com.rajat.pdfviewer.databinding.ListItemPdfPageBinding;
import com.rajat.pdfviewer.util.CommonUtils;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
/* compiled from: PdfViewAdapter.kt */
@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0007\b\u0001\u0018\u00002\f\u0012\b\u0012\u00060\u0002R\u00020\u00000\u0001:\u0001\u001cB/\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u001c\u0010\u000f\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\b\u0010\u0014\u001a\u00020\u0013H\u0016J\u001c\u0010\u0015\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0013H\u0016J\u0014\u0010\u0019\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016J\u0014\u0010\u001a\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016J\u0014\u0010\u001b\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001d"}, d2 = {"Lcom/rajat/pdfviewer/PdfViewAdapter;", "Landroidx/recyclerview/widget/RecyclerView$Adapter;", "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;", "context", "Landroid/content/Context;", "renderer", "Lcom/rajat/pdfviewer/PdfRendererCore;", "parentView", "Lcom/rajat/pdfviewer/PdfRendererView;", "pageSpacing", "Landroid/graphics/Rect;", "enableLoadingForPages", "", "<init>", "(Landroid/content/Context;Lcom/rajat/pdfviewer/PdfRendererCore;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/graphics/Rect;Z)V", "onCreateViewHolder", "parent", "Landroid/view/ViewGroup;", "viewType", "", "getItemCount", "onBindViewHolder", "", "holder", "position", "onViewRecycled", "onViewAttachedToWindow", "onViewDetachedFromWindow", "PdfPageViewHolder", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfViewAdapter extends RecyclerView.Adapter<PdfPageViewHolder> {
    public static final int $stable = 8;
    private final Context context;
    private final boolean enableLoadingForPages;
    private final Rect pageSpacing;
    private final PdfRendererView parentView;
    private final PdfRendererCore renderer;

    public PdfViewAdapter(Context context, PdfRendererCore renderer, PdfRendererView parentView, Rect pageSpacing, boolean enableLoadingForPages) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(renderer, "renderer");
        Intrinsics.checkNotNullParameter(parentView, "parentView");
        Intrinsics.checkNotNullParameter(pageSpacing, "pageSpacing");
        this.context = context;
        this.renderer = renderer;
        this.parentView = parentView;
        this.pageSpacing = pageSpacing;
        this.enableLoadingForPages = enableLoadingForPages;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public PdfPageViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        Intrinsics.checkNotNullParameter(parent, "parent");
        ListItemPdfPageBinding inflate = ListItemPdfPageBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
        Intrinsics.checkNotNullExpressionValue(inflate, "inflate(...)");
        return new PdfPageViewHolder(this, inflate);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.renderer.getPageCount();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(PdfPageViewHolder holder, int position) {
        Intrinsics.checkNotNullParameter(holder, "holder");
        holder.bind(position);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewRecycled(PdfPageViewHolder holder) {
        Intrinsics.checkNotNullParameter(holder, "holder");
        super.onViewRecycled((PdfViewAdapter) holder);
        holder.cancelJobs();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewAttachedToWindow(PdfPageViewHolder holder) {
        Intrinsics.checkNotNullParameter(holder, "holder");
        super.onViewAttachedToWindow((PdfViewAdapter) holder);
        holder.renderIfMissing();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewDetachedFromWindow(PdfPageViewHolder holder) {
        Intrinsics.checkNotNullParameter(holder, "holder");
        super.onViewDetachedFromWindow((PdfViewAdapter) holder);
        holder.handleDetach();
    }

    /* compiled from: PdfViewAdapter.kt */
    @Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0010\t\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0000\b\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000e\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0007J \u0010\u0015\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J \u0010\u0019\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J$\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\b\b\u0002\u0010\u001b\u001a\u00020\u00072\b\b\u0002\u0010\u001c\u001a\u00020\u001dH\u0002J\u0010\u0010\u001e\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0007H\u0002J\u0018\u0010\u001f\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\t2\u0006\u0010!\u001a\u00020\u0007H\u0002J\u0018\u0010\"\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\t2\u0006\u0010!\u001a\u00020\u0007H\u0002J\u0014\u0010#\u001a\u00020\u0013*\u00020\u00032\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J\u0006\u0010$\u001a\u00020\u0013J\u0006\u0010%\u001a\u00020\u0013J\u0006\u0010&\u001a\u00020\u0013J\b\u0010'\u001a\u00020\u0013H\u0002J\b\u0010(\u001a\u00020\u0013H\u0002J\b\u0010)\u001a\u00020\u000bH\u0002J\u0010\u0010*\u001a\u00020\u00132\u0006\u0010+\u001a\u00020,H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;", "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;", "itemBinding", "Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;", "<init>", "(Lcom/rajat/pdfviewer/PdfViewAdapter;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;)V", "currentBoundPage", "", "displayedBitmap", "Landroid/graphics/Bitmap;", "hasRetried", "", "hasTriggeredFallbackRender", "bindGeneration", "fallbackHandler", "Landroid/os/Handler;", "scope", "Lkotlinx/coroutines/CoroutineScope;", "bind", "", "position", "renderAndApplyBitmap", "page", "width", "height", "retryRenderOnce", "startPersistentFallbackRender", "retries", "delayMs", "", "triggerFallbackRender", "applyCachedBitmap", "bitmap", "displayWidth", "applyBitmapToView", "updateLayoutParams", "cancelJobs", "renderIfMissing", "handleDetach", "cancelPendingRenderIfNeeded", "clearDisplayedBitmapReference", "hasLiveBitmap", "applyFadeInAnimation", "view", "Landroid/view/View;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public final class PdfPageViewHolder extends RecyclerView.ViewHolder {
        private int bindGeneration;
        private int currentBoundPage;
        private Bitmap displayedBitmap;
        private final Handler fallbackHandler;
        private boolean hasRetried;
        private boolean hasTriggeredFallbackRender;
        private final ListItemPdfPageBinding itemBinding;
        private CoroutineScope scope;
        final /* synthetic */ PdfViewAdapter this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public PdfPageViewHolder(PdfViewAdapter this$0, ListItemPdfPageBinding itemBinding) {
            super(itemBinding.getRoot());
            Intrinsics.checkNotNullParameter(itemBinding, "itemBinding");
            this.this$0 = this$0;
            this.itemBinding = itemBinding;
            this.currentBoundPage = -1;
            this.fallbackHandler = new Handler(Looper.getMainLooper());
            this.scope = CoroutineScopeKt.MainScope();
        }

        public final void bind(int position) {
            cancelJobs();
            this.currentBoundPage = position;
            clearDisplayedBitmapReference();
            this.hasRetried = false;
            this.hasTriggeredFallbackRender = false;
            this.bindGeneration++;
            this.scope = CoroutineScopeKt.MainScope();
            Integer valueOf = Integer.valueOf(this.itemBinding.pageView.getWidth());
            int it = valueOf.intValue();
            if (!(it > 0)) {
                valueOf = null;
            }
            int displayWidth = valueOf != null ? valueOf.intValue() : this.this$0.context.getResources().getDisplayMetrics().widthPixels;
            this.itemBinding.pageView.setImageDrawable(null);
            FrameLayout root = this.itemBinding.getRoot();
            ViewGroup.LayoutParams $this$bind_u24lambda_u241 = this.itemBinding.getRoot().getLayoutParams();
            $this$bind_u24lambda_u241.height = -2;
            root.setLayoutParams($this$bind_u24lambda_u241);
            this.itemBinding.pageLoadingLayout.pdfViewPageLoadingProgress.setVisibility(this.this$0.enableLoadingForPages ? 0 : 8);
            BuildersKt__Builders_commonKt.launch$default(this.scope, null, null, new PdfViewAdapter$PdfPageViewHolder$bind$2(this, position, displayWidth, this.this$0, null), 3, null);
            startPersistentFallbackRender$default(this, position, 0, 0L, 6, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void renderAndApplyBitmap(final int page, final int width, final int height) {
            final Bitmap bitmap = CommonUtils.Companion.BitmapPool.getBitmap$default(CommonUtils.Companion.BitmapPool.INSTANCE, width, Math.max(1, height), null, 4, null);
            final int expectedGeneration = this.bindGeneration;
            PdfRendererCore pdfRendererCore = this.this$0.renderer;
            final PdfViewAdapter pdfViewAdapter = this.this$0;
            pdfRendererCore.renderPage(page, bitmap, new Function3() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda1
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return PdfViewAdapter.PdfPageViewHolder.renderAndApplyBitmap$lambda$3(bitmap, expectedGeneration, this, width, pdfViewAdapter, page, height, ((Boolean) obj).booleanValue(), ((Integer) obj2).intValue(), (Bitmap) obj3);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final Unit renderAndApplyBitmap$lambda$3(Bitmap $bitmap, int $expectedGeneration, PdfPageViewHolder this$0, int $width, PdfViewAdapter this$1, int $page, int $height, boolean success, int pageNo, Bitmap rendered) {
            boolean bitmapConsumed = false;
            if (rendered != null && rendered != $bitmap) {
                CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($bitmap);
                bitmapConsumed = true;
            }
            if (success && rendered == $bitmap) {
                bitmapConsumed = true;
            }
            if ($expectedGeneration != this$0.bindGeneration) {
                if (!bitmapConsumed) {
                    CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($bitmap);
                }
                return Unit.INSTANCE;
            }
            if (success && this$0.currentBoundPage == pageNo) {
                if (this$0.applyBitmapToView(rendered == null ? $bitmap : rendered, $width)) {
                    bitmapConsumed = true;
                }
                Integer valueOf = Integer.valueOf(this$0.itemBinding.pageView.getHeight());
                int it = valueOf.intValue();
                if (!(it > 0)) {
                    valueOf = null;
                }
                int fallbackHeight = valueOf != null ? valueOf.intValue() : this$1.context.getResources().getDisplayMetrics().heightPixels;
                this$1.renderer.schedulePrefetch(pageNo, $width, fallbackHeight, this$1.parentView.getScrollDirection());
            } else if (this$0.currentBoundPage == $page && !this$0.hasRetried) {
                this$0.hasRetried = true;
                this$0.retryRenderOnce($page, $width, $height);
            }
            if (!bitmapConsumed) {
                CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($bitmap);
            }
            return Unit.INSTANCE;
        }

        private final void retryRenderOnce(int page, final int width, int height) {
            final Bitmap retryBitmap = CommonUtils.Companion.BitmapPool.getBitmap$default(CommonUtils.Companion.BitmapPool.INSTANCE, width, height, null, 4, null);
            final int expectedGeneration = this.bindGeneration;
            this.this$0.renderer.renderPage(page, retryBitmap, new Function3() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function3
                public final Object invoke(Object obj, Object obj2, Object obj3) {
                    return PdfViewAdapter.PdfPageViewHolder.retryRenderOnce$lambda$4(retryBitmap, expectedGeneration, this, width, ((Boolean) obj).booleanValue(), ((Integer) obj2).intValue(), (Bitmap) obj3);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final Unit retryRenderOnce$lambda$4(Bitmap $retryBitmap, int $expectedGeneration, PdfPageViewHolder this$0, int $width, boolean success, int retryPageNo, Bitmap rendered) {
            boolean bitmapConsumed = false;
            if (rendered != null && rendered != $retryBitmap) {
                CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($retryBitmap);
                bitmapConsumed = true;
            }
            if (success && rendered == $retryBitmap) {
                bitmapConsumed = true;
            }
            if ($expectedGeneration != this$0.bindGeneration) {
                if (!bitmapConsumed) {
                    CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($retryBitmap);
                }
                return Unit.INSTANCE;
            }
            if (success && retryPageNo == this$0.currentBoundPage && !this$0.hasLiveBitmap()) {
                if (this$0.applyBitmapToView(rendered == null ? $retryBitmap : rendered, $width)) {
                    bitmapConsumed = true;
                }
            }
            if (!bitmapConsumed) {
                CommonUtils.Companion.BitmapPool.INSTANCE.recycleBitmap($retryBitmap);
            }
            return Unit.INSTANCE;
        }

        static /* synthetic */ void startPersistentFallbackRender$default(PdfPageViewHolder pdfPageViewHolder, int i, int i2, long j, int i3, Object obj) {
            if ((i3 & 2) != 0) {
                i2 = 10;
            }
            if ((i3 & 4) != 0) {
                j = 200;
            }
            pdfPageViewHolder.startPersistentFallbackRender(i, i2, j);
        }

        /* JADX WARN: Type inference failed for: r1v0, types: [T, com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1] */
        private final void startPersistentFallbackRender(final int page, final int retries, final long delayMs) {
            Runnable runnable;
            final Ref.IntRef attempt = new Ref.IntRef();
            final Ref.ObjectRef task = new Ref.ObjectRef();
            final PdfViewAdapter pdfViewAdapter = this.this$0;
            task.element = new Runnable() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1
                @Override // java.lang.Runnable
                public void run() {
                    int i;
                    boolean hasLiveBitmap;
                    CoroutineScope coroutineScope;
                    i = PdfViewAdapter.PdfPageViewHolder.this.currentBoundPage;
                    if (i == page) {
                        hasLiveBitmap = PdfViewAdapter.PdfPageViewHolder.this.hasLiveBitmap();
                        if (!hasLiveBitmap) {
                            coroutineScope = PdfViewAdapter.PdfPageViewHolder.this.scope;
                            BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, null, new PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1$run$1(PdfViewAdapter.PdfPageViewHolder.this, page, pdfViewAdapter, attempt, retries, task, delayMs, null), 3, null);
                        }
                    }
                }
            };
            Handler handler = this.fallbackHandler;
            if (task.element == 0) {
                Intrinsics.throwUninitializedPropertyAccessException("task");
                runnable = null;
            } else {
                runnable = (Runnable) task.element;
            }
            handler.postDelayed(runnable, delayMs);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void triggerFallbackRender(final int page) {
            final int displayWidth;
            Integer valueOf = Integer.valueOf(this.itemBinding.pageView.getWidth());
            int it = valueOf.intValue();
            int it2 = it > 0 ? 1 : 0;
            if (it2 == 0) {
                valueOf = null;
            }
            if (valueOf != null) {
                displayWidth = valueOf.intValue();
            } else {
                Integer valueOf2 = Integer.valueOf(this.itemView.getWidth());
                int it3 = valueOf2.intValue();
                Integer num = it3 > 0 ? valueOf2 : null;
                displayWidth = num != null ? num.intValue() : this.this$0.context.getResources().getDisplayMetrics().widthPixels;
            }
            this.this$0.renderer.getPageDimensionsAsync(page, new Function1() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return PdfViewAdapter.PdfPageViewHolder.triggerFallbackRender$lambda$7(PdfViewAdapter.PdfPageViewHolder.this, page, displayWidth, (Size) obj);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final Unit triggerFallbackRender$lambda$7(PdfPageViewHolder this$0, int $page, int $displayWidth, Size size) {
            Intrinsics.checkNotNullParameter(size, "size");
            if (this$0.currentBoundPage != $page || this$0.hasLiveBitmap()) {
                return Unit.INSTANCE;
            }
            float aspectRatio = size.getWidth() / size.getHeight();
            int height = (int) ($displayWidth / aspectRatio);
            this$0.updateLayoutParams(this$0.itemBinding, height);
            this$0.renderAndApplyBitmap($page, $displayWidth, height);
            return Unit.INSTANCE;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean applyCachedBitmap(Bitmap bitmap, int displayWidth) {
            return applyBitmapToView(bitmap, displayWidth);
        }

        private final boolean applyBitmapToView(Bitmap bitmap, int displayWidth) {
            if (bitmap.isRecycled() || bitmap.getWidth() <= 0 || bitmap.getHeight() <= 0) {
                return false;
            }
            float aspectRatio = bitmap.getWidth() / bitmap.getHeight();
            int height = (int) (displayWidth / aspectRatio);
            updateLayoutParams(this.itemBinding, height);
            this.itemBinding.pageView.setImageBitmap(bitmap);
            this.displayedBitmap = bitmap;
            ImageView pageView = this.itemBinding.pageView;
            Intrinsics.checkNotNullExpressionValue(pageView, "pageView");
            applyFadeInAnimation(pageView);
            this.itemBinding.pageLoadingLayout.pdfViewPageLoadingProgress.setVisibility(8);
            return true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final void updateLayoutParams(ListItemPdfPageBinding $this$updateLayoutParams, int height) {
            FrameLayout root = $this$updateLayoutParams.getRoot();
            ViewGroup.LayoutParams $this$updateLayoutParams_u24lambda_u248 = $this$updateLayoutParams.getRoot().getLayoutParams();
            PdfViewAdapter pdfViewAdapter = this.this$0;
            $this$updateLayoutParams_u24lambda_u248.height = height;
            ViewGroup.MarginLayoutParams marginLayoutParams = $this$updateLayoutParams_u24lambda_u248 instanceof ViewGroup.MarginLayoutParams ? (ViewGroup.MarginLayoutParams) $this$updateLayoutParams_u24lambda_u248 : null;
            if (marginLayoutParams != null) {
                marginLayoutParams.setMargins(pdfViewAdapter.pageSpacing.left, pdfViewAdapter.pageSpacing.top, pdfViewAdapter.pageSpacing.right, pdfViewAdapter.pageSpacing.bottom);
            }
            root.setLayoutParams($this$updateLayoutParams_u24lambda_u248);
            $this$updateLayoutParams.getRoot().requestLayout();
            $this$updateLayoutParams.pageView.requestLayout();
            PdfViewAdapter pdfViewAdapter2 = this.this$0;
            try {
                Result.Companion companion = Result.Companion;
                pdfViewAdapter2.parentView.getRecyclerView().requestLayout();
                Result.m7341constructorimpl(Unit.INSTANCE);
            } catch (Throwable th) {
                Result.Companion companion2 = Result.Companion;
                Result.m7341constructorimpl(ResultKt.createFailure(th));
            }
        }

        public final void cancelJobs() {
            cancelPendingRenderIfNeeded();
            CoroutineScopeKt.cancel$default(this.scope, null, 1, null);
            this.fallbackHandler.removeCallbacksAndMessages(null);
        }

        public final void renderIfMissing() {
            final int displayWidth;
            final int page = this.currentBoundPage;
            if (page == -1) {
                return;
            }
            this.hasRetried = false;
            this.hasTriggeredFallbackRender = false;
            CoroutineScopeKt.cancel$default(this.scope, null, 1, null);
            this.scope = CoroutineScopeKt.MainScope();
            Integer valueOf = Integer.valueOf(this.itemBinding.pageView.getWidth());
            int it = valueOf.intValue();
            int it2 = it > 0 ? 1 : 0;
            if (it2 == 0) {
                valueOf = null;
            }
            if (valueOf != null) {
                displayWidth = valueOf.intValue();
            } else {
                Integer valueOf2 = Integer.valueOf(this.itemView.getWidth());
                int it3 = valueOf2.intValue();
                Integer num = it3 > 0 ? valueOf2 : null;
                displayWidth = num != null ? num.intValue() : this.this$0.context.getResources().getDisplayMetrics().widthPixels;
            }
            this.this$0.renderer.getPageDimensionsAsync(page, new Function1() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return PdfViewAdapter.PdfPageViewHolder.renderIfMissing$lambda$12(PdfViewAdapter.PdfPageViewHolder.this, page, displayWidth, (Size) obj);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public static final Unit renderIfMissing$lambda$12(PdfPageViewHolder this$0, int $page, int $displayWidth, Size size) {
            Intrinsics.checkNotNullParameter(size, "size");
            if (this$0.currentBoundPage != $page) {
                return Unit.INSTANCE;
            }
            float aspectRatio = size.getWidth() / size.getHeight();
            int height = (int) ($displayWidth / aspectRatio);
            boolean hasBitmap = this$0.hasLiveBitmap();
            ViewGroup.LayoutParams layoutParams = this$0.itemBinding.getRoot().getLayoutParams();
            boolean heightMismatch = false;
            int layoutHeight = layoutParams != null ? layoutParams.height : 0;
            int measuredHeight = this$0.itemBinding.getRoot().getHeight();
            boolean hasUsableHeight = measuredHeight > 0;
            if (Math.abs(layoutHeight - height) > 1 || (hasUsableHeight && Math.abs(measuredHeight - height) > 1)) {
                heightMismatch = true;
            }
            if (!hasBitmap || !hasUsableHeight || heightMismatch) {
                this$0.updateLayoutParams(this$0.itemBinding, height);
            }
            if (!hasBitmap) {
                this$0.renderAndApplyBitmap($page, $displayWidth, height);
                this$0.startPersistentFallbackRender($page, 3, 150L);
            } else {
                this$0.itemBinding.pageLoadingLayout.pdfViewPageLoadingProgress.setVisibility(8);
            }
            return Unit.INSTANCE;
        }

        public final void handleDetach() {
            cancelPendingRenderIfNeeded();
            CoroutineScopeKt.cancel$default(this.scope, null, 1, null);
            this.fallbackHandler.removeCallbacksAndMessages(null);
        }

        private final void cancelPendingRenderIfNeeded() {
            int page = this.currentBoundPage;
            if (page != -1 && page >= 0 && !hasLiveBitmap()) {
                this.this$0.renderer.cancelRender(page);
            }
        }

        private final void clearDisplayedBitmapReference() {
            this.displayedBitmap = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean hasLiveBitmap() {
            Bitmap bitmap = this.displayedBitmap;
            return bitmap != null && !bitmap.isRecycled() && bitmap.getWidth() > 0 && bitmap.getHeight() > 0;
        }

        private final void applyFadeInAnimation(View view) {
            AlphaAnimation $this$applyFadeInAnimation_u24lambda_u2413 = new AlphaAnimation(0.0f, 1.0f);
            $this$applyFadeInAnimation_u24lambda_u2413.setInterpolator(new LinearInterpolator());
            $this$applyFadeInAnimation_u24lambda_u2413.setDuration(300L);
            view.startAnimation($this$applyFadeInAnimation_u24lambda_u2413);
        }
    }
}
