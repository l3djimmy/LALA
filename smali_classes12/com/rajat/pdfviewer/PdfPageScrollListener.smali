.class public final Lcom/rajat/pdfviewer/PdfPageScrollListener;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "PdfPageScrollListener.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfPageScrollListener.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfPageScrollListener.kt\ncom/rajat/pdfviewer/PdfPageScrollListener\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 View.kt\nandroidx/core/view/ViewKt\n*L\n1#1,74:1\n1#2:75\n255#3:76\n*S KotlinDebug\n*F\n+ 1 PdfPageScrollListener.kt\ncom/rajat/pdfviewer/PdfPageScrollListener\n*L\n18#1:76\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0001\u0018\u00002\u00020\u0001BE\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\u0008\u0012\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ \u0010\u0011\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00062\u0006\u0010\u0015\u001a\u00020\u0006H\u0016J\u0018\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0017\u001a\u00020\u0006H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\t0\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfPageScrollListener;",
        "Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;",
        "pageNoTextView",
        "Landroid/widget/TextView;",
        "totalPageCount",
        "Lkotlin/Function0;",
        "",
        "updatePage",
        "Lkotlin/Function1;",
        "",
        "schedulePrefetch",
        "<init>",
        "(Landroid/widget/TextView;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V",
        "lastDisplayedPage",
        "lastScrollDirection",
        "hideRunnable",
        "Ljava/lang/Runnable;",
        "onScrolled",
        "recyclerView",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "dx",
        "dy",
        "onScrollStateChanged",
        "newState",
        "pdfViewer_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I


# instance fields
.field private final hideRunnable:Ljava/lang/Runnable;

.field private lastDisplayedPage:I

.field private lastScrollDirection:I

.field private final pageNoTextView:Landroid/widget/TextView;

.field private final schedulePrefetch:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private final totalPageCount:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final updatePage:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .locals 1
    .param p1, "pageNoTextView"    # Landroid/widget/TextView;
    .param p2, "totalPageCount"    # Lkotlin/jvm/functions/Function0;
    .param p3, "updatePage"    # Lkotlin/jvm/functions/Function1;
    .param p4, "schedulePrefetch"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TextView;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Integer;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "pageNoTextView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "totalPageCount"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "updatePage"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "schedulePrefetch"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    .line 10
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->totalPageCount:Lkotlin/jvm/functions/Function0;

    .line 11
    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->updatePage:Lkotlin/jvm/functions/Function1;

    .line 12
    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->schedulePrefetch:Lkotlin/jvm/functions/Function1;

    .line 15
    const/4 v0, -0x1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->lastDisplayedPage:I

    .line 17
    new-instance v0, Lcom/rajat/pdfviewer/PdfPageScrollListener$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/rajat/pdfviewer/PdfPageScrollListener$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfPageScrollListener;)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    .line 8
    return-void
.end method

