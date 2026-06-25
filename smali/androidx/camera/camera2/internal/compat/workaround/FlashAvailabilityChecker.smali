.class public final Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;
.super Ljava/lang/Object;
.source "FlashAvailabilityChecker.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FlashAvailability"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    return-void
.end method

.method public static isFlashAvailable(Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z
    .locals 1
    .param p0, "provider"    # Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;

    .line 50
    const/4 v0, 0x0

    invoke-static {v0, p0}, Landroidx/camera/camera2/internal/compat/workaround/FlashAvailabilityChecker;->isFlashAvailable(ZLandroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z

    move-result v0

    return v0
.end method

.method public static isFlashAvailable(ZLandroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;)Z
    .locals 6
    .param p0, "allowRethrowOnError"    # Z
    .param p1, "provider"    # Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;

    .line 69
    const-string v0, "FlashAvailability"

    const/4 v1, 0x0

    :try_start_0
    sget-object v2, Landroid/hardware/camera2/CameraCharacteristics;->FLASH_INFO_AVAILABLE:Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-interface {p1, v2}, Landroidx/camera/camera2/internal/compat/workaround/CameraCharacteristicsProvider;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .local v2, "flashAvailable":Ljava/lang/Boolean;
    goto :goto_1

    .line 70
    .end local v2    # "flashAvailable":Ljava/lang/Boolean;
    :catch_0
    move-exception v2

    .line 71
    .local v2, "e":Ljava/nio/BufferUnderflowException;
    const-class v3, Landroidx/camera/camera2/internal/compat/quirk/FlashAvailabilityBufferUnderflowQuirk;

    invoke-static {v3}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 72
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 75
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v3

    .line 72
    const-string v4, "Device is known to throw an exception while checking flash availability. Flash is not available. [Manufacturer: %s, Model: %s, API Level: %d]."

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :cond_0
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 84
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v3

    .line 77
    const-string v4, "Exception thrown while checking for flash availability on device not known to throw exceptions during this check. Please file an issue at https://issuetracker.google.com/issues/new?component=618491&template=1257717 with this error message [Manufacturer: %s, Model: %s, API Level: %d].\nFlash is not available."

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 87
    :goto_0
    if-nez p0, :cond_3

    .line 90
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    move-object v2, v3

    .line 93
    .local v2, "flashAvailable":Ljava/lang/Boolean;
    :goto_1
    if-nez v2, :cond_1

    .line 94
    const-string v3, "Characteristics did not contain key FLASH_INFO_AVAILABLE. Flash is not available."

    invoke-static {v0, v3}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    :cond_1
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :cond_2
    return v1

    .line 88
    .local v2, "e":Ljava/nio/BufferUnderflowException;
    :cond_3
    throw v2
.end method
