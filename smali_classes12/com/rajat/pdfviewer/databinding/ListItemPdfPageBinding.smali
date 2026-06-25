.class public final Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
.super Ljava/lang/Object;
.source "ListItemPdfPageBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final containerView:Landroid/widget/FrameLayout;

.field public final pageLoadingLayout:Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

.field public final pageView:Landroid/widget/ImageView;

.field private final rootView:Landroid/widget/FrameLayout;


# direct methods
.method private constructor <init>(Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "rootView"    # Landroid/widget/FrameLayout;
    .param p2, "containerView"    # Landroid/widget/FrameLayout;
    .param p3, "pageLoadingLayout"    # Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    .param p4, "pageView"    # Landroid/widget/ImageView;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->rootView:Landroid/widget/FrameLayout;

    .line 34
    iput-object p2, p0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->containerView:Landroid/widget/FrameLayout;

    .line 35
    iput-object p3, p0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageLoadingLayout:Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    .line 36
    iput-object p4, p0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    .line 37
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .locals 7
    .param p0, "rootView"    # Landroid/view/View;

    .line 66
    move-object v0, p0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 68
    .local v0, "containerView":Landroid/widget/FrameLayout;
    sget v1, Lcom/rajat/pdfviewer/R$id;->pageLoadingLayout:I

    .line 69
    .local v1, "id":I
    invoke-static {p0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v2

    .line 70
    .local v2, "pageLoadingLayout":Landroid/view/View;
    if-eqz v2, :cond_1

    .line 73
    invoke-static {v2}, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    move-result-object v3

    .line 75
    .local v3, "binding_pageLoadingLayout":Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    sget v1, Lcom/rajat/pdfviewer/R$id;->pageView:I

    .line 76
    invoke-static {p0, v1}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 77
    .local v4, "pageView":Landroid/widget/ImageView;
    if-eqz v4, :cond_0

    .line 81
    new-instance v5, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-object v6, p0

    check-cast v6, Landroid/widget/FrameLayout;

    invoke-direct {v5, v6, v0, v3, v4}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;-><init>(Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;Landroid/widget/ImageView;)V

    return-object v5

    .line 78
    :cond_0
    goto :goto_0

    .line 71
    .end local v3    # "binding_pageLoadingLayout":Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    .end local v4    # "pageView":Landroid/widget/ImageView;
    :cond_1
    nop

    .line 84
    .end local v0    # "containerView":Landroid/widget/FrameLayout;
    .end local v2    # "pageLoadingLayout":Landroid/view/View;
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 47
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 53
    sget v0, Lcom/rajat/pdfviewer/R$layout;->list_item_pdf_page:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 54
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 55
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    :cond_0
    invoke-static {v0}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroid/widget/FrameLayout;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->rootView:Landroid/widget/FrameLayout;

    return-object v0
.end method
