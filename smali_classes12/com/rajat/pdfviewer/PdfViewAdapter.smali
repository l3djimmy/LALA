.class public final Lcom/rajat/pdfviewer/PdfViewAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "PdfViewAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0007\u0008\u0001\u0018\u00002\u000c\u0012\u0008\u0012\u00060\u0002R\u00020\u00000\u0001:\u0001\u001cB/\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001c\u0010\u000f\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0008\u0010\u0014\u001a\u00020\u0013H\u0016J\u001c\u0010\u0015\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0013H\u0016J\u0014\u0010\u0019\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016J\u0014\u0010\u001a\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016J\u0014\u0010\u001b\u001a\u00020\u00162\n\u0010\u0017\u001a\u00060\u0002R\u00020\u0000H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfViewAdapter;",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter;",
        "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;",
        "context",
        "Landroid/content/Context;",
        "renderer",
        "Lcom/rajat/pdfviewer/PdfRendererCore;",
        "parentView",
        "Lcom/rajat/pdfviewer/PdfRendererView;",
        "pageSpacing",
        "Landroid/graphics/Rect;",
        "enableLoadingForPages",
        "",
        "<init>",
        "(Landroid/content/Context;Lcom/rajat/pdfviewer/PdfRendererCore;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/graphics/Rect;Z)V",
        "onCreateViewHolder",
        "parent",
        "Landroid/view/ViewGroup;",
        "viewType",
        "",
        "getItemCount",
        "onBindViewHolder",
        "",
        "holder",
        "position",
        "onViewRecycled",
        "onViewAttachedToWindow",
        "onViewDetachedFromWindow",
        "PdfPageViewHolder",
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
.field private final context:Landroid/content/Context;

.field private final enableLoadingForPages:Z

.field private final pageSpacing:Landroid/graphics/Rect;

.field private final parentView:Lcom/rajat/pdfviewer/PdfRendererView;

.field private final renderer:Lcom/rajat/pdfviewer/PdfRendererCore;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/rajat/pdfviewer/PdfViewAdapter;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/rajat/pdfviewer/PdfRendererCore;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/graphics/Rect;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "renderer"    # Lcom/rajat/pdfviewer/PdfRendererCore;
    .param p3, "parentView"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p4, "pageSpacing"    # Landroid/graphics/Rect;
    .param p5, "enableLoadingForPages"    # Z

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "renderer"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "parentView"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "pageSpacing"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->context:Landroid/content/Context;

    .line 25
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->renderer:Lcom/rajat/pdfviewer/PdfRendererCore;

    .line 26
    iput-object p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->parentView:Lcom/rajat/pdfviewer/PdfRendererView;

    .line 27
    iput-object p4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->pageSpacing:Landroid/graphics/Rect;

    .line 28
    iput-boolean p5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->enableLoadingForPages:Z

    .line 23
    return-void
.end method

.method public static final synthetic access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 23
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static final synthetic access$getEnableLoadingForPages$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 23
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->enableLoadingForPages:Z

    return v0
.end method

.method public static final synthetic access$getPageSpacing$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/graphics/Rect;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 23
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->pageSpacing:Landroid/graphics/Rect;

    return-object v0
.end method

.method public static final synthetic access$getParentView$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererView;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 23
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->parentView:Lcom/rajat/pdfviewer/PdfRendererView;

    return-object v0
.end method

.method public static final synthetic access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 23
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->renderer:Lcom/rajat/pdfviewer/PdfRendererCore;

    return-object v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter;->renderer:Lcom/rajat/pdfviewer/PdfRendererCore;

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageCount()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "p0"    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .param p2, "p1"    # I

    .line 23
    move-object v0, p1

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-virtual {p0, v0, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->onBindViewHolder(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p2, "position"    # I

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bind(I)V

    .line 40
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1
    .param p1, "p0"    # Landroid/view/ViewGroup;
    .param p2, "p1"    # I

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    const-string/jumbo v0, "parent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    new-instance v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 33
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p1, v2}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-result-object v1

    const-string v2, "inflate(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    invoke-direct {v0, p0, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;)V

    .line 34
    return-object v0
.end method

.method public bridge synthetic onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "p0"    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 23
    move-object v0, p1

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->onViewAttachedToWindow(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V

    return-void
.end method

.method public onViewAttachedToWindow(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    move-object v0, p1

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 49
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->renderIfMissing()V

    .line 50
    return-void
.end method

.method public bridge synthetic onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "p0"    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 23
    move-object v0, p1

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->onViewDetachedFromWindow(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    move-object v0, p1

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 54
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->handleDetach()V

    .line 55
    return-void
.end method

.method public bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "p0"    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 23
    move-object v0, p1

    check-cast v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    invoke-virtual {p0, v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->onViewRecycled(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 43
    move-object v0, p1

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    invoke-super {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    .line 44
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->cancelJobs()V

    .line 45
    return-void
.end method
