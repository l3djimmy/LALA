.class public final Landroidx/camera/camera2/interop/Camera2Interop$Extender;
.super Ljava/lang/Object;
.source "Camera2Interop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/interop/Camera2Interop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Extender"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/camera/core/ExtendableBuilder<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/camera/core/ExtendableBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/ExtendableBuilder<",
            "TT;>;)V"
        }
    .end annotation

    .line 60
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    .local p1, "baseBuilder":Landroidx/camera/core/ExtendableBuilder;, "Landroidx/camera/core/ExtendableBuilder<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    .line 62
    return-void
.end method


# virtual methods
.method public setCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ValueT:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TValueT;>;TValueT;)",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 79
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    .local p1, "key":Landroid/hardware/camera2/CaptureRequest$Key;, "Landroid/hardware/camera2/CaptureRequest$Key<TValueT;>;"
    .local p2, "value":Ljava/lang/Object;, "TValueT;"
    invoke-static {p1}, Landroidx/camera/camera2/impl/Camera2ImplConfig;->createCaptureRequestOption(Landroid/hardware/camera2/CaptureRequest$Key;)Landroidx/camera/core/impl/Config$Option;

    move-result-object v0

    .line 80
    .local v0, "opt":Landroidx/camera/core/impl/Config$Option;, "Landroidx/camera/core/impl/Config$Option<Ljava/lang/Object;>;"
    iget-object v1, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v1}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v1

    sget-object v2, Landroidx/camera/core/impl/Config$OptionPriority;->ALWAYS_OVERRIDE:Landroidx/camera/core/impl/Config$OptionPriority;

    invoke-interface {v1, v0, v2, p2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Landroidx/camera/core/impl/Config$OptionPriority;Ljava/lang/Object;)V

    .line 82
    return-object p0
.end method

.method public setCaptureRequestTemplate(I)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 3
    .param p1, "templateType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 100
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->TEMPLATE_TYPE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 101
    return-object p0
.end method

.method public setDeviceStateCallback(Landroid/hardware/camera2/CameraDevice$StateCallback;)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 2
    .param p1, "stateCallback"    # Landroid/hardware/camera2/CameraDevice$StateCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraDevice$StateCallback;",
            ")",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 149
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->DEVICE_STATE_CALLBACK_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 151
    return-object p0
.end method

.method public setPhysicalCameraId(Ljava/lang/String;)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 2
    .param p1, "cameraId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 229
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->SESSION_PHYSICAL_CAMERA_ID_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 231
    return-object p0
.end method

.method public setSessionCaptureCallback(Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 2
    .param p1, "captureCallback"    # Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;",
            ")",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 201
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->SESSION_CAPTURE_CALLBACK_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 203
    return-object p0
.end method

.method public setSessionStateCallback(Landroid/hardware/camera2/CameraCaptureSession$StateCallback;)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 2
    .param p1, "stateCallback"    # Landroid/hardware/camera2/CameraCaptureSession$StateCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/camera2/CameraCaptureSession$StateCallback;",
            ")",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 174
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->SESSION_STATE_CALLBACK_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-interface {v0, v1, p1}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 176
    return-object p0
.end method

.method public setStreamUseCase(J)Landroidx/camera/camera2/interop/Camera2Interop$Extender;
    .locals 3
    .param p1, "streamUseCase"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Landroidx/camera/camera2/interop/Camera2Interop$Extender<",
            "TT;>;"
        }
    .end annotation

    .line 126
    .local p0, "this":Landroidx/camera/camera2/interop/Camera2Interop$Extender;, "Landroidx/camera/camera2/interop/Camera2Interop$Extender<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2Interop$Extender;->mBaseBuilder:Landroidx/camera/core/ExtendableBuilder;

    invoke-interface {v0}, Landroidx/camera/core/ExtendableBuilder;->getMutableConfig()Landroidx/camera/core/impl/MutableConfig;

    move-result-object v0

    sget-object v1, Landroidx/camera/camera2/impl/Camera2ImplConfig;->STREAM_USE_CASE_OPTION:Landroidx/camera/core/impl/Config$Option;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroidx/camera/core/impl/MutableConfig;->insertOption(Landroidx/camera/core/impl/Config$Option;Ljava/lang/Object;)V

    .line 127
    return-object p0
.end method
