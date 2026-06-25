.class abstract Landroidx/camera/view/PreviewViewImplementation;
.super Ljava/lang/Object;
.source "PreviewViewImplementation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;
    }
.end annotation


# instance fields
.field mParent:Landroid/widget/FrameLayout;

.field private final mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

.field mResolution:Landroid/util/Size;

.field private mWasSurfaceProvided:Z


# direct methods
.method constructor <init>(Landroid/widget/FrameLayout;Landroidx/camera/view/PreviewTransformation;)V
    .locals 1
    .param p1, "parent"    # Landroid/widget/FrameLayout;
    .param p2, "previewTransform"    # Landroidx/camera/view/PreviewTransformation;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/camera/view/PreviewViewImplementation;->mWasSurfaceProvided:Z

    .line 59
    iput-object p1, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    .line 60
    iput-object p2, p0, Landroidx/camera/view/PreviewViewImplementation;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    .line 61
    return-void
.end method


# virtual methods
.method getBitmap()Landroid/graphics/Bitmap;
    .locals 5

    .line 117
    invoke-virtual {p0}, Landroidx/camera/view/PreviewViewImplementation;->getPreviewBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 118
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-nez v0, :cond_0

    .line 119
    const/4 v1, 0x0

    return-object v1

    .line 121
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/PreviewViewImplementation;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    new-instance v2, Landroid/util/Size;

    iget-object v3, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    .line 122
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    iget-object v4, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v3, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    .line 123
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    move-result v3

    .line 121
    invoke-virtual {v1, v0, v2, v3}, Landroidx/camera/view/PreviewTransformation;->createTransformedBitmap(Landroid/graphics/Bitmap;Landroid/util/Size;I)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1
.end method

.method abstract getPreview()Landroid/view/View;
.end method

.method abstract getPreviewBitmap()Landroid/graphics/Bitmap;
.end method

.method abstract initializePreview()V
.end method

.method abstract onAttachedToWindow()V
.end method

.method abstract onDetachedFromWindow()V
.end method

.method onSurfaceProvided()V
    .locals 1

    .line 96
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/camera/view/PreviewViewImplementation;->mWasSurfaceProvided:Z

    .line 97
    invoke-virtual {p0}, Landroidx/camera/view/PreviewViewImplementation;->redrawPreview()V

    .line 98
    return-void
.end method

.method abstract onSurfaceRequested(Landroidx/camera/core/SurfaceRequest;Landroidx/camera/view/PreviewViewImplementation$OnSurfaceNotInUseListener;)V
.end method

.method redrawPreview()V
    .locals 5

    .line 83
    invoke-virtual {p0}, Landroidx/camera/view/PreviewViewImplementation;->getPreview()Landroid/view/View;

    move-result-object v0

    .line 87
    .local v0, "preview":Landroid/view/View;
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Landroidx/camera/view/PreviewViewImplementation;->mWasSurfaceProvided:Z

    if-nez v1, :cond_0

    goto :goto_0

    .line 90
    :cond_0
    iget-object v1, p0, Landroidx/camera/view/PreviewViewImplementation;->mPreviewTransform:Landroidx/camera/view/PreviewTransformation;

    new-instance v2, Landroid/util/Size;

    iget-object v3, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getWidth()I

    move-result v3

    iget-object v4, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    .line 91
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    iget-object v3, p0, Landroidx/camera/view/PreviewViewImplementation;->mParent:Landroid/widget/FrameLayout;

    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutDirection()I

    move-result v3

    .line 90
    invoke-virtual {v1, v2, v3, v0}, Landroidx/camera/view/PreviewTransformation;->transformView(Landroid/util/Size;ILandroid/view/View;)V

    .line 92
    return-void

    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method setFrameUpdateListener(Ljava/util/concurrent/Executor;Landroidx/camera/view/PreviewView$OnFrameUpdateListener;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "listener"    # Landroidx/camera/view/PreviewView$OnFrameUpdateListener;

    .line 130
    return-void
.end method

.method abstract waitForNextFrame()Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end method
