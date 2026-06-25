.class public final Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "PdfViewAdapter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rajat/pdfviewer/PdfViewAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "PdfPageViewHolder"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPdfViewAdapter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PdfViewAdapter.kt\ncom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,359:1\n1#2:360\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0010\t\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0007J \u0010\u0015\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J \u0010\u0019\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u0017\u001a\u00020\u00072\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J$\u0010\u001a\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u001b\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u001c\u001a\u00020\u001dH\u0002J\u0010\u0010\u001e\u001a\u00020\u00132\u0006\u0010\u0016\u001a\u00020\u0007H\u0002J\u0018\u0010\u001f\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\t2\u0006\u0010!\u001a\u00020\u0007H\u0002J\u0018\u0010\"\u001a\u00020\u000b2\u0006\u0010 \u001a\u00020\t2\u0006\u0010!\u001a\u00020\u0007H\u0002J\u0014\u0010#\u001a\u00020\u0013*\u00020\u00032\u0006\u0010\u0018\u001a\u00020\u0007H\u0002J\u0006\u0010$\u001a\u00020\u0013J\u0006\u0010%\u001a\u00020\u0013J\u0006\u0010&\u001a\u00020\u0013J\u0008\u0010\'\u001a\u00020\u0013H\u0002J\u0008\u0010(\u001a\u00020\u0013H\u0002J\u0008\u0010)\u001a\u00020\u000bH\u0002J\u0010\u0010*\u001a\u00020\u00132\u0006\u0010+\u001a\u00020,H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006-"
    }
    d2 = {
        "Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        "itemBinding",
        "Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;",
        "<init>",
        "(Lcom/rajat/pdfviewer/PdfViewAdapter;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;)V",
        "currentBoundPage",
        "",
        "displayedBitmap",
        "Landroid/graphics/Bitmap;",
        "hasRetried",
        "",
        "hasTriggeredFallbackRender",
        "bindGeneration",
        "fallbackHandler",
        "Landroid/os/Handler;",
        "scope",
        "Lkotlinx/coroutines/CoroutineScope;",
        "bind",
        "",
        "position",
        "renderAndApplyBitmap",
        "page",
        "width",
        "height",
        "retryRenderOnce",
        "startPersistentFallbackRender",
        "retries",
        "delayMs",
        "",
        "triggerFallbackRender",
        "applyCachedBitmap",
        "bitmap",
        "displayWidth",
        "applyBitmapToView",
        "updateLayoutParams",
        "cancelJobs",
        "renderIfMissing",
        "handleDetach",
        "cancelPendingRenderIfNeeded",
        "clearDisplayedBitmapReference",
        "hasLiveBitmap",
        "applyFadeInAnimation",
        "view",
        "Landroid/view/View;",
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


# instance fields
.field private bindGeneration:I

.field private currentBoundPage:I

.field private displayedBitmap:Landroid/graphics/Bitmap;

.field private final fallbackHandler:Landroid/os/Handler;

.field private hasRetried:Z

.field private hasTriggeredFallbackRender:Z

.field private final itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

.field private scope:Lkotlinx/coroutines/CoroutineScope;

.field final synthetic this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;


# direct methods
.method public constructor <init>(Lcom/rajat/pdfviewer/PdfViewAdapter;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;)V
    .locals 2
    .param p1, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter;
    .param p2, "itemBinding"    # Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;",
            ")V"
        }
    .end annotation

    const-string v0, "itemBinding"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    .line 58
    invoke-virtual {p2}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 57
    iput-object p2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    .line 65
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->fallbackHandler:Landroid/os/Handler;

    .line 66
    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->MainScope()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    .line 57
    return-void
.end method

.method public static final synthetic access$applyCachedBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Landroid/graphics/Bitmap;I)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "displayWidth"    # I

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->applyCachedBitmap(Landroid/graphics/Bitmap;I)Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$getCurrentBoundPage$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)I
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    return v0
.end method

.method public static final synthetic access$getFallbackHandler$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Landroid/os/Handler;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->fallbackHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public static final synthetic access$getHasTriggeredFallbackRender$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    iget-boolean v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasTriggeredFallbackRender:Z

    return v0
.end method

.method public static final synthetic access$getItemBinding$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    return-object v0
.end method

.method public static final synthetic access$getScope$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Lkotlinx/coroutines/CoroutineScope;
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    return-object v0
.end method

