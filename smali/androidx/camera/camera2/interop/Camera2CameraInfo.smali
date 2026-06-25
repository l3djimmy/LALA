.class public final Landroidx/camera/camera2/interop/Camera2CameraInfo;
.super Ljava/lang/Object;
.source "Camera2CameraInfo.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Camera2CameraInfo"


# instance fields
.field private final mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;


# direct methods
.method public constructor <init>(Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;)V
    .locals 0
    .param p1, "camera2CameraInfoImpl"    # Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 49
    return-void
.end method

.method public static extractCameraCharacteristics(Landroidx/camera/core/CameraInfo;)Landroid/hardware/camera2/CameraCharacteristics;
    .locals 3
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 125
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getImplementation()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 126
    .local v0, "cameraInfoImpl":Landroidx/camera/core/impl/CameraInfoInternal;
    instance-of v1, v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    const-string v2, "CameraInfo does not contain any Camera2 information."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkState(ZLjava/lang/String;)V

    .line 128
    move-object v1, v0

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    .line 129
    .local v1, "impl":Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->toCameraCharacteristics()Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v2

    return-object v2
.end method

.method public static from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/camera2/interop/Camera2CameraInfo;
    .locals 3
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 62
    move-object v0, p0

    check-cast v0, Landroidx/camera/core/impl/CameraInfoInternal;

    .line 63
    invoke-interface {v0}, Landroidx/camera/core/impl/CameraInfoInternal;->getImplementation()Landroidx/camera/core/impl/CameraInfoInternal;

    move-result-object v0

    .line 64
    .local v0, "cameraInfoImpl":Landroidx/camera/core/impl/CameraInfoInternal;
    instance-of v1, v0, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    const-string v2, "CameraInfo doesn\'t contain Camera2 implementation."

    invoke-static {v1, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 66
    move-object v1, v0

    check-cast v1, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v1}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCamera2CameraInfo()Landroidx/camera/camera2/interop/Camera2CameraInfo;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getCameraCharacteristic(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 104
    .local p1, "key":Landroid/hardware/camera2/CameraCharacteristics$Key;, "Landroid/hardware/camera2/CameraCharacteristics$Key<TT;>;"
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsCompat()Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getCameraCharacteristicsMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            ">;"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraCharacteristicsMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getCameraId()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Landroidx/camera/camera2/interop/Camera2CameraInfo;->mCamera2CameraInfoImpl:Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;

    invoke-virtual {v0}, Landroidx/camera/camera2/internal/Camera2CameraInfoImpl;->getCameraId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