.method static final hideRunnable$lambda$0(Lcom/rajat/pdfviewer/PdfPageScrollListener;)V
    .locals 3
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfPageScrollListener;

    .line 18
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    check-cast v0, Landroid/view/View;

    .local v0, "$this$isVisible$iv":Landroid/view/View;
    const/4 v1, 0x0

    .line 76
    .local v1, "$i$f$isVisible":I
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 18
    .end local v0    # "$this$isVisible$iv":Landroid/view/View;
    .end local v1    # "$i$f$isVisible":I
    :goto_0
    if-eqz v2, :cond_1

    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 19
    :cond_1
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 6
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "newState"    # I

    const-string/jumbo v0, "recyclerView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    nop

    .line 70
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    .line 60
    if-nez p2, :cond_2

    .line 61
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 62
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    instance-of v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    if-eqz v1, :cond_0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    return-void

    .line 65
    .local v0, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    :cond_1
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    .line 66
    .local v1, "first":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v2

    .line 67
    .local v2, "last":I
    add-int v3, v1, v2

    div-int/lit8 v3, v3, 0x2

    .line 68
    .local v3, "middle":I
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->schedulePrefetch:Lkotlin/jvm/functions/Function1;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 70
    .end local v0    # "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    .end local v1    # "first":I
    .end local v2    # "last":I
    .end local v3    # "middle":I
    :cond_2
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 72
    :goto_1
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 13
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    const-string/jumbo v0, "recyclerView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const-string/jumbo v1, "null cannot be cast to non-null type androidx.recyclerview.widget.LinearLayoutManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 23
    .local v0, "layoutManager":Landroidx/recyclerview/widget/LinearLayoutManager;
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    .line 24
    .local v1, "firstVisible":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v2

    .line 25
    .local v2, "firstComplete":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v3

    .line 26
    .local v3, "lastVisible":I
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v4

    .line 28
    .local v4, "lastComplete":I
    nop

    .line 29
    const/4 v5, -0x1

    const/4 v6, 0x1

    if-lez p3, :cond_0

    move v7, v6

    goto :goto_0

    .line 30
    :cond_0
    if-gez p3, :cond_1

    move v7, v5

    goto :goto_0

    .line 31
    :cond_1
    iget v7, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->lastScrollDirection:I

    .line 28
    :goto_0
    nop

    .line 33
    .local v7, "direction":I
    iput v7, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->lastScrollDirection:I

    .line 35
    const/4 v8, 0x0

    const/4 v9, 0x0

    packed-switch v7, :pswitch_data_0

    .line 42
    :pswitch_0
    goto/16 :goto_7

    .line 36
    :pswitch_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    .line 75
    .local v11, "it":I
    const/4 v12, 0x0

    .line 36
    .local v12, "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$1":I
    if-eq v11, v5, :cond_2

    move v11, v6

    goto :goto_1

    :cond_2
    move v11, v9

    .end local v11    # "it":I
    .end local v12    # "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$1":I
    :goto_1
    if-eqz v11, :cond_3

    goto :goto_2

    :cond_3
    move-object v10, v8

    :goto_2
    if-eqz v10, :cond_4

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto/16 :goto_8

    .line 37
    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    .line 75
    .restart local v11    # "it":I
    const/4 v12, 0x0

    .line 37
    .local v12, "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$2":I
    if-eq v11, v5, :cond_5

    goto :goto_3

    :cond_5
    move v6, v9

    .end local v11    # "it":I
    .end local v12    # "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$2":I
    :goto_3
    if-eqz v6, :cond_6

    move-object v8, v10

    .line 36
    :cond_6
    if-eqz v8, :cond_7

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_8

    .line 38
    :cond_7
    goto :goto_7

    .line 39
    :pswitch_2
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    .line 75
    .restart local v11    # "it":I
    const/4 v12, 0x0

    .line 39
    .local v12, "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$3":I
    if-eq v11, v5, :cond_8

    move v11, v6

    goto :goto_4

    :cond_8
    move v11, v9

    .end local v11    # "it":I
    .end local v12    # "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$3":I
    :goto_4
    if-eqz v11, :cond_9

    goto :goto_5

    :cond_9
    move-object v10, v8

    :goto_5
    if-eqz v10, :cond_a

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_8

    .line 40
    :cond_a
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    move-object v11, v10

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    .line 75
    .restart local v11    # "it":I
    const/4 v12, 0x0

    .line 40
    .local v12, "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$4":I
    if-eq v11, v5, :cond_b

    goto :goto_6

    :cond_b
    move v6, v9

    .end local v11    # "it":I
    .end local v12    # "$i$a$-takeIf-PdfPageScrollListener$onScrolled$pageToShow$4":I
    :goto_6
    if-eqz v6, :cond_c

    move-object v8, v10

    .line 39
    :cond_c
    if-eqz v8, :cond_d

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v6

    goto :goto_8

    .line 41
    :cond_d
    move v6, v3

    goto :goto_8

    .line 35
    :goto_7
    move v6, v1

    :goto_8
    nop

    .line 45
    .local v6, "pageToShow":I
    iget v8, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->lastDisplayedPage:I

    if-eq v6, v8, :cond_e

    if-eq v6, v5, :cond_e

    .line 46
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->updatePage:Lkotlin/jvm/functions/Function1;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v5, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    invoke-virtual {v8}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v8

    .line 48
    sget v10, Lcom/rajat/pdfviewer/R$string;->pdfView_page_no:I

    add-int/lit8 v11, v6, 0x1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    iget-object v12, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->totalPageCount:Lkotlin/jvm/functions/Function0;

    invoke-interface {v12}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v12

    filled-new-array {v11, v12}, [Ljava/lang/Object;

    move-result-object v11

    .line 47
    invoke-virtual {v8, v10, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    check-cast v8, Ljava/lang/CharSequence;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    invoke-virtual {v5, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 52
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 53
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->pageNoTextView:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->hideRunnable:Ljava/lang/Runnable;

    const-wide/16 v9, 0xbb8

    invoke-virtual {v5, v8, v9, v10}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 55
    iput v6, p0, Lcom/rajat/pdfviewer/PdfPageScrollListener;->lastDisplayedPage:I

    .line 57
    :cond_e
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
