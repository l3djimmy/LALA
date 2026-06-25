.class final Landroidx/camera/camera2/internal/ZslUtil;
.super Ljava/lang/Object;
.source "ZslUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static isCapabilitySupported(Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;I)Z
    .locals 5
    .param p0, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;
    .param p1, "targetCapability"    # I

    .line 37
    sget-object v0, Landroid/hardware/camera2/CameraCharacteristics;->REQUEST_AVAILABLE_CAPABILITIES:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, v0}, Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 38
    .local v0, "capabilities":[I
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 39
    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_1

    aget v4, v0, v3

    .line 40
    .local v4, "capability":I
    if-ne v4, p1, :cond_0

    .line 41
    const/4 v1, 0x1

    return v1

    .line 39
    .end local v4    # "capability":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 45
    :cond_1
    return v1
.end method
