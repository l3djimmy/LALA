.class public final Landroidx/camera/core/imagecapture/CameraRequest;
.super Ljava/lang/Object;
.source "CameraRequest.java"


# instance fields
.field private final mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

.field private final mCaptureConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Landroidx/camera/core/imagecapture/TakePictureCallback;)V
    .locals 0
    .param p2, "callback"    # Landroidx/camera/core/imagecapture/TakePictureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;",
            "Landroidx/camera/core/imagecapture/TakePictureCallback;",
            ")V"
        }
    .end annotation

    .line 37
    .local p1, "captureConfigs":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CaptureConfig;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCaptureConfigs:Ljava/util/List;

    .line 39
    iput-object p2, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

    .line 40
    return-void
.end method


# virtual methods
.method getCaptureConfigs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CaptureConfig;",
            ">;"
        }
    .end annotation

    .line 44
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCaptureConfigs:Ljava/util/List;

    return-object v0
.end method

.method isAborted()Z
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/camera/core/imagecapture/CameraRequest;->mCallback:Landroidx/camera/core/imagecapture/TakePictureCallback;

    invoke-interface {v0}, Landroidx/camera/core/imagecapture/TakePictureCallback;->isAborted()Z

    move-result v0

    return v0
.end method
