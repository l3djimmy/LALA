package com.rajat.pdfviewer;

import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfPageScrollListener.kt */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001BE\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\b\u0012\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\b¢\u0006\u0004\b\u000b\u0010\fJ \u0010\u0011\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0006H\u0016J\u0018\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0017\u001a\u00020\u0006H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0006X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/rajat/pdfviewer/PdfPageScrollListener;", "Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;", "pageNoTextView", "Landroid/widget/TextView;", "totalPageCount", "Lkotlin/Function0;", "", "updatePage", "Lkotlin/Function1;", "", "schedulePrefetch", "<init>", "(Landroid/widget/TextView;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V", "lastDisplayedPage", "lastScrollDirection", "hideRunnable", "Ljava/lang/Runnable;", "onScrolled", "recyclerView", "Landroidx/recyclerview/widget/RecyclerView;", "dx", "dy", "onScrollStateChanged", "newState", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfPageScrollListener extends RecyclerView.OnScrollListener {
    public static final int $stable = 8;
    private final Runnable hideRunnable;
    private int lastDisplayedPage;
    private int lastScrollDirection;
    private final TextView pageNoTextView;
    private final Function1<Integer, Unit> schedulePrefetch;
    private final Function0<Integer> totalPageCount;
    private final Function1<Integer, Unit> updatePage;

    /* JADX WARN: Multi-variable type inference failed */
    public PdfPageScrollListener(TextView pageNoTextView, Function0<Integer> totalPageCount, Function1<? super Integer, Unit> updatePage, Function1<? super Integer, Unit> schedulePrefetch) {
        Intrinsics.checkNotNullParameter(pageNoTextView, "pageNoTextView");
        Intrinsics.checkNotNullParameter(totalPageCount, "totalPageCount");
        Intrinsics.checkNotNullParameter(updatePage, "updatePage");
        Intrinsics.checkNotNullParameter(schedulePrefetch, "schedulePrefetch");
        this.pageNoTextView = pageNoTextView;
        this.totalPageCount = totalPageCount;
        this.updatePage = updatePage;
        this.schedulePrefetch = schedulePrefetch;
        this.lastDisplayedPage = -1;
        this.hideRunnable = new Runnable() { // from class: com.rajat.pdfviewer.PdfPageScrollListener$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                PdfPageScrollListener.hideRunnable$lambda$0(PdfPageScrollListener.this);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void hideRunnable$lambda$0(PdfPageScrollListener this$0) {
        View $this$isVisible$iv = this$0.pageNoTextView;
        if ($this$isVisible$iv.getVisibility() == 0) {
            this$0.pageNoTextView.setVisibility(8);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
        int pageToShow;
        Integer num;
        Intrinsics.checkNotNullParameter(recyclerView, "recyclerView");
        RecyclerView.LayoutManager layoutManager = recyclerView.getLayoutManager();
        Intrinsics.checkNotNull(layoutManager, "null cannot be cast to non-null type androidx.recyclerview.widget.LinearLayoutManager");
        LinearLayoutManager layoutManager2 = (LinearLayoutManager) layoutManager;
        int firstVisible = layoutManager2.findFirstVisibleItemPosition();
        int firstComplete = layoutManager2.findFirstCompletelyVisibleItemPosition();
        int lastVisible = layoutManager2.findLastVisibleItemPosition();
        int lastComplete = layoutManager2.findLastCompletelyVisibleItemPosition();
        int direction = dy > 0 ? 1 : dy < 0 ? -1 : this.lastScrollDirection;
        this.lastScrollDirection = direction;
        switch (direction) {
            case -1:
                Integer valueOf = Integer.valueOf(firstComplete);
                int it = valueOf.intValue();
                int it2 = it != -1 ? 1 : 0;
                if (it2 == 0) {
                    valueOf = null;
                }
                if (valueOf == null) {
                    Integer valueOf2 = Integer.valueOf(firstVisible);
                    int it3 = valueOf2.intValue();
                    num = it3 != -1 ? valueOf2 : null;
                    if (num == null) {
                        pageToShow = lastVisible;
                        break;
                    } else {
                        pageToShow = num.intValue();
                        break;
                    }
                } else {
                    pageToShow = valueOf.intValue();
                    break;
                }
            case 1:
                Integer valueOf3 = Integer.valueOf(lastComplete);
                int it4 = valueOf3.intValue();
                int it5 = it4 != -1 ? 1 : 0;
                if (it5 == 0) {
                    valueOf3 = null;
                }
                if (valueOf3 == null) {
                    Integer valueOf4 = Integer.valueOf(lastVisible);
                    int it6 = valueOf4.intValue();
                    num = it6 != -1 ? valueOf4 : null;
                    if (num != null) {
                        pageToShow = num.intValue();
                        break;
                    }
                } else {
                    pageToShow = valueOf3.intValue();
                    break;
                }
            case 0:
            default:
                pageToShow = firstVisible;
                break;
        }
        if (pageToShow == this.lastDisplayedPage || pageToShow == -1) {
            return;
        }
        this.updatePage.invoke(Integer.valueOf(pageToShow));
        this.pageNoTextView.setText(this.pageNoTextView.getContext().getString(R.string.pdfView_page_no, Integer.valueOf(pageToShow + 1), this.totalPageCount.invoke()));
        this.pageNoTextView.setVisibility(0);
        this.pageNoTextView.removeCallbacks(this.hideRunnable);
        this.pageNoTextView.postDelayed(this.hideRunnable, 3000L);
        this.lastDisplayedPage = pageToShow;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
    public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        Intrinsics.checkNotNullParameter(recyclerView, "recyclerView");
        TextView textView = this.pageNoTextView;
        if (newState == 0) {
            textView.removeCallbacks(this.hideRunnable);
            this.pageNoTextView.postDelayed(this.hideRunnable, 3000L);
            RecyclerView.LayoutManager layoutManager = recyclerView.getLayoutManager();
            LinearLayoutManager layoutManager2 = layoutManager instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager : null;
            if (layoutManager2 == null) {
                return;
            }
            int first = layoutManager2.findFirstVisibleItemPosition();
            int last = layoutManager2.findLastVisibleItemPosition();
            int middle = (first + last) / 2;
            this.schedulePrefetch.invoke(Integer.valueOf(middle));
            return;
        }
        textView.removeCallbacks(this.hideRunnable);
    }
}
