.class public Landroidx/camera/camera2/internal/ZslControlNoOpImpl;
.super Ljava/lang/Object;
.source "ZslControlNoOpImpl.java"

# interfaces
.implements Landroidx/camera/camera2/internal/ZslControl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addZslConfig(Landroidx/camera/core/impl/SessionConfig$Builder;)V
    .locals 0
    .param p1, "sessionConfigBuilder"    # Landroidx/camera/core/impl/SessionConfig$Builder;

    .line 30
    return-void
.end method

.method public dequeueImageFromBuffer()Landroidx/camera/core/ImageProxy;
    .locals 1

    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public enqueueImageToImageWriter(Landroidx/camera/core/ImageProxy;)Z
    .locals 1
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public isZslDisabledByFlashMode()Z
    .locals 1

    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public isZslDisabledByUserCaseConfig()Z
    .locals 1

    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public setZslDisabledByFlashMode(Z)V
    .locals 0
    .param p1, "disabled"    # Z

    .line 43
    return-void
.end method

.method public setZslDisabledByUserCaseConfig(Z)V
    .locals 0
    .param p1, "disabled"    # Z

    .line 34
    return-void
.end method
