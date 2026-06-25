.class Landroidx/camera/camera2/internal/ZslControlImpl$1;
.super Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
.source "ZslControlImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/camera/camera2/internal/ZslControlImpl;->addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/camera/camera2/internal/ZslControlImpl;


# direct methods
.method constructor <init>(Landroidx/camera/camera2/internal/ZslControlImpl;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/camera/camera2/internal/ZslControlImpl;

    .line 198
    iput-object p1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$1;->this$0:Landroidx/camera/camera2/internal/ZslControlImpl;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigureFailed(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 0
    .param p1, "cameraCaptureSession"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 211
    return-void
.end method

.method public onConfigured(Landroid/hardware/camera2/CameraCaptureSession;)V
    .locals 3
    .param p1, "cameraCaptureSession"    # Landroid/hardware/camera2/CameraCaptureSession;

    .line 202
    invoke-virtual {p1}, Landroid/hardware/camera2/CameraCaptureSession;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    .line 203
    .local v0, "surface":Landroid/view/Surface;
    if-eqz v0, :cond_0

    .line 204
    iget-object v1, p0, Landroidx/camera/camera2/internal/ZslControlImpl$1;->this$0:Landroidx/camera/camera2/internal/ZslControlImpl;

    .line 205
    const/4 v2, 0x1

    invoke-static {v0, v2}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object v2

    iput-object v2, v1, Landroidx/camera/camera2/internal/ZslControlImpl;->mReprocessingImageWriter:Landroid/media/ImageWriter;

    .line 207
    :cond_0
    return-void
.end method
