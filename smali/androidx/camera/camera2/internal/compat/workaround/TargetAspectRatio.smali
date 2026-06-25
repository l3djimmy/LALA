.class public Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio;
.super Ljava/lang/Object;
.source "TargetAspectRatio.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/camera2/internal/compat/workaround/TargetAspectRatio$Ratio;
    }
.end annotation


# static fields
.field public static final RATIO_16_9:I = 0x1

.field public static final RATIO_4_3:I = 0x0

.field public static final RATIO_MAX_JPEG:I = 0x2

.field public static final RATIO_ORIGINAL:I = 0x3


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)I
    .locals 3
    .param p1, "cameraId"    # Ljava/lang/String;
    .param p2, "cameraCharacteristicsCompat"    # Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;

    .line 55
    const-class v0, Landroidx/camera/camera2/internal/compat/quirk/Nexus4AndroidLTargetAspectRatioQuirk;

    .line 56
    invoke-static {v0}, Landroidx/camera/camera2/internal/compat/quirk/DeviceQuirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v0

    check-cast v0, Landroidx/camera/camera2/internal/compat/quirk/Nexus4AndroidLTargetAspectRatioQuirk;

    .line 57
    .local v0, "nexus4AndroidLQuirk":Landroidx/camera/camera2/internal/compat/quirk/Nexus4AndroidLTargetAspectRatioQuirk;
    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {v0}, Landroidx/camera/camera2/internal/compat/quirk/Nexus4AndroidLTargetAspectRatioQuirk;->getCorrectedAspectRatio()I

    move-result v1

    return v1

    .line 61
    :cond_0
    invoke-static {p1, p2}, Landroidx/camera/camera2/internal/compat/quirk/CameraQuirks;->get(Ljava/lang/String;Landroidx/camera/camera2/internal/compat/CameraCharacteristicsCompat;)Landroidx/camera/core/impl/Quirks;

    move-result-object v1

    const-class v2, Landroidx/camera/camera2/internal/compat/quirk/AspectRatioLegacyApi21Quirk;

    .line 62
    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/Quirks;->get(Ljava/lang/Class;)Landroidx/camera/core/impl/Quirk;

    move-result-object v1

    check-cast v1, Landroidx/camera/camera2/internal/compat/quirk/AspectRatioLegacyApi21Quirk;

    .line 63
    .local v1, "quirk":Landroidx/camera/camera2/internal/compat/quirk/AspectRatioLegacyApi21Quirk;
    if-eqz v1, :cond_1

    .line 64
    invoke-virtual {v1}, Landroidx/camera/camera2/internal/compat/quirk/AspectRatioLegacyApi21Quirk;->getCorrectedAspectRatio()I

    move-result v2

    return v2

    .line 67
    :cond_1
    const/4 v2, 0x3

    return v2
.end method
