.class final Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;
.super Ljava/lang/Object;
.source "Camera2SessionOptionUnpacker.java"

# interfaces
.implements Landroidx/camera/core/impl/SessionConfig$OptionUnpacker;


# static fields
.field static final INSTANCE:Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 43
    new-instance v0, Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;

    invoke-direct {v0}, Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;-><init>()V

    sput-object v0, Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;->INSTANCE:Landroidx/camera/camera2/internal/Camera2SessionOptionUnpacker;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public unpack(Landroid/util/Size;Landroidx/camera/core/impl/UseCaseConfig;Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 8
    .param p1, "resolution"    # Landroid/util/Size;
    .param p3, "builder"    # Landroidx/camera/core/impl/SessionConfig$Builder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Size;",
            "Landroidx/camera/core/impl/UseCaseConfig<",
            "*>;",
            "Landroidx/camera/core/impl/SessionConfig$Builder;",
            ")V"
        }
    .end annotation

    .line 51
    .local p2, "config":Landroidx/camera/core/impl/UseCaseConfig;, "Landroidx/camera/core/impl/UseCaseConfig<*>;"
    nop

    .line 52
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Landroidx/camera/core/impl/UseCaseConfig;->getDefaultSessionConfig(Landroidx/camera/core/impl/SessionConfig;)Landroidx/camera/core/impl/SessionConfig;

    move-result-object v1

    .line 54
    .local v1, "defaultSessionConfig":Landroidx/camera/core/impl/SessionConfig;
    invoke-static {}, Landroidx/camera/core/impl/OptionsBundle;->emptyBundle()Landroidx/camera/core/impl/OptionsBundle;

    move-result-object v2

    .line 55
    .local v2, "implOptions":Landroidx/camera/core/impl/Config;
    invoke-static {}, Landroidx/camera/core/impl/SessionConfig;->defaultEmptySessionConfig()Landroidx/camera/core/impl/SessionConfig;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/impl/SessionConfig;->getTemplateType()I

    move-result v3

    .line 58
    .local v3, "templateType":I
    if-eqz v1, :cond_0

    .line 59
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getTemplateType()I

    move-result v3

    .line 60
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getDeviceStateCallbacks()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p3, v4}, Landroidx/camera/core/impl/SessionConfig$Builder;->addAllDeviceStateCallbacks(Ljava/util/Collection;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 61
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getSessionStateCallbacks()Ljava/util/List;

    move-result-object v4

    invoke-virtual {p3, v4}, Landroidx/camera/core/impl/SessionConfig$Builder;->addAllSessionStateCallbacks(Ljava/util/List;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 62
    nop

    .line 63
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getRepeatingCameraCaptureCallbacks()Ljava/util/List;

    move-result-object v4

    .line 62
    invoke-virtual {p3, v4}, Landroidx/camera/core/impl/SessionConfig$Builder;->addAllRepeatingCameraCaptureCallbacks(Ljava/util/Collection;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 64
    invoke-virtual {v1}, Landroidx/camera/core/impl/SessionConfig;->getImplementationOptions()Landroidx/camera/core/impl/Config;

    move-result-object v2

    .line 68
    :cond_0
    invoke-virtual {p3, v2}, Landroidx/camera/core/impl/SessionConfig$Builder;->setImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 71
    instance-of v4, p2, Landroidx/camera/core/impl/PreviewConfig;

    if-eqz v4, :cond_1

    .line 72
    invoke-static {p1, p3}, Landroidx/camera/camera2/internal/compat/workaround/PreviewPixelHDRnet;->setHDRnet(Landroid/util/Size;Landroidx/camera/core/impl/SessionConfig$Builder;)V

    .line 76
    :cond_1
    new-instance v4, Landroidx/camera/camera2/impl/Camera2ImplConfig;

    invoke-direct {v4, p2}, Landroidx/camera/camera2/impl/Camera2ImplConfig;-><init>(Landroidx/camera/core/impl/Config;)V

    .line 79
    .local v4, "camera2Config":Landroidx/camera/camera2/impl/Camera2ImplConfig;
    invoke-virtual {v4, v3}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getCaptureRequestTemplate(I)I

    move-result v5

    invoke-virtual {p3, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->setTemplateType(I)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 82
    nop

    .line 84
    invoke-static {}, Landroidx/camera/camera2/internal/CameraDeviceStateCallbacks;->createNoOpCallback()Landroid/hardware/camera2/CameraDevice$StateCallback;

    move-result-object v5

    .line 83
    invoke-virtual {v4, v5}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getDeviceStateCallback(Landroid/hardware/camera2/CameraDevice$StateCallback;)Landroid/hardware/camera2/CameraDevice$StateCallback;

    move-result-object v5

    .line 82
    invoke-virtual {p3, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addDeviceStateCallback(Landroid/hardware/camera2/CameraDevice$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 85
    nop

    .line 87
    invoke-static {}, Landroidx/camera/camera2/internal/CameraCaptureSessionStateCallbacks;->createNoOpCallback()Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    move-result-object v5

    .line 86
    invoke-virtual {v4, v5}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroid/hardware/camera2/CameraCaptureSession$StateCallback;

    move-result-object v5

    .line 85
    invoke-virtual {p3, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 88
    nop

    .line 91
    invoke-static {}, Landroidx/camera/camera2/internal/Camera2CaptureCallbacks;->createNoOpCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v5

    .line 90
    invoke-virtual {v4, v5}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getSessionCaptureCallback(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v5

    .line 89
    invoke-static {v5}, Landroidx/camera/camera2/internal/CaptureCallbackContainer;->create(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/internal/CaptureCallbackContainer;

    move-result-object v5

    .line 88
    invoke-virtual {p3, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addCameraCaptureCallback(Landroidx/camera/core/impl/CameraCaptureCallback;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 94
    invoke-static {}, Landroidx/camera/core/impl/MutableOptionsBundle;->create()Landroidx/camera/core/impl/MutableOptionsBundle;

    move-result-object v5

    .line 95
    .local v5, "extendedConfig":Landroidx/camera/core/impl/MutableOptionsBundle;
    sget-object v6, Landroidx/camera/camera2/impl/Camera2ImplConfig;->CAMERA_EVENT_CALLBACK_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 96
    invoke-static {}, Landroidx/camera/camera2/impl/CameraEventCallbacks;->createEmptyCallback()Landroidx/camera/camera2/impl/CameraEventCallbacks;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getCameraEventCallback(Landroidx/camera/camera2/impl/CameraEventCallbacks;)Landroidx/camera/camera2/impl/CameraEventCallbacks;

    move-result-object v7

    .line 95
    invoke-virtual {v5, v6, v7}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 97
    sget-object v6, Landroidx/camera/camera2/impl/Camera2ImplConfig;->SESSION_PHYSICAL_CAMERA_ID_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 98
    invoke-virtual {v4, v0}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getPhysicalCameraId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 97
    invoke-virtual {v5, v6, v0}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 99
    sget-object v0, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    .line 100
    const-wide/16 v6, -0x1

    invoke-virtual {v4, v6, v7}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getStreamUseCase(J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    .line 99
    invoke-virtual {v5, v0, v6}, Landroidx/camera/core/impl/MutableOptionsBundle;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 101
    invoke-virtual {p3, v5}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 104
    invoke-virtual {v4}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->getCaptureRequestOptions()Landroidx/camera/camera2/interop/CaptureRequestOptions;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroidx/camera/core/impl/SessionConfig$Builder;->addImplementationOptions(Landroidx/camera/core/impl/Config;)Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 105
    return-void
.end method
