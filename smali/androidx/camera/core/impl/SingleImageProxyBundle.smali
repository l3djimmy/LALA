.class public final Landroidx/camera/core/impl/SingleImageProxyBundle;
.super Ljava/lang/Object;
.source "SingleImageProxyBundle.java"

# interfaces
.implements Landroidx/camera/core/impl/ImageProxyBundle;


# instance fields
.field private final mCaptureId:I

.field private final mImageProxy:Landroidx/camera/core/ImageProxy;


# direct methods
.method constructor <init>(Landroidx/camera/core/ImageProxy;I)V
    .locals 0
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "captureId"    # I

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput p2, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mCaptureId:I

    .line 71
    iput-object p1, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mImageProxy:Landroidx/camera/core/ImageProxy;

    .line 72
    return-void
.end method

.method public constructor <init>(Landroidx/camera/core/ImageProxy;Ljava/lang/String;)V
    .locals 4
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "tagBundleKey"    # Ljava/lang/String;

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->getImageInfo()Landroidx/camera/core/ImageInfo;

    move-result-object v0

    .line 51
    .local v0, "imageInfo":Landroidx/camera/core/ImageInfo;
    if-eqz v0, :cond_1

    .line 55
    invoke-interface {v0}, Landroidx/camera/core/ImageInfo;->getTagBundle()Landroidx/camera/core/impl/TagBundle;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroidx/camera/core/impl/TagBundle;->getTag(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 57
    .local v1, "tagValue":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 61
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mCaptureId:I

    .line 62
    iput-object p1, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mImageProxy:Landroidx/camera/core/ImageProxy;

    .line 63
    return-void

    .line 58
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "ImageProxy has no associated tag"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 52
    .end local v1    # "tagValue":Ljava/lang/Integer;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "ImageProxy has no associated ImageInfo"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 76
    iget-object v0, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mImageProxy:Landroidx/camera/core/ImageProxy;

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy;->close()V

    .line 77
    return-void
.end method

.method public getCaptureIds()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 92
    iget v0, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mCaptureId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getImageProxy(I)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 2
    .param p1, "captureId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/camera/core/ImageProxy;",
            ">;"
        }
    .end annotation

    .line 82
    iget v0, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mCaptureId:I

    if-eq p1, v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Capture id does not exist in the bundle"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFailedFuture(Ljava/lang/Throwable;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0

    .line 86
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/SingleImageProxyBundle;->mImageProxy:Landroidx/camera/core/ImageProxy;

    invoke-static {v0}, Landroidx/camera/core/impl/utils/futures/Futures;->immediateFuture(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
