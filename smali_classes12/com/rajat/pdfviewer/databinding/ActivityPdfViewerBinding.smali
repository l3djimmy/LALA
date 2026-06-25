.class public final Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;
.super Ljava/lang/Object;
.source "ActivityPdfViewerBinding.java"

# interfaces
.implements Landroidx/viewbinding/ViewBinding;


# instance fields
.field public final mainLayout:Landroid/widget/FrameLayout;

.field public final myToolbar:Lcom/google/android/material/appbar/MaterialToolbar;

.field public final parentLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final pdfView:Lcom/rajat/pdfviewer/PdfRendererView;

.field public final progressBar:Landroid/widget/ProgressBar;

.field private final rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final toolbarTitle:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/FrameLayout;Lcom/google/android/material/appbar/MaterialToolbar;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "rootView"    # Landroidx/constraintlayout/widget/ConstraintLayout;
    .param p2, "mainLayout"    # Landroid/widget/FrameLayout;
    .param p3, "myToolbar"    # Lcom/google/android/material/appbar/MaterialToolbar;
    .param p4, "parentLayout"    # Landroidx/constraintlayout/widget/ConstraintLayout;
    .param p5, "pdfView"    # Lcom/rajat/pdfviewer/PdfRendererView;
    .param p6, "progressBar"    # Landroid/widget/ProgressBar;
    .param p7, "toolbarTitle"    # Landroid/widget/TextView;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 49
    iput-object p2, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->mainLayout:Landroid/widget/FrameLayout;

    .line 50
    iput-object p3, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->myToolbar:Lcom/google/android/material/appbar/MaterialToolbar;

    .line 51
    iput-object p4, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->parentLayout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 52
    iput-object p5, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->pdfView:Lcom/rajat/pdfviewer/PdfRendererView;

    .line 53
    iput-object p6, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->progressBar:Landroid/widget/ProgressBar;

    .line 54
    iput-object p7, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->toolbarTitle:Landroid/widget/TextView;

    .line 55
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;
    .locals 10
    .param p0, "rootView"    # Landroid/view/View;

    .line 84
    sget v0, Lcom/rajat/pdfviewer/R$id;->mainLayout:I

    .line 85
    .local v0, "id":I
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/FrameLayout;

    .line 86
    .local v4, "mainLayout":Landroid/widget/FrameLayout;
    if-eqz v4, :cond_4

    .line 90
    sget v0, Lcom/rajat/pdfviewer/R$id;->my_toolbar:I

    .line 91
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/google/android/material/appbar/MaterialToolbar;

    .line 92
    .local v5, "myToolbar":Lcom/google/android/material/appbar/MaterialToolbar;
    if-eqz v5, :cond_3

    .line 96
    move-object v6, p0

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 98
    .local v6, "parentLayout":Landroidx/constraintlayout/widget/ConstraintLayout;
    sget v0, Lcom/rajat/pdfviewer/R$id;->pdfView:I

    .line 99
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/rajat/pdfviewer/PdfRendererView;

    .line 100
    .local v7, "pdfView":Lcom/rajat/pdfviewer/PdfRendererView;
    if-eqz v7, :cond_2

    .line 104
    sget v0, Lcom/rajat/pdfviewer/R$id;->progressBar:I

    .line 105
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/widget/ProgressBar;

    .line 106
    .local v8, "progressBar":Landroid/widget/ProgressBar;
    if-eqz v8, :cond_1

    .line 110
    sget v0, Lcom/rajat/pdfviewer/R$id;->toolbar_title:I

    .line 111
    invoke-static {p0, v0}, Landroidx/viewbinding/ViewBindings;->findChildViewById(Landroid/view/View;I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/TextView;

    .line 112
    .local v9, "toolbarTitle":Landroid/widget/TextView;
    if-eqz v9, :cond_0

    .line 116
    new-instance v2, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;

    move-object v3, p0

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct/range {v2 .. v9}, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/FrameLayout;Lcom/google/android/material/appbar/MaterialToolbar;Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/rajat/pdfviewer/PdfRendererView;Landroid/widget/ProgressBar;Landroid/widget/TextView;)V

    return-object v2

    .line 113
    :cond_0
    goto :goto_0

    .line 107
    .end local v9    # "toolbarTitle":Landroid/widget/TextView;
    :cond_1
    goto :goto_0

    .line 101
    .end local v8    # "progressBar":Landroid/widget/ProgressBar;
    :cond_2
    goto :goto_0

    .line 93
    .end local v6    # "parentLayout":Landroidx/constraintlayout/widget/ConstraintLayout;
    .end local v7    # "pdfView":Lcom/rajat/pdfviewer/PdfRendererView;
    :cond_3
    goto :goto_0

    .line 87
    .end local v5    # "myToolbar":Lcom/google/android/material/appbar/MaterialToolbar;
    :cond_4
    nop

    .line 119
    .end local v4    # "mainLayout":Landroid/widget/FrameLayout;
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v1

    .line 120
    .local v1, "missingId":Ljava/lang/String;
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "Missing required view with ID: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;

    .line 65
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;
    .locals 2
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "attachToParent"    # Z

    .line 71
    sget v0, Lcom/rajat/pdfviewer/R$layout;->activity_pdf_viewer:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 72
    .local v0, "root":Landroid/view/View;
    if-eqz p2, :cond_0

    .line 73
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 75
    :cond_0
    invoke-static {v0}, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->bind(Landroid/view/View;)Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public bridge synthetic getRoot()Landroid/view/View;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object v0

    return-object v0
.end method

.method public getRoot()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/rajat/pdfviewer/databinding/ActivityPdfViewerBinding;->rootView:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object v0
.end method
