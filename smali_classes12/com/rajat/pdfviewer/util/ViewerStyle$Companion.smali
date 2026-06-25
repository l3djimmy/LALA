.class public final Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;
.super Ljava/lang/Object;
.source "ViewerStyle.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/util/ViewerStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;",
        "",
        "<init>",
        "()V",
        "from",
        "Lcom/rajat/pdfviewer/util/ViewerStyle;",
        "context",
        "Landroid/content/Context;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/rajat/pdfviewer/util/ViewerStyle$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final from(Landroid/content/Context;)Lcom/rajat/pdfviewer/util/ViewerStyle;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 30
    sget-object v1, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView:[I

    .line 29
    invoke-virtual {v0, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    const-string/jumbo v1, "obtainStyledAttributes(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .local v0, "typedArray":Landroid/content/res/TypedArray;
    sget-object v1, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 34
    nop

    .line 35
    sget v2, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_backgroundColor:I

    .line 36
    sget v3, Lcom/rajat/pdfviewer/R$color;->pdf_viewer_surface:I

    invoke-static {p1, v3}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    .line 33
    invoke-virtual {v1, v0, v2, v3}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getColorFromTypedArray(Landroid/content/res/TypedArray;II)I

    move-result v1

    .line 39
    .local v1, "backgroundColor":I
    sget-object v2, Lcom/rajat/pdfviewer/util/ThemeUtils;->INSTANCE:Lcom/rajat/pdfviewer/util/ThemeUtils;

    .line 40
    nop

    .line 41
    sget v3, Lcom/rajat/pdfviewer/R$styleable;->PdfRendererView_pdfView_progressBar:I

    .line 42
    sget v4, Lcom/rajat/pdfviewer/R$drawable;->pdf_viewer_progress_circle:I

    .line 39
    invoke-virtual {v2, v0, v3, v4}, Lcom/rajat/pdfviewer/util/ThemeUtils;->getResIdFromTypedArray(Landroid/content/res/TypedArray;II)I

    move-result v2

    .line 45
    .local v2, "progressBarDrawableResId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 47
    new-instance v3, Lcom/rajat/pdfviewer/util/ViewerStyle;

    .line 48
    nop

    .line 49
    nop

    .line 47
    invoke-direct {v3, v1, v2}, Lcom/rajat/pdfviewer/util/ViewerStyle;-><init>(II)V

    return-object v3
.end method
