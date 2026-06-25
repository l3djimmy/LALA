.class public final Landroidx/camera/core/impl/CameraCaptureResults;
.super Ljava/lang/Object;
.source "CameraCaptureResults.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    return-void
.end method

.method public static retrieveCameraCaptureResult(Landroidx/camera/core/ImageInfo;)Landroidx/camera/core/impl/CameraCaptureResult;
    .locals 1
    .param p0, "imageInfo"    # Landroidx/camera/core/ImageInfo;

    .line 39
    instance-of v0, p0, Landroidx/camera/core/internal/CameraCaptureResultImageInfo;

    if-eqz v0, :cond_0

    .line 40
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/internal/CameraCaptureResultImageInfo;

    invoke-virtual {v0}, Landroidx/camera/core/internal/CameraCaptureResultImageInfo;->getCameraCaptureResult()Landroidx/camera/core/impl/CameraCaptureResult;

    move-result-object v0

    return-object v0

    .line 42
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
