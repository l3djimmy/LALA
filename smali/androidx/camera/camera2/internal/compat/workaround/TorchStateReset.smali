.class public Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;
.super Ljava/lang/Object;
.source "TorchStateReset.java"


# instance fields
.field private final mIsImageCaptureTorchIsClosedQuirkEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/TorchIsClosedAfterImageCapturingQuirk;

    .line 43
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;->mIsImageCaptureTorchIsClosedQuirkEnabled:Z

    .line 44
    return-void
.end method


# virtual methods
.method public createTorchResetRequest(Landroidx/camera/core/impl/CaptureConfig;)Landroidx/camera/core/impl/CaptureConfig;
    .locals 4
    .param p1, "repeatingConfig"    # Landroidx/camera/core/impl/CaptureConfig;

    .line 78
    new-instance v0, Landroidx/camera/core/impl/CaptureConfig$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;-><init>()V

    .line 79
    .local v0, "captureConfigBuilder":Landroidx/camera/core/impl/CaptureConfig$Builder;
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getTemplateType()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->setTemplateType(I)V

    .line 82
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getSurfaces()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/DeferrableSurface;

    .line 83
    .local v2, "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addSurface(Landroidx/camera/core/impl/DeferrableSurface;)V

    .line 84
    .end local v2    # "deferrableSurface":Landroidx/camera/core/impl/DeferrableSurface;
    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {p1}, Landroidx/camera/core/impl/CaptureConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 87
    new-instance v1, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    invoke-direct {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;-><init>()V

    .line 88
    .local v1, "builder":Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;

    .line 90
    invoke-virtual {v1}, Landroidx/camera/camera2/impl/Camera2ImplConfig$Builder;->build()Landroidx/camera/camera2/impl/Camera2ImplConfig;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroidx/camera/core/impl/CaptureConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)V

    .line 92
    invoke-virtual {v0}, Landroidx/camera/core/impl/CaptureConfig$Builder;->build()Landroidx/camera/core/impl/CaptureConfig;

    move-result-object v2

    return-object v2
.end method

.method public isTorchResetRequired(Ljava/util/List;Z)Z
    .locals 5
    .param p2, "isSingleCapture"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/CaptureRequest;",
            ">;Z)Z"
        }
    .end annotation

    .line 53
    .local p1, "captureRequestList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/camera2/CaptureRequest;>;"
    iget-boolean v0, p0, Landroidx/camera/camera2/internal/compat/workaround/TorchStateReset;->mIsImageCaptureTorchIsClosedQuirkEnabled:Z

    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    .line 54
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/CaptureRequest;

    .line 55
    .local v1, "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->FLASH_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v1, v2}, Landroid/hardware/camera2/CaptureRequest;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 56
    .local v2, "flashMode":Ljava/lang/Integer;
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 57
    const/4 v0, 0x1

    return v0

    .line 59
    .end local v1    # "captureRequest":Landroid/hardware/camera2/CaptureRequest;
    .end local v2    # "flashMode":Ljava/lang/Integer;
    :cond_0
    goto :goto_0

    .line 62
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
