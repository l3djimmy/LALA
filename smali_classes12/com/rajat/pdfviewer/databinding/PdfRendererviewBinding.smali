.class public final Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;
.super Ljava/lang/Object;
.source "PdfRendererviewBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final pageNumber:Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;

.field public final recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

.field private final rootView:Landroid/widget/FrameLayout;

.field public final webView:Landroid/webkit/WebView;


# direct methods
.method private constructor <init>(Landroid/widget/FrameLayout;Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Landroid/webkit/WebView;)V
    .locals 0
    .param p1, "rootView"    # Landroid/widget/FrameLayout;
    .param p2, "pageNumber"    # Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;
    .param p3, "recyclerView"    # Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    .param p4, "webView"    # Landroid/webkit/WebView;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->rootView:Landroid/widget/FrameLayout;

    .line 36
    iput-object p2, p0, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->pageNumber:Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;

    .line 37
    iput-object p3, p0, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->recyclerView:Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 38
    iput-object p4, p0, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->webView:Landroid/webkit/WebView;

    .line 39
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;
    .locals 7
    .param p0, "rootView"    # Landroid/view/View;

    .line 68
    sget v0, Lcom/rajat/pdfviewer/R$id;->pageNumber:I

    .line 69
    .local v0, "id":I
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    .line 70
    .local v1, "pageNumber":Landroid/view/View;
    if-eqz v1, :cond_2

    .line 73
    invoke-static {v1}, Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;

    move-result-object v2

    .line 75
    .local v2, "binding_pageNumber":Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;
    sget v0, Lcom/rajat/pdfviewer/R$id;->recyclerView:I

    .line 76
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    .line 77
    .local v3, "recyclerView":Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    if-eqz v3, :cond_1

    .line 81
    sget v0, Lcom/rajat/pdfviewer/R$id;->webView:I

    .line 82
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/webkit/WebView;

    .line 83
    .local v4, "webView":Landroid/webkit/WebView;
    if-eqz v4, :cond_0

    .line 87
    new-instance v5, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;

    move-object v6, p0

    check-cast v6, Landroid/widget/FrameLayout;

    invoke-direct {v5, v6, v2, v3, v4}, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;-><init>(Landroid/widget/FrameLayout;Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;Lcom/rajat/pdfviewer/PinchZoomRecyclerView;Landroid/webkit/WebView;)V

    return-object v5

    .line 84
    :cond_0
    goto :goto_0

    .line 78
    .end local v4    # "webView":Landroid/webkit/WebView;
    :cond_1
    goto :goto_0

    .line 71
    .end local v2    # "binding_pageNumber":Lcom/rajat/pdfviewer/databinding/PdfViewPageNoBinding;
    .end local v3    # "recyclerView":Lcom/rajat/pdfviewer/PinchZoomRecyclerView;
    :cond_2
    nop

    .line 90
    .end local v1    # "pageNumber":Landroid/view/View;
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 49
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 55
    sget v0, Lcom/rajat/pdfviewer/R$layout;->pdf_rendererview:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 59
    :cond_0
    invoke-static {v0}, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 19
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroid/widget/FrameLayout;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/rajat/pdfviewer/databinding/PdfRendererviewBinding;->rootView:Landroid/widget/FrameLayout;

    return-object v0
.end method