.method public static final synthetic access$hasLiveBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;)Z
    .locals 1
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;

    .line 57
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasLiveBitmap()Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$renderAndApplyBitmap(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;III)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "page"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->renderAndApplyBitmap(III)V

    return-void
.end method

.method public static final synthetic access$setHasTriggeredFallbackRender$p(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Z)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "<set-?>"    # Z

    .line 57
    iput-boolean p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasTriggeredFallbackRender:Z

    return-void
.end method

.method public static final synthetic access$triggerFallbackRender(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "page"    # I

    .line 57
    invoke-direct {p0, p1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->triggerFallbackRender(I)V

    return-void
.end method

.method public static final synthetic access$updateLayoutParams(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V
    .locals 0
    .param p0, "$this"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "$receiver"    # Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .param p2, "height"    # I

    .line 57
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->updateLayoutParams(Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V

    return-void
.end method

.method private final applyBitmapToView(Landroid/graphics/Bitmap;I)Z
    .locals 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "displayWidth"    # I

    .line 261
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    .line 262
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 263
    .local v0, "aspectRatio":F
    int-to-float v1, p2

    div-float/2addr v1, v0

    float-to-int v1, v1

    .line 264
    .local v1, "height":I
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-direct {p0, v2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->updateLayoutParams(Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V

    .line 265
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 266
    iput-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->displayedBitmap:Landroid/graphics/Bitmap;

    .line 267
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    const-string/jumbo v3, "pageView"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroid/view/View;

    invoke-direct {p0, v2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->applyFadeInAnimation(Landroid/view/View;)V

    .line 268
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageLoadingLayout:Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->pdfViewPageLoadingProgress:Landroid/widget/ProgressBar;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 269
    const/4 v2, 0x1

    return v2

    .line 261
    .end local v0    # "aspectRatio":F
    .end local v1    # "height":I
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private final applyCachedBitmap(Landroid/graphics/Bitmap;I)Z
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "displayWidth"    # I

    .line 257
    invoke-direct {p0, p1, p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->applyBitmapToView(Landroid/graphics/Bitmap;I)Z

    move-result v0

    return v0
.end method

.method private final applyFadeInAnimation(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 352
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    move-object v1, v0

    .local v1, "$this$applyFadeInAnimation_u24lambda_u2413":Landroid/view/animation/AlphaAnimation;
    const/4 v2, 0x0

    .line 353
    .local v2, "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$applyFadeInAnimation$1":I
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    check-cast v3, Landroid/view/animation/Interpolator;

    invoke-virtual {v1, v3}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 354
    const-wide/16 v3, 0x12c

    invoke-virtual {v1, v3, v4}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 355
    nop

    .line 352
    .end local v1    # "$this$applyFadeInAnimation_u24lambda_u2413":Landroid/view/animation/AlphaAnimation;
    .end local v2    # "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$applyFadeInAnimation$1":I
    check-cast v0, Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 356
    return-void
.end method

.method private final cancelPendingRenderIfNeeded()V
    .locals 2

    .line 335
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    .line 336
    .local v0, "page":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    if-ltz v0, :cond_1

    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasLiveBitmap()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 339
    :cond_0
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->cancelRender(I)V

    .line 340
    return-void

    .line 337
    :cond_1
    :goto_0
    return-void
.end method

.method private final clearDisplayedBitmapReference()V
    .locals 1

    .line 343
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->displayedBitmap:Landroid/graphics/Bitmap;

    .line 344
    return-void
.end method

.method private final hasLiveBitmap()Z
    .locals 3

    .line 347
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->displayedBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 348
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-lez v2, :cond_1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-lez v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private final renderAndApplyBitmap(III)V
    .locals 10
    .param p1, "page"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 113
    sget-object v4, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    const/4 v0, 0x1

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result v6

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v7, 0x0

    move v5, p2

    invoke-static/range {v4 .. v9}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getBitmap$default(Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;IILandroid/graphics/Bitmap$Config;ILjava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 114
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    .line 116
    .local v2, "expectedGeneration":I
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v4}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v8

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    move-object v1, v0

    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    new-instance v0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda1;

    move-object v3, p0

    move v6, p1

    move v4, p2

    move v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda1;-><init>(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;II)V

    invoke-virtual {v8, p1, v1, v0}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPage(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    .line 163
    return-void
.end method

.method static final renderAndApplyBitmap$lambda$3(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;IIZILandroid/graphics/Bitmap;)Lkotlin/Unit;
    .locals 5
    .param p0, "$bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "$expectedGeneration"    # I
    .param p2, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p3, "$width"    # I
    .param p4, "this$1"    # Lcom/rajat/pdfviewer/PdfViewAdapter;
    .param p5, "$page"    # I
    .param p6, "$height"    # I
    .param p7, "success"    # Z
    .param p8, "pageNo"    # I
    .param p9, "rendered"    # Landroid/graphics/Bitmap;

    .line 117
    const/4 v0, 0x0

    .line 119
    .local v0, "bitmapConsumed":Z
    if-eqz p9, :cond_0

    if-eq p9, p0, :cond_0

    .line 120
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 121
    const/4 v0, 0x1

    .line 124
    :cond_0
    if-eqz p7, :cond_1

    if-ne p9, p0, :cond_1

    .line 128
    const/4 v0, 0x1

    .line 131
    :cond_1
    iget v1, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    if-eq p1, v1, :cond_3

    .line 132
    if-nez v0, :cond_2

    .line 133
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 135
    :cond_2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 138
    :cond_3
    const/4 v1, 0x1

    if-eqz p7, :cond_9

    iget v2, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    if-ne v2, p8, :cond_9

    .line 139
    if-nez p9, :cond_4

    move-object v2, p0

    goto :goto_0

    :cond_4
    move-object v2, p9

    :goto_0
    invoke-direct {p2, v2, p3}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->applyBitmapToView(Landroid/graphics/Bitmap;I)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 140
    const/4 v0, 0x1

    .line 143
    :cond_5
    iget-object v2, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getHeight()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    .line 360
    .local v3, "it":I
    const/4 v4, 0x0

    .line 143
    .local v4, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderAndApplyBitmap$1$fallbackHeight$1":I
    if-lez v3, :cond_6

    goto :goto_1

    :cond_6
    const/4 v1, 0x0

    .end local v3    # "it":I
    .end local v4    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderAndApplyBitmap$1$fallbackHeight$1":I
    :goto_1
    if-eqz v1, :cond_7

    goto :goto_2

    :cond_7
    const/4 v2, 0x0

    :goto_2
    if-eqz v2, :cond_8

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_3

    .line 144
    :cond_8
    invoke-static {p4}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 143
    :goto_3
    nop

    .line 146
    .local v1, "fallbackHeight":I
    invoke-static {p4}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v2

    .line 147
    nop

    .line 148
    nop

    .line 149
    nop

    .line 150
    invoke-static {p4}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getParentView$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/PdfRendererView;->getScrollDirection()I

    move-result v3

    .line 146
    invoke-virtual {v2, p8, p3, v1, v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->schedulePrefetch(IIII)V

    .end local v1    # "fallbackHeight":I
    goto :goto_4

    .line 153
    :cond_9
    iget v2, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    if-ne v2, p5, :cond_a

    iget-boolean v2, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasRetried:Z

    if-nez v2, :cond_a

    .line 154
    iput-boolean v1, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasRetried:Z

    .line 155
    invoke-direct {p2, p5, p3, p6}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->retryRenderOnce(III)V

    .line 159
    :cond_a
    :goto_4
    if-nez v0, :cond_b

    .line 160
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 162
    :cond_b
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method static final renderIfMissing$lambda$12(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILandroid/util/Size;)Lkotlin/Unit;
    .locals 10
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "$page"    # I
    .param p2, "$displayWidth"    # I
    .param p3, "size"    # Landroid/util/Size;

    const-string/jumbo v0, "size"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 305
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    if-eq v0, p1, :cond_0

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 307
    :cond_0
    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 308
    .local v0, "aspectRatio":F
    int-to-float v1, p2

    div-float/2addr v1, v0

    float-to-int v1, v1

    .line 309
    .local v1, "height":I
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasLiveBitmap()Z

    move-result v2

    .line 310
    .local v2, "hasBitmap":Z
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-virtual {v3}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_0

    :cond_1
    move v3, v4

    .line 311
    .local v3, "layoutHeight":I
    :goto_0
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-virtual {v5}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v5

    .line 312
    .local v5, "measuredHeight":I
    const/4 v6, 0x1

    if-lez v5, :cond_2

    move v7, v6

    goto :goto_1

    :cond_2
    move v7, v4

    .line 313
    .local v7, "hasUsableHeight":Z
    :goto_1
    sub-int v8, v3, v1

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-gt v8, v6, :cond_3

    if-eqz v7, :cond_4

    sub-int v8, v5, v1

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    if-le v8, v6, :cond_4

    :cond_3
    move v4, v6

    .line 315
    .local v4, "heightMismatch":Z
    :cond_4
    if-eqz v2, :cond_5

    if-eqz v7, :cond_5

    if-eqz v4, :cond_6

    .line 316
    :cond_5
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-direct {p0, v6, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->updateLayoutParams(Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V

    .line 319
    :cond_6
    if-nez v2, :cond_7

    .line 320
    invoke-direct {p0, p1, p2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->renderAndApplyBitmap(III)V

    .line 321
    const/4 v6, 0x3

    const-wide/16 v8, 0x96

    invoke-direct {p0, p1, v6, v8, v9}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->startPersistentFallbackRender(IIJ)V

    goto :goto_2

    .line 323
    :cond_7
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v6, v6, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageLoadingLayout:Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    iget-object v6, v6, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->pdfViewPageLoadingProgress:Landroid/widget/ProgressBar;

    const/16 v8, 0x8

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 325
    :goto_2
    sget-object v6, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v6
.end method

.method private final retryRenderOnce(III)V
    .locals 6
    .param p1, "page"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 166
    sget-object v0, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move v1, p2

    move v2, p3

    .end local p2    # "width":I
    .end local p3    # "height":I
    .local v1, "width":I
    .local v2, "height":I
    invoke-static/range {v0 .. v5}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->getBitmap$default(Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;IILandroid/graphics/Bitmap$Config;ILjava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 167
    .local p2, "retryBitmap":Landroid/graphics/Bitmap;
    iget p3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    .line 168
    .local p3, "expectedGeneration":I
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v0

    new-instance v3, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;

    invoke-direct {v3, p2, p3, p0, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda3;-><init>(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;I)V

    invoke-virtual {v0, p1, p2, v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->renderPage(ILandroid/graphics/Bitmap;Lkotlin/jvm/functions/Function3;)V

    .line 198
    return-void
.end method

.method static final retryRenderOnce$lambda$4(Landroid/graphics/Bitmap;ILcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IZILandroid/graphics/Bitmap;)Lkotlin/Unit;
    .locals 2
    .param p0, "$retryBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "$expectedGeneration"    # I
    .param p2, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p3, "$width"    # I
    .param p4, "success"    # Z
    .param p5, "retryPageNo"    # I
    .param p6, "rendered"    # Landroid/graphics/Bitmap;

    .line 169
    const/4 v0, 0x0

    .line 171
    .local v0, "bitmapConsumed":Z
    if-eqz p6, :cond_0

    if-eq p6, p0, :cond_0

    .line 172
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 173
    const/4 v0, 0x1

    .line 176
    :cond_0
    if-eqz p4, :cond_1

    if-ne p6, p0, :cond_1

    .line 178
    const/4 v0, 0x1

    .line 181
    :cond_1
    iget v1, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    if-eq p1, v1, :cond_3

    .line 182
    if-nez v0, :cond_2

    .line 183
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 185
    :cond_2
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1

    .line 188
    :cond_3
    if-eqz p4, :cond_5

    iget v1, p2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    if-ne p5, v1, :cond_5

    invoke-direct {p2}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasLiveBitmap()Z

    move-result v1

    if-nez v1, :cond_5

    .line 189
    if-nez p6, :cond_4

    move-object v1, p0

    goto :goto_0

    :cond_4
    move-object v1, p6

    :goto_0
    invoke-direct {p2, v1, p3}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->applyBitmapToView(Landroid/graphics/Bitmap;I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 190
    const/4 v0, 0x1

    .line 194
    :cond_5
    if-nez v0, :cond_6

    .line 195
    sget-object v1, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->INSTANCE:Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;

    invoke-virtual {v1, p0}, Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;->recycleBitmap(Landroid/graphics/Bitmap;)V

    .line 197
    :cond_6
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private final startPersistentFallbackRender(IIJ)V
    .locals 10
    .param p1, "page"    # I
    .param p2, "retries"    # I
    .param p3, "delayMs"    # J

    .line 205
    new-instance v0, Lkotlin/jvm/internal/Ref$IntRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    move-object v5, v0

    .line 207
    .local v5, "attempt":Lkotlin/jvm/internal/Ref$IntRef;
    new-instance v7, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v7}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 208
    .local v7, "task":Lkotlin/jvm/internal/Ref$ObjectRef;
    new-instance v1, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    move-object v2, p0

    move v3, p1

    move v6, p2

    move-wide v8, p3

    .end local p1    # "page":I
    .end local p2    # "retries":I
    .end local p3    # "delayMs":J
    .local v3, "page":I
    .local v6, "retries":I
    .local v8, "delayMs":J
    invoke-direct/range {v1 .. v9}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$startPersistentFallbackRender$1;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;ILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/jvm/internal/Ref$IntRef;ILkotlin/jvm/internal/Ref$ObjectRef;J)V

    iput-object v1, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 238
    iget-object p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->fallbackHandler:Landroid/os/Handler;

    iget-object p2, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    if-nez p2, :cond_0

    const-string/jumbo p2, "task"

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    iget-object p2, v7, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast p2, Ljava/lang/Runnable;

    :goto_0
    invoke-virtual {p1, p2, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 239
    return-void
.end method

.method static synthetic startPersistentFallbackRender$default(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IIJILjava/lang/Object;)V
    .locals 0

    .line 200
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 202
    const/16 p2, 0xa

    .line 200
    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    .line 203
    const-wide/16 p3, 0xc8

    .line 200
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->startPersistentFallbackRender(IIJ)V

    return-void
.end method

.method private final triggerFallbackRender(I)V
    .locals 6
    .param p1, "page"    # I

    .line 242
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v0, v0, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 360
    .local v1, "it":I
    const/4 v2, 0x0

    .line 242
    .local v2, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$triggerFallbackRender$displayWidth$1":I
    const/4 v3, 0x1

    const/4 v4, 0x0

    if-lez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v4

    .end local v1    # "it":I
    .end local v2    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$triggerFallbackRender$displayWidth$1":I
    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v2

    :goto_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_3

    .line 243
    :cond_2
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 360
    .restart local v1    # "it":I
    const/4 v5, 0x0

    .line 243
    .local v5, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$triggerFallbackRender$displayWidth$2":I
    if-lez v1, :cond_3

    goto :goto_2

    :cond_3
    move v3, v4

    .end local v1    # "it":I
    .end local v5    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$triggerFallbackRender$displayWidth$2":I
    :goto_2
    if-eqz v3, :cond_4

    move-object v2, v0

    .line 242
    :cond_4
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_3

    .line 244
    :cond_5
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 242
    :goto_3
    nop

    .line 246
    .local v0, "displayWidth":I
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v1

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda0;

    invoke-direct {v2, p0, p1, v0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda0;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;II)V

    invoke-virtual {v1, p1, v2}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageDimensionsAsync(ILkotlin/jvm/functions/Function1;)V

    .line 254
    return-void
.end method

.method static final triggerFallbackRender$lambda$7(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILandroid/util/Size;)Lkotlin/Unit;
    .locals 3
    .param p0, "this$0"    # Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;
    .param p1, "$page"    # I
    .param p2, "$displayWidth"    # I
    .param p3, "size"    # Landroid/util/Size;

    const-string/jumbo v0, "size"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    if-ne v0, p1, :cond_1

    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasLiveBitmap()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 249
    :cond_0
    invoke-virtual {p3}, Landroid/util/Size;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p3}, Landroid/util/Size;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 250
    .local v0, "aspectRatio":F
    int-to-float v1, p2

    div-float/2addr v1, v0

    float-to-int v1, v1

    .line 251
    .local v1, "height":I
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-direct {p0, v2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->updateLayoutParams(Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V

    .line 252
    invoke-direct {p0, p1, p2, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->renderAndApplyBitmap(III)V

    .line 253
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2

    .line 247
    .end local v0    # "aspectRatio":F
    .end local v1    # "height":I
    :cond_1
    :goto_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private final updateLayoutParams(Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;I)V
    .locals 9
    .param p1, "$this$updateLayoutParams"    # Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .param p2, "height"    # I

    .line 273
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {p1}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    move-object v3, v1

    .local v3, "$this$updateLayoutParams_u24lambda_u248":Landroid/view/ViewGroup$LayoutParams;
    const/4 v4, 0x0

    .line 274
    .local v4, "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$updateLayoutParams$1":I
    iput p2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 275
    instance-of v5, v3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v5, :cond_0

    move-object v5, v3

    check-cast v5, Landroid/view/ViewGroup$MarginLayoutParams;

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_1

    .line 276
    invoke-static {v2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getPageSpacing$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->left:I

    invoke-static {v2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getPageSpacing$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->top:I

    invoke-static {v2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getPageSpacing$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/graphics/Rect;

    move-result-object v8

    iget v8, v8, Landroid/graphics/Rect;->right:I

    invoke-static {v2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getPageSpacing$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 275
    invoke-virtual {v5, v6, v7, v8, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 278
    :cond_1
    nop

    .line 273
    .end local v3    # "$this$updateLayoutParams_u24lambda_u248":Landroid/view/ViewGroup$LayoutParams;
    .end local v4    # "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$updateLayoutParams$1":I
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 279
    invoke-virtual {p1}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 280
    iget-object v0, p1, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestLayout()V

    .line 281
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    :try_start_0
    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    move-object v1, p1

    .line 360
    .local v1, "$this$updateLayoutParams_u24lambda_u249":Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    const/4 v2, 0x0

    .line 281
    .local v2, "$i$a$-runCatching-PdfViewAdapter$PdfPageViewHolder$updateLayoutParams$2":I
    invoke-static {v0}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getParentView$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PdfRendererView;->getRecyclerView()Lcom/rajat/pdfviewer/PinchZoomRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/rajat/pdfviewer/PinchZoomRecyclerView;->requestLayout()V

    .end local v1    # "$this$updateLayoutParams_u24lambda_u249":Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;
    .end local v2    # "$i$a$-runCatching-PdfViewAdapter$PdfPageViewHolder$updateLayoutParams$2":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    sget-object v1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v0}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    :goto_1
    return-void
.end method


# virtual methods
.method public final bind(I)V
    .locals 12
    .param p1, "position"    # I

    .line 69
    invoke-virtual {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->cancelJobs()V

    .line 70
    iput p1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    .line 71
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->clearDisplayedBitmapReference()V

    .line 72
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasRetried:Z

    .line 73
    iput-boolean v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasTriggeredFallbackRender:Z

    .line 74
    iget v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->bindGeneration:I

    .line 75
    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->MainScope()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v3

    iput-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    .line 77
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v3, v3, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 360
    .local v5, "it":I
    const/4 v6, 0x0

    .line 77
    .local v6, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$bind$displayWidth$1":I
    if-lez v5, :cond_0

    goto :goto_0

    :cond_0
    move v4, v2

    .end local v5    # "it":I
    .end local v6    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$bind$displayWidth$1":I
    :goto_0
    const/4 v5, 0x0

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    move-object v3, v5

    :goto_1
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_2

    .line 78
    :cond_2
    iget-object v3, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v3}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 77
    :goto_2
    nop

    .line 80
    .local v3, "displayWidth":I
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v4, v4, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 82
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-virtual {v4}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v4

    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    invoke-virtual {v5}, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->getRoot()Landroid/widget/FrameLayout;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    move-object v6, v5

    .local v6, "$this$bind_u24lambda_u241":Landroid/view/ViewGroup$LayoutParams;
    const/4 v7, 0x0

    .line 83
    .local v7, "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$bind$1":I
    const/4 v8, -0x2

    iput v8, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 84
    nop

    .line 82
    .end local v6    # "$this$bind_u24lambda_u241":Landroid/view/ViewGroup$LayoutParams;
    .end local v7    # "$i$a$-apply-PdfViewAdapter$PdfPageViewHolder$bind$1":I
    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 86
    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v4, v4, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageLoadingLayout:Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;

    iget-object v4, v4, Lcom/rajat/pdfviewer/databinding/PdfViewPageLoadingLayoutBinding;->pdfViewPageLoadingProgress:Landroid/widget/ProgressBar;

    .line 87
    iget-object v5, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v5}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getEnableLoadingForPages$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Z

    move-result v5

    if-eqz v5, :cond_3

    goto :goto_3

    :cond_3
    const/16 v2, 0x8

    .line 86
    :goto_3
    invoke-virtual {v4, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 89
    iget-object v6, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    new-instance v2, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;

    iget-object v4, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    const/4 v5, 0x0

    move-object v1, p0

    move-object v0, v2

    move v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$bind$2;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IILcom/rajat/pdfviewer/PdfViewAdapter;Lkotlin/coroutines/Continuation;)V

    move v11, v3

    .end local v3    # "displayWidth":I
    .local v11, "displayWidth":I
    move-object v8, v0

    check-cast v8, Lkotlin/jvm/functions/Function2;

    const/4 v9, 0x3

    const/4 v10, 0x0

    move-object v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v5 .. v10}, Lkotlinx/coroutines/BuildersKt;->launch$default(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/Job;

    .line 109
    const/4 v5, 0x6

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v6}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->startPersistentFallbackRender$default(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;IIJILjava/lang/Object;)V

    .line 110
    return-void
.end method

.method public final cancelJobs()V
    .locals 3

    .line 285
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->cancelPendingRenderIfNeeded()V

    .line 286
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel$default(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 287
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->fallbackHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 288
    return-void
.end method

.method public final handleDetach()V
    .locals 3

    .line 329
    invoke-direct {p0}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->cancelPendingRenderIfNeeded()V

    .line 330
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel$default(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 331
    iget-object v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->fallbackHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 332
    return-void
.end method

.method public final renderIfMissing()V
    .locals 7

    .line 291
    iget v0, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->currentBoundPage:I

    .line 292
    .local v0, "page":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 293
    return-void

    .line 295
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasRetried:Z

    .line 296
    iput-boolean v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->hasTriggeredFallbackRender:Z

    .line 297
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, v4, v3}, Lkotlinx/coroutines/CoroutineScopeKt;->cancel$default(Lkotlinx/coroutines/CoroutineScope;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 298
    invoke-static {}, Lkotlinx/coroutines/CoroutineScopeKt;->MainScope()Lkotlinx/coroutines/CoroutineScope;

    move-result-object v2

    iput-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->scope:Lkotlinx/coroutines/CoroutineScope;

    .line 300
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemBinding:Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;

    iget-object v2, v2, Lcom/rajat/pdfviewer/databinding/ListItemPdfPageBinding;->pageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 360
    .local v5, "it":I
    const/4 v6, 0x0

    .line 300
    .local v6, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderIfMissing$displayWidth$1":I
    if-lez v5, :cond_1

    move v5, v4

    goto :goto_0

    :cond_1
    move v5, v1

    .end local v5    # "it":I
    .end local v6    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderIfMissing$displayWidth$1":I
    :goto_0
    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    move-object v2, v3

    :goto_1
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_2

    .line 301
    :cond_3
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I

    move-result v5

    .line 360
    .restart local v5    # "it":I
    const/4 v6, 0x0

    .line 301
    .local v6, "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderIfMissing$displayWidth$2":I
    if-lez v5, :cond_4

    move v1, v4

    .end local v5    # "it":I
    .end local v6    # "$i$a$-takeIf-PdfViewAdapter$PdfPageViewHolder$renderIfMissing$displayWidth$2":I
    :cond_4
    if-eqz v1, :cond_5

    move-object v3, v2

    .line 300
    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_2

    .line 302
    :cond_6
    iget-object v1, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v1}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getContext$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 300
    :goto_2
    nop

    .line 304
    .local v1, "displayWidth":I
    iget-object v2, p0, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;->this$0:Lcom/rajat/pdfviewer/PdfViewAdapter;

    invoke-static {v2}, Lcom/rajat/pdfviewer/PdfViewAdapter;->access$getRenderer$p(Lcom/rajat/pdfviewer/PdfViewAdapter;)Lcom/rajat/pdfviewer/PdfRendererCore;

    move-result-object v2

    new-instance v3, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda2;

    invoke-direct {v3, p0, v0, v1}, Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder$$ExternalSyntheticLambda2;-><init>(Lcom/rajat/pdfviewer/PdfViewAdapter$PdfPageViewHolder;II)V

    invoke-virtual {v2, v0, v3}, Lcom/rajat/pdfviewer/PdfRendererCore;->getPageDimensionsAsync(ILkotlin/jvm/functions/Function1;)V

    .line 326
    return-void
.end method
