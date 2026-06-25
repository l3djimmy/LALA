.class public final Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
.super Ljava/lang/Object;
.source "PdfViewPageLoadingLayoutBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final pdfViewPageLoadingProgress:Landroid/widget/ProgressBar;

.field private final rootView:Landroid/widget/FrameLayout;


# direct methods
.method private constructor <init>(Landroid/widget/FrameLayout;Landroid/widget/ProgressBar;)V
    .locals 0
    .param p1, "rootView"    # Landroid/widget/FrameLayout;
    .param p2, "pdfViewPageLoadingProgress"    # Landroid/widget/ProgressBar;

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->rootView:Landroid/widget/FrameLayout;

    .line 28
    iput-object p2, p0, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->pdfViewPageLoadingProgress:Landroid/widget/ProgressBar;

    .line 29
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    .locals 4
    .param p0, "rootView"    # Landroid/view/View;

    .line 58
    sget v0, Lcom/rajat/pdfviewer/R$id;->pdf_view_page_loading_progress:I

    .line 59
    .local v0, "id":I
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    .line 60
    .local v1, "pdfViewPageLoadingProgress":Landroid/widget/ProgressBar;
    if-eqz v1, :cond_0

    .line 64
    new-instance v2, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    move-object v3, p0

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-direct {v2, v3, v1}, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;-><init>(Landroid/widget/FrameLayout;Landroid/widget/ProgressBar;)V

    return-object v2

    .line 61
    :cond_0
    nop

    .line 67
    .end local v1    # "pdfViewPageLoadingProgress":Landroid/widget/ProgressBar;
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    .line 68
    .local v1, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 39
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 45
    sget v0, Lcom/rajat/pdfviewer/R$layout;->pdf_view_page_loading_layout:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 46
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 47
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    :cond_0
    invoke-static {v0}, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 18
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroid/widget/FrameLayout;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->rootView:Landroid/widget/FrameLayout;

    return-object v0
.end method
